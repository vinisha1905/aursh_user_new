part of 'therapy_checkout_bloc.dart';

@freezed
class TherapyCheckoutEvent with _$TherapyCheckoutEvent {
  const factory TherapyCheckoutEvent.initialize(
      TherapyBookingInfo therapyBookingInfo,
      BookingSlotInfo bookingSlotInfo,
      AddressInfo addressInfo) = _Initialize;

  const factory TherapyCheckoutEvent.createOrder(ReferralModal? referralModal) = _CreateOrder;
  const factory TherapyCheckoutEvent.createCODOrder(ReferralModal? referralModal) = _CreateCODOrder;
  const factory TherapyCheckoutEvent.checkoutOrder(String razorpayPaymentId, String razorpaySignature,ReferralModal? referralModal) = _CheckoutOrder;
  const factory TherapyCheckoutEvent.resetError() = _ResetError;
  const factory TherapyCheckoutEvent.consumeOrderId(bool isConsumed) = _ConsumeOrderId;
  const factory TherapyCheckoutEvent.trackPayment(Map<String, dynamic> data) = _TrackPayment;
}
