import 'dart:developer';

import 'package:ayursh/application/address/address_bloc.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/request/finder_request.dart';
import 'package:ayursh/domain/model/response/clinic_finder.dart';
import 'package:ayursh/domain/model/response/pricing_option_model.dart';
import 'package:ayursh/domain/model/response/therapy_detail_model.dart';
import 'package:ayursh/domain/repository/therapy_repo.dart';
import 'package:ayursh/domain/util/preference_util.dart';
import 'package:ayursh/presentation/therapy_detail/therapy_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';

import '../../presentation/util/app_colors.dart';

part 'therapy_detail_bloc.freezed.dart';

part 'therapy_detail_event.dart';

part 'therapy_detail_state.dart';

enum ServiceType { Full, Part, Baby, Massage, Other }

enum ServicePart { None, Body, Knee, Baby, Massage, Other }

class TherapyDetailBloc extends Bloc<TherapyDetailEvent, TherapyDetailState> {
  final TherapyRepository therapyRepository;
  final PreferenceUtil preferenceUtil;

  TherapyDetailBloc(
      {required this.therapyRepository, required this.preferenceUtil})
      : super(TherapyDetailState.initialize());

  @override
  Stream<TherapyDetailState> mapEventToState(TherapyDetailEvent event) async* {
    yield* event.map(
      initialize: (e) async* {
        var configModel = await preferenceUtil.getAppConfigs();

        var isRequireConsultation = false;

        yield state.copyWith(
            loadingState: LoadingState.isInitial,
            therapyTitle: e.therapyTile,
            categoryTitle: e.categoryTitle,
            canBeBooked: configModel?.canTherapyBeBooked ?? true,
            isRequireConsultation: isRequireConsultation);
      },
      getTherapyDetail: (e) async* {
        yield state.copyWith(loadingState: LoadingState.isLoading);
        var response = await therapyRepository.getTherapyDetail(
            state.categoryTitle!, state.therapyTitle!);
        yield* response.fold((error) async* {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              errorMessage: 'Unknown error');
        }, (getTherapyResp) async* {
          if (getTherapyResp.success) {
            var therapyDetail = getTherapyResp.therapyDetail;
            var initQuantity = therapyDetail.sessionOptions[0];
            var initPricing = therapyDetail.pricingOptions[0];
            var serviceType = ServiceType.Full;
            var servicePart = ServicePart.None;
            var serviceTypeText = '';
            if ((therapyDetail.pricePerSessionHalfBody != null &&
                therapyDetail.pricePerSessionHalfBody != 0)) {
              serviceType = ServiceType.Part;
              serviceTypeText = 'half body';
              servicePart = ServicePart.Body;
            }
            if (therapyDetail.pricePerSessionPerKnee != null &&
                therapyDetail.pricePerSessionPerKnee != 0) {
              serviceType = ServiceType.Part;
              serviceTypeText = 'one knee';
              servicePart = ServicePart.Knee;
            }
            if (therapyDetail.sessionDurationInMinBabyInclusive != null &&
                therapyDetail.pricePerSessionBabyInclusive != 0) {
              serviceType = ServiceType.Baby;
              serviceTypeText = 'excluding baby';
              servicePart = ServicePart.Baby;
            }
            if (therapyDetail.sessionDurationInMinDetoxMassageInclusive !=
                    null &&
                therapyDetail.pricePerSessionDetoxMassageInclusive != 0) {
              serviceType = ServiceType.Massage;
              serviceTypeText = 'Detox Medicine Kit';
              servicePart = ServicePart.Massage;
            }
            if (therapyDetail.sessionDurationInMin60min == null &&
                therapyDetail.pricePerSessionHalfBody == null &&
                therapyDetail.sessionDurationInMinBabyInclusive == null &&
                therapyDetail.pricePerSessionBabyInclusive == null &&
                therapyDetail.sessionDurationInMinDetoxMassageInclusive ==
                    null &&
                therapyDetail.pricePerSessionDetoxMassageInclusive == null) {
              serviceType = ServiceType.Other;
            }

            print('--------serviceTypeText------->>>>> $serviceTypeText');
            yield state.copyWith(
                loadingState: LoadingState.isCompleted,
                therapyDetailModel: therapyDetail,
                initOptionQuantity: initQuantity,
                initPricingOption: initPricing,
                serviceTypeText: serviceTypeText,
                serviceType: serviceType,
                servicePart: servicePart);
          } else {
            yield state.copyWith(
                loadingState: LoadingState.isCompleted,
                errorMessage: getTherapyResp.message);
          }
        });
      },
      getLocation: (e) async* {
        if (e.setDefault == true && e.setCurrent != true) {
          AddressState addressState = GetIt.I.get<AddressBloc>().state;
          yield state.copyWith(
            loadingState: LoadingState.isCompleted,
            homeAddress: addressState.city,
            addressController: TextEditingController(text: addressState.city),
            latitude: addressState.lat,
            longitude: addressState.long,
          );
        } else {
          final GeolocatorPlatform geoPlatform = GeolocatorPlatform.instance;
          yield state.copyWith(loadingState: LoadingState.isLoading);
          final position = await geoPlatform.getCurrentPosition();
          List<Placemark> placeMarksList = await placemarkFromCoordinates(
              position.latitude, position.longitude);
          Placemark place = placeMarksList.first;
          GetIt.I.get<AddressBloc>().add(AddressEvent.updateAddress(
              "${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}",
              position.latitude,
              position.longitude));
          yield state.copyWith(
            loadingState: LoadingState.isCompleted,
            homeAddress:
                "${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}",
            addressController: TextEditingController(
                text:
                    "${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}"),
            latitude: position.latitude,
            longitude: position.longitude,
          );
        }
        // if (e.setDefault == true) {
        //   AddressState addressState = GetIt.I.get<AddressBloc>().state;
        //   yield state.copyWith(
        //     loadingState: LoadingState.isCompleted,
        //     homeAddress: addressState.city,
        //     addressController: TextEditingController(text: addressState.city),
        //     latitude: addressState.lat,
        //     longitude: addressState.long,
        //   );
        // } else {
        //   final GeolocatorPlatform geoPlatform = GeolocatorPlatform.instance;
        //   yield state.copyWith(loadingState: LoadingState.isLoading);
        //   final position = await geoPlatform.getCurrentPosition();
        //   List<Placemark> placeMarksList = await placemarkFromCoordinates(
        //       position.latitude, position.longitude);
        //   Placemark place = placeMarksList.first;
        //   GetIt.I.get<AddressBloc>().add(AddressEvent.updateAddress(
        //       "${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}",
        //       position.latitude,
        //       position.longitude));
        //   yield state.copyWith(
        //     loadingState: LoadingState.isCompleted,
        //     homeAddress:
        //         "${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}",
        //     addressController: TextEditingController(
        //         text:
        //             "${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}"),
        //     latitude: position.latitude,
        //     longitude: position.longitude,
        //   );
        // }
      },
      selectOption: (e) async* {
        var selectedQuantity =
            state.therapyDetailModel!.sessionOptions[e.index];
        var selectedPricing = state.therapyDetailModel!.pricingOptions[e.index];
        print('selected price : ${selectedPricing}');
        yield state.copyWith(
            selectedOptionIndex: e.index,
            selectedOptionQuantity: selectedQuantity,
            selectedPricingOption: selectedPricing);
      },
      selectDuration: (e) async* {
        yield state.copyWith(selectedDurationIndex: e.index);
      },
      selectServiceType: (e) async* {
        yield state.copyWith(
            serviceType: e.serviceType,
            serviceTypeText: e.selectedServiceTypeText.toLowerCase());
      },
      startBooking: (e) async* {
        yield state.copyWith(isBooking: true);
      },
      getClinicDetails: (e) async* {
        yield state.copyWith(loadingState: LoadingState.isLoading);
        // 12.972647584997878, 77.60278979892733
        print('-------->>>> ${state.serviceType.name}');
        String duration = state.serviceType == ServiceType.Other
            ? '${state.therapyDetailModel?.sessionDurationInMin}-minutes'
            : state.serviceTypeText == ''
                ? '${durations[state.selectedDurationIndex ?? 0]}-minutes'
                : state.serviceTypeText == 'excluding baby'
                    ? '60-Minutes'
                    : state.serviceTypeText == 'including baby'
                        ? '90-Minutes'
                        : state.serviceTypeText == 'half body'
                            ? '45-Minutes'
                            : state.serviceTypeText == 'full body'
                                ? '75-Minutes'
                                : state.serviceTypeText == 'one knee'
                                    ? '60-Minutes'
                                    : state.serviceTypeText ==
                                            'detox medicine kit'
                                        ? '${state.therapyDetailModel?.sessionDurationInMinDetoxMassageExclusive?.toInt()}-Minutes'
                                        : state.serviceTypeText ==
                                                'detox kit with 3 abhyanga massages'
                                            ? '${state.therapyDetailModel?.sessionDurationInMinDetoxMassageInclusive?.toInt()}-Minutes'
                                            : '${state.therapyDetailModel?.sessionDurationInMin}-minutes';

        yield state.copyWith(therapyDuration: duration);
        var response = await therapyRepository.getClinic(
          FinderBody(
            latitude: state.latitude,
            longitude: state.longitude,
            servicesOffered: [state.therapyPlace ?? 'home-visit'],
            therapySelections: [
              TherapySelections(
                  servicesOffered: state.therapyPlace,
                  therapyType: state.serviceTypeText == 'excluding baby'
                      ? 'excluding baby-massage'
                      : state.serviceTypeText == 'including baby'
                          ? 'including baby-massage'
                          : state.serviceTypeText,
                  categoryTitle: state.categoryTitle,
                  therapyTitle: state.therapyTitle,
                  noOfSessions: state.therapyDetailModel
                          ?.sessionOptions[state.selectedOptionIndex ?? 0] ??
                      1,
                  therapyDuration: duration)
            ],
          ),
        );
        print(
            'get clinic call finder body:${TherapySelections(servicesOffered: state.therapyPlace, therapyType: state.serviceTypeText == 'excluding baby' ? 'excluding baby-massage' : state.serviceTypeText == 'including baby' ? 'including baby-massage' : state.serviceTypeText, categoryTitle: state.categoryTitle, therapyTitle: state.therapyTitle, noOfSessions: state.therapyDetailModel?.sessionOptions[state.selectedOptionIndex ?? 0] ?? 1, therapyDuration: duration).toJson()}');
        yield* response.fold((error) async* {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              errorMessage: 'Unknown error');
        }, (ClinicFinderResponse response) async* {
          if (response.success == true) {
            yield state.copyWith(
                loadingState: LoadingState.isCompleted,
                errorMessage: 'Unknown error');
            if (response.data?.locations != null &&
                response.data!.locations!.isNotEmpty) {
              print(
                  'total price from get clinic call:${response.data?.locations?[0].therapyDetails?[0].toJson()}');
              yield state.copyWith(
                finderResponse: response,
                clinicLong: response.data?.locations?[0].longitude,
                clinicLat: response.data?.locations?[0].latitude,
                clinicAddress: response.data?.locations?[0].clinicFullAddress,
                isBookingAvailable: true,
                serviceTypeText: state.serviceTypeText,
                initPricingOption: response
                    .data?.locations?[0].addOnTherapies?[0].pricingOptions[0],
                totalPrice: response
                    .data?.locations?[0].therapyDetails?[0].totalAmount
                    ?.toDouble(),
              );
            } else {
              yield state.copyWith(isBookingAvailable: false);
            }
          } else {
            yield state.copyWith(
                loadingState: LoadingState.isCompleted,
                errorMessage: response.message,
                isBookingAvailable: false);
          }
        });
      },
      setLatLong: (e) async* {
        yield state.copyWith(
            latitude: e.lat, longitude: e.long, homeAddress: e.address);
      },
      setTherapyPlace: (e) async* {
        yield state.copyWith(therapyPlace: e.therapyPlace);
      },
      showLoader: (value) async* {
        yield state.copyWith(loadingState: LoadingState.isLoading);
      },
      hideLoader: (value) async* {
        yield state.copyWith(loadingState: LoadingState.isCompleted);
      },
    );
  }
}
