part of 'therapy_checkout_bloc.dart';

@freezed
class TherapyCheckoutState with _$TherapyCheckoutState {
  const factory TherapyCheckoutState(
          {required TherapyBookingInfo? therapyBookingInfo,
            required AddressInfo? addressInfo,
          required BookingSlotInfo? bookingSlotInfo,
          required LoadingState loadingState,
          required String? errorMessage,
          required bool isConsumedOrderId,
          required String? razorpayPaymentId,
          required String? razorpaySignature,
          required bool bookingCompleted,
          required TherapyCreateOrderModel? createOrderResult}) =
      _TherapyCheckoutState;

  factory TherapyCheckoutState.initialize() => TherapyCheckoutState(
      bookingSlotInfo: null,
      loadingState: LoadingState.isInitial,
      therapyBookingInfo: null,
      addressInfo: null,
      errorMessage: null,
      isConsumedOrderId: false,
      razorpaySignature: null,
      razorpayPaymentId: null,
      bookingCompleted: false,
      createOrderResult: null);
}
