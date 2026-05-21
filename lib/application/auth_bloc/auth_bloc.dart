
import 'package:ayursh/application/address/address_bloc.dart';
import 'package:ayursh/application/my_bookings/my_bookings_bloc.dart';
import 'package:ayursh/domain/util/preference_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:get_it/get_it.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final PreferenceUtil preferenceUtil;

  AuthBloc({required this.preferenceUtil}) : super(AuthState.initialize());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield* event.map(initialize: (e) async* {
      var accessToken = await preferenceUtil.getAccessToken();
      var expiryTime = await preferenceUtil.getExpiryTime();
      var currentTime = DateTime.now().millisecondsSinceEpoch;
      var isLoggedIn = accessToken.isNotEmpty && expiryTime > currentTime;
      yield state.copyWith(
          isLoggedIn: isLoggedIn,
          expiryTime: expiryTime,
          accessToken: accessToken);
    }, logOut: (e) async* {
      Freshchat.resetUser();
      GetIt.I.resetLazySingleton<MyBookingsBloc>();
      GetIt.I.resetLazySingleton<AddressBloc>();
      await preferenceUtil.saveExpiryTime(0);
      await preferenceUtil.saveAccessToken('');
      await preferenceUtil.saveCategoryList([]);
      yield state.copyWith(isLoggedIn: false, expiryTime: 0, accessToken: '', message: e.message);
    });
  }
}
