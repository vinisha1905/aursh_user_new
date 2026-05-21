part of 'consultation_checkout_bloc.dart';

@freezed
class ConsultationCheckoutState with _$ConsultationCheckoutState {
  const factory ConsultationCheckoutState(
          {required DoctorModel? doctorInfo,
          required BookingSlotInfo? bookingSlotInfo,
          required BookingUserModel? bookingUser,
          required LoadingState loadingState,
          SessionSelectedInfo? sessionSelectedInfo,
          required String? errorMessage,
          required bool isConsumedOrderId,
          required String? razorpayPaymentId,
          required String? razorpaySignature,
          required bool bookingCompleted,
          required ConsultationCreateOrderModel? createOrderResult}) =
      _ConsultationCheckoutState;

  factory ConsultationCheckoutState.initialize() => ConsultationCheckoutState(
      bookingSlotInfo: null,
      loadingState: LoadingState.isInitial,
      doctorInfo: null,
      bookingUser: null,
      errorMessage: null,
      isConsumedOrderId: false,
      razorpaySignature: null,
      razorpayPaymentId: null,
      bookingCompleted: false,
      createOrderResult: null);
}
