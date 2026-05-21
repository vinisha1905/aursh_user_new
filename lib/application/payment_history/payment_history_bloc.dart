import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/payment_model.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_history_bloc.freezed.dart';
part 'payment_history_event.dart';
part 'payment_history_state.dart';

class PaymentHistoryBloc
    extends Bloc<PaymentHistoryEvent, PaymentHistoryState> {
  final OnboardingRepository onboardingRepository;

  PaymentHistoryBloc({required this.onboardingRepository})
      : super(PaymentHistoryState.initialize());

  @override
  Stream<PaymentHistoryState> mapEventToState(
      PaymentHistoryEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var response = await onboardingRepository.getPaymentHistory();
      yield* response.fold((error) async* {
        yield state.copyWith(
            paymentModels: [], loadingState: LoadingState.isCompleted);
      }, (historyResp) async* {
        if (historyResp.success && historyResp.payments != null) {
          print(historyResp.toString());
          yield state.copyWith(
              paymentModels: historyResp.payments ?? [],
              loadingState: LoadingState.isCompleted);
        } else {
          yield state.copyWith(
              paymentModels: [], loadingState: LoadingState.isCompleted);
        }
      });
    });
  }
}
