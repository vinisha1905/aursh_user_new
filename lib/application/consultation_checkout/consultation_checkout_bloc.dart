import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:ayursh/domain/model/business/session_selected_info.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/request/consultation_booking_request.dart';
import 'package:ayursh/domain/model/response/booking_user_model.dart';
import 'package:ayursh/domain/model/response/consultation_create_order_model.dart';
import 'package:ayursh/domain/model/response/doctor_model.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:ayursh/domain/repository/payment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'consultation_checkout_bloc.freezed.dart';
part 'consultation_checkout_event.dart';
part 'consultation_checkout_state.dart';

class ConsultationCheckoutBloc
    extends Bloc<ConsultationCheckoutEvent, ConsultationCheckoutState> {
  final PaymentRepository paymentRepository;
  final OnboardingRepository onboardingRepository;

  ConsultationCheckoutBloc(
      {required this.paymentRepository, required this.onboardingRepository})
      : super(ConsultationCheckoutState.initialize());

  @override
  Stream<ConsultationCheckoutState> mapEventToState(
      ConsultationCheckoutEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(
          doctorInfo: e.doctorInfo,
          bookingSlotInfo: e.bookingSlotInfo,
          bookingUser: e.bookingUser,
          sessionSelectedInfo: e.sessionSelectedInfo);
    }, createOrder: (e) async* {
      yield state.copyWith(
          loadingState: LoadingState.isLoading, createOrderResult: null);
      var response = await paymentRepository.createConsultationOrder(
          state.doctorInfo!.consultationFee,
          state.sessionSelectedInfo?.totalSession,
          state.sessionSelectedInfo?.pricePerSession);
      print(response);
      yield* response.fold((error) async* {
        yield state.copyWith(
            loadingState: LoadingState.isCompleted,
            errorMessage: error,
            createOrderResult: null);
      }, (createOrderResp) async* {
        if (createOrderResp.success) {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              createOrderResult: createOrderResp.createOrderModel,
              isConsumedOrderId: false);
        } else {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              errorMessage: createOrderResp.message ?? 'Unknown error',
              createOrderResult: null);
        }
      });
    }, checkoutOrder: (e) async* {
      yield state.copyWith(
          loadingState: LoadingState.isLoading,
          razorpayPaymentId: e.razorpayPaymentId,
          razorpaySignature: e.razorpaySignature);
      var response = await paymentRepository.checkoutOrder(
          state.createOrderResult?.receipt ?? '',
          e.razorpayPaymentId,
          e.razorpaySignature);
      print(response);
      yield* response.fold((l) async* {
        yield state.copyWith(
            loadingState: LoadingState.isCompleted, errorMessage: l);
      }, (checkoutResp) async* {
        if (checkoutResp.success) {
          if (checkoutResp.checkoutModel.isPaymentSuccess) {
            //Call booking api
            yield* _bookDoctorConsultation();
          } else {
            yield state.copyWith(
                loadingState: LoadingState.isCompleted,
                errorMessage: 'Payment Failed');
          }
        } else {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              errorMessage: 'Create Order Failed');
        }
      });
    }, resetError: (e) async* {
      yield state.copyWith(errorMessage: null);
    }, consumeOrderId: (e) async* {
      yield state.copyWith(isConsumedOrderId: e.isConsumed);
    }, trackPayment: (e) async* {
      await paymentRepository.trackPayment(e.data);
      // yield state;
    });
  }

  Stream<ConsultationCheckoutState> _bookDoctorConsultation() async* {
    var doctorInfo = state.doctorInfo!;
    var bookingUser = state.bookingUser!;
    var bookingSlotInfo = state.bookingSlotInfo!;
    var scheduledAt = bookingSlotInfo.toServerScheduleTime();
    print(scheduledAt);
    var bookingRequest = ConsultationBookingRequest(
        doctorInfo.id,
        bookingUser.bookingForName,
        bookingUser.bookingForAge,
        bookingUser.bookingForGender,
        scheduledAt,
        doctorInfo.consultationFee,
        0,
        doctorInfo.consultationFee,
        state.sessionSelectedInfo?.sessionDurationInMin ?? 0,
        state.createOrderResult!.notes.consultationBookingId,
        state.createOrderResult!.ayurshOrderId);
    var response =
        await onboardingRepository.bookDoctorConsultation(bookingRequest);
    print(response);
    yield* response.fold((l) async* {
      yield state.copyWith(
          loadingState: LoadingState.isCompleted, errorMessage: l);
    }, (bookConsultationRsp) async* {
      if (bookConsultationRsp.success) {
        if (bookConsultationRsp.success) {
          yield state.copyWith(bookingCompleted: true);
        } else {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              errorMessage: bookConsultationRsp.message);
        }
      } else {
        yield state.copyWith(
            loadingState: LoadingState.isCompleted,
            errorMessage: 'Booking Failed');
      }
    });
  }
}
