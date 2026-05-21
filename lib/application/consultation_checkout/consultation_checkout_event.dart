part of 'consultation_checkout_bloc.dart';

@freezed
class ConsultationCheckoutEvent with _$ConsultationCheckoutEvent {
  const factory ConsultationCheckoutEvent.initialize(
      DoctorModel doctorInfo,
      BookingSlotInfo bookingSlotInfo,
      BookingUserModel bookingUser,
      SessionSelectedInfo? sessionSelectedInfo) = _Initialize;

  const factory ConsultationCheckoutEvent.createOrder() = _CreateOrder;
  const factory ConsultationCheckoutEvent.checkoutOrder(String razorpayPaymentId, String razorpaySignature) = _CheckoutOrder;
  const factory ConsultationCheckoutEvent.resetError() = _ResetError;
  const factory ConsultationCheckoutEvent.consumeOrderId(bool isConsumed) = _ConsumeOrderId;
  const factory ConsultationCheckoutEvent.trackPayment(Map<String, dynamic> data) = _TrackPayment;
}
