// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_finder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClinicFinderResponse _$ClinicFinderResponseFromJson(
        Map<String, dynamic> json) =>
    ClinicFinderResponse(
      success: json['success'] as bool?,
      errorCode: json['error_code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClinicFinderResponseToJson(
        ClinicFinderResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => Locations.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'locations': instance.locations,
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) => Locations(
      clinicId: json['clinic_id'] as String?,
      clinicName: json['clinic_name'] as String?,
      clinicFullAddress: json['clinic_full_address'] as String?,
      clinicDoorFlatNo: json['clinic_door_flat_no'] as String?,
      clinicLandmark: json['clinic_landmark'] as String?,
      clinicCity: json['clinic_city'] as String?,
      clinicAreaLocality: json['clinic_area_locality'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      treatmentsOffered: (json['treatments_offered'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tooltipText: json['tooltip_text'] as String?,
      therapyDetails: (json['therapy_details'] as List<dynamic>?)
          ?.map((e) => TherapyDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      addOnTherapies: (json['add_on_therapies'] as List<dynamic>?)
          ?.map((e) => AddOnTherapy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
      'clinic_id': instance.clinicId,
      'clinic_name': instance.clinicName,
      'clinic_full_address': instance.clinicFullAddress,
      'clinic_door_flat_no': instance.clinicDoorFlatNo,
      'clinic_landmark': instance.clinicLandmark,
      'clinic_city': instance.clinicCity,
      'clinic_area_locality': instance.clinicAreaLocality,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'distance': instance.distance,
      'treatments_offered': instance.treatmentsOffered,
      'tooltip_text': instance.tooltipText,
      'therapy_details': instance.therapyDetails,
      'add_on_therapies': instance.addOnTherapies,
    };

TherapyDetails _$TherapyDetailsFromJson(Map<String, dynamic> json) =>
    TherapyDetails(
      priceListKey: json['price_list_key'] as String?,
      noOfSessions: (json['no_of_sessions'] as num?)?.toInt(),
      therapyTitle: json['therapy_title'] as String?,
      therapyName: json['therapy_name'] as String?,
      totalAmount: (json['total_amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TherapyDetailsToJson(TherapyDetails instance) =>
    <String, dynamic>{
      'price_list_key': instance.priceListKey,
      'no_of_sessions': instance.noOfSessions,
      'therapy_title': instance.therapyTitle,
      'therapy_name': instance.therapyName,
      'total_amount': instance.totalAmount,
    };
