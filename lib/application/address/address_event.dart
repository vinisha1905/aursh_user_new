part of 'address_bloc.dart';

@freezed
class AddressEvent with _$AddressEvent {
  const factory AddressEvent.initialize() = _Initialize;
  const factory AddressEvent.updateAddress(String city,double lat,double long) = _UpdateAddress;
}