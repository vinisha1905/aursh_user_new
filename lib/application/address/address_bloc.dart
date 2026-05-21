import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';

part 'address_bloc.freezed.dart';
part 'address_event.dart';
part 'address_state.dart';


class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressState.initialize());

  @override
  Stream<AddressState> mapEventToState(AddressEvent event) async* {
    yield* event.map(
        initialize: (e) async* {},
        updateAddress: (e) async* {
          yield state.copyWith(city: e.city,lat: e.lat,long: e.long);
        });
  }
}
