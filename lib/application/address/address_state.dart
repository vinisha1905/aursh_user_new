part of 'address_bloc.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    required String? city,
    required double lat,
    required double long,
  }) = _AddressState;

  factory AddressState.initialize() => AddressState(city: null, lat: 0, long: 0,);
}
