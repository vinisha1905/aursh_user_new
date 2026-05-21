import 'package:ayursh/application/address/address_bloc.dart';
import 'package:ayursh/domain/model/business/address_info.dart';
import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:ayursh/domain/model/business/therapy_booking_info.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/request/therapy_booking_request.dart';
import 'package:ayursh/domain/model/response/therapy_create_order_model.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:ayursh/domain/repository/payment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

import '../../presentation/therapy_checkout/therapy_checkout_screen.dart';

part 'therapy_checkout_bloc.freezed.dart';
part 'therapy_checkout_event.dart';
part 'therapy_checkout_state.dart';

class TherapyCheckoutBloc extends Bloc<TherapyCheckoutEvent, TherapyCheckoutState> {
  final PaymentRepository paymentRepository;
  final OnboardingRepository onboardingRepository;

  TherapyCheckoutBloc({required this.paymentRepository, required this.onboardingRepository}) : super(TherapyCheckoutState.initialize());

  @override
  Stream<TherapyCheckoutState> mapEventToState(TherapyCheckoutEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(therapyBookingInfo: e.therapyBookingInfo, bookingSlotInfo: e.bookingSlotInfo, addressInfo: e.addressInfo);
    }, createOrder: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading, createOrderResult: null);
      var response = await paymentRepository.createTherapyOrder(
        e.referralModal?.data?.discountedAmount?.toDouble() ?? state.therapyBookingInfo!.totalAmountOfSessions,
        state.therapyBookingInfo!.sessionSelectedInfo.totalSession,
        state.therapyBookingInfo!.sessionSelectedInfo.pricePerSession,
        false,
      );
      print(response);
      yield* response.fold((error) async* {
        yield state.copyWith(loadingState: LoadingState.isCompleted, errorMessage: error, createOrderResult: null);
      }, (createOrderResp) async* {
        if (createOrderResp.success) {
          yield state.copyWith(loadingState: LoadingState.isCompleted, createOrderResult: createOrderResp.createOrderModel, isConsumedOrderId: false);
        } else {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted, errorMessage: createOrderResp.message ?? 'Unknown error', createOrderResult: null);
        }
      });
    }, checkoutOrder: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading, razorpayPaymentId: e.razorpayPaymentId, razorpaySignature: e.razorpaySignature);
      var response = await paymentRepository.checkoutTherapyOrder(state.createOrderResult?.receipt ?? '', e.razorpayPaymentId, e.razorpaySignature);
      print(response);
      yield* response.fold((l) async* {
        yield state.copyWith(loadingState: LoadingState.isCompleted, errorMessage: l);
      }, (checkoutResp) async* {
        if (checkoutResp.success) {
          if (checkoutResp.checkoutModel.isPaymentSuccess) {
            //Call booking api
            yield* _bookTherapy(referralModal: e.referralModal);
          } else {
            yield state.copyWith(loadingState: LoadingState.isCompleted, errorMessage: 'Payment Failed');
          }
        } else {
          yield state.copyWith(loadingState: LoadingState.isCompleted, errorMessage: 'Create Order Failed');
        }
      });
    }, createCODOrder: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading, createOrderResult: null);
      var response = await paymentRepository.createTherapyOrder(
        state.therapyBookingInfo!.totalAmountOfSessions,
        state.therapyBookingInfo!.sessionSelectedInfo.totalSession,
        state.therapyBookingInfo!.sessionSelectedInfo.pricePerSession,
        true,
      );
      print("response of create order: $response");

      yield* response.fold((error) async* {
        yield state.copyWith(loadingState: LoadingState.isCompleted, errorMessage: error, createOrderResult: null);
      }, (createOrderResp) async* {
        if (createOrderResp.success) {
          // COD order creation success, call checkout API
          // yield state.copyWith(
          //     loadingState: LoadingState.isCompleted,
          //     createOrderResult: createOrderResp.createOrderModel,
          //     isConsumedOrderId: false);
          yield* _bookTherapy(  createOrderModel: createOrderResp.createOrderModel,referralModal: e.referralModal,);
        } else {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted, errorMessage: createOrderResp.message ?? 'Unknown error', createOrderResult: null);
        }
      });
    }, resetError: (e) async* {
      yield state.copyWith(errorMessage: null);
    }, consumeOrderId: (e) async* {
      yield state.copyWith(isConsumedOrderId: e.isConsumed);
    }, trackPayment: (e) async* {
      await paymentRepository.trackPayment(e.data);
      yield state;
    });
  }

  Stream<TherapyCheckoutState> _bookTherapy( {TherapyCreateOrderModel? createOrderModel, ReferralModal? referralModal}) async* {
    // var totalAddOns = 0.0;

    // if (state.therapyBookingInfo != null &&
    //     state.therapyBookingInfo!.addOnTherapies.isNotEmpty)
    //   for (final item in state.therapyBookingInfo!.addOnTherapies)
    //     totalAddOns += item.amountPayable;

    var bookingSlotInfo = state.bookingSlotInfo!;
    var scheduledAt = bookingSlotInfo.toServerScheduleTime();
    print(scheduledAt);
    //TODO: Check if we need to check isRequiredConsultation therapy category here
    var isNonConsultationTherapyBooking = !(state.therapyBookingInfo?.consultationBookingId?.isNotEmpty ?? false);
    var consultationBookingId = state.therapyBookingInfo?.consultationBookingId;
    var doctorBookingId = state.therapyBookingInfo?.doctorBookingId;
    var therapyTitle = state.therapyBookingInfo!.therapyTitle;
    var totalSessions = state.therapyBookingInfo!.sessionSelectedInfo.totalSession.toString();
    var sessionNo = state.therapyBookingInfo!.sessionSelectedInfo.totalSession.toString();
    var totalAmount = referralModal?.data?.discountedAmount ?? state.therapyBookingInfo!.totalAmountOfSessions;
    var totalDiscountedAmount = state.therapyBookingInfo!.totalAmountOfSessions;
    var amountPayable = referralModal?.data?.discountedAmount.toString() ??state.therapyBookingInfo!.totalAmount.toString();
    var membershipDiscount = 0.0;
    var addressFlatNoBuilding = state.addressInfo!.flatNoBuilding;
    var addressAreaLocality = state.addressInfo!.localityArea;
    var addressLandmark = state.addressInfo!.landMark;
    var addressCity = state.addressInfo!.city;
    var sessionDurationInMin = state.therapyBookingInfo!.sessionSelectedInfo.sessionDurationInMin?.toInt() ?? 0;
    var addressLatitude = state.therapyBookingInfo!.sessionSelectedInfo.sessionDurationInMin?.toInt() ?? 0;
    var addressLongitude = state.therapyBookingInfo!.sessionSelectedInfo.sessionDurationInMin?.toInt() ?? 0;
    var patientName = state.therapyBookingInfo!.bookingUserModel!.bookingForName;
    var patientGender = state.therapyBookingInfo!.bookingUserModel!.bookingForGender;
    var patientAge = state.therapyBookingInfo!.bookingUserModel!.bookingForAge;
    var therapyBookingSessionId = state.createOrderResult?.notes.therapyBookingId ?? createOrderModel?.notes.therapyBookingId;
    var ayurshOrderId = state.createOrderResult?.ayurshOrderId ?? createOrderModel?.ayurshOrderId;

    var bookingRequest = TherapyBookingRequest(
        isNonConsultationTherapyBooking,
        consultationBookingId,
        doctorBookingId,
        therapyTitle,
        totalSessions,
        sessionNo,
        scheduledAt,
        amountPayable,
        membershipDiscount,
        totalAmount.toDouble(),
        addressFlatNoBuilding,
        addressAreaLocality,
        addressLandmark,
        addressCity,
        sessionDurationInMin,
        patientName,
        patientGender,
        patientAge,
        therapyBookingSessionId!,
        ayurshOrderId!,
        state.therapyBookingInfo!.addOnTherapies,
        state.therapyBookingInfo?.servicesOffered == 'in-clinic'
            ? (state.therapyBookingInfo?.finderResponse?.data?.locations?[0].latitude ?? 0)
            : GetIt.I.get<AddressBloc>().state.lat,
        state.therapyBookingInfo?.servicesOffered == 'in-clinic'
            ? (state.therapyBookingInfo?.finderResponse?.data?.locations?[0].longitude ?? 0)
            : GetIt.I.get<AddressBloc>().state.long,
        state.therapyBookingInfo?.finderResponse?.data?.locations?[0].clinicId ?? '',
  referralModal?.data?.referralDiscount ?? 0,
  totalDiscountedAmount.toInt(),
  referralModal?.data?.referrerCommission ?? 0,
  referralModal?.data?.referrerId ?? '',
  referralModal?.data?.referrerType ?? '');
    var response = await onboardingRepository.bookTherapy(bookingRequest);
    print(response);
    yield* response.fold((l) async* {
      yield state.copyWith(loadingState: LoadingState.isCompleted, errorMessage: l);
    }, (bookTherapyRsp) async* {
      if (bookTherapyRsp.success) {
        yield state.copyWith(bookingCompleted: true);
      } else {
        yield state.copyWith(loadingState: LoadingState.isCompleted, errorMessage: 'Booking Failed');
      }
    });
  }
}
