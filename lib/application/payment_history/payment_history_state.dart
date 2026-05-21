part of 'payment_history_bloc.dart';

@freezed
class PaymentHistoryState with _$PaymentHistoryState {
  const factory PaymentHistoryState(
      {required LoadingState loadingState,
      required List<PaymentModel>? paymentModels}) = _PaymentHistoryState;

  factory PaymentHistoryState.initialize() => PaymentHistoryState(
      loadingState: LoadingState.isInitial, paymentModels: null);
}
