import 'package:ayursh/domain/model/response/add_on_therapy.dart';
import 'package:ayursh/domain/model/response/pricing_option_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'clinic_finder.g.dart';

@JsonSerializable()
class ClinicFinderResponse {
  @JsonKey(name: 'success')
  final bool? success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data')
  final Data? data;

  ClinicFinderResponse({
    this.success,
    this.errorCode,
    this.message,
    this.data,
  });

  factory ClinicFinderResponse.fromJson(Map<String, dynamic> json) =>
      _$ClinicFinderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicFinderResponseToJson(this);
}

@JsonSerializable()
class Data {
  final List<Locations>? locations;

  Data({
    this.locations,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Locations {
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @JsonKey(name: 'clinic_name')
  final String? clinicName;
  @JsonKey(name: 'clinic_full_address')
  final String? clinicFullAddress;
  @JsonKey(name: 'clinic_door_flat_no')
  final String? clinicDoorFlatNo;
  @JsonKey(name: 'clinic_landmark')
  final String? clinicLandmark;
  @JsonKey(name: 'clinic_city')
  final String? clinicCity;
  @JsonKey(name: 'clinic_area_locality')
  final String? clinicAreaLocality;
  @JsonKey(name: 'longitude')
  final double? longitude;
  @JsonKey(name: 'latitude')
  final double? latitude;
  @JsonKey(name: 'distance')
  final double? distance;
  @JsonKey(name: 'treatments_offered')
  final List<String>? treatmentsOffered;
  @JsonKey(name: 'tooltip_text')
  final String? tooltipText;
  @JsonKey(name: 'therapy_details')
  final List<TherapyDetails>? therapyDetails;
  @JsonKey(name: 'add_on_therapies')
  final List<AddOnTherapy>? addOnTherapies;

  Locations({
    this.clinicId,
    this.clinicName,
    this.clinicFullAddress,
    this.clinicDoorFlatNo,
    this.clinicLandmark,
    this.clinicCity,
    this.clinicAreaLocality,
    this.longitude,
    this.latitude,
    this.distance,
    this.treatmentsOffered,
    this.tooltipText,
    this.therapyDetails,
    this.addOnTherapies,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);

  Map<String, dynamic> toJson() => _$LocationsToJson(this);
}

@JsonSerializable()
class TherapyDetails {
  @JsonKey(name: 'price_list_key')
  final String? priceListKey;
  @JsonKey(name: 'no_of_sessions')
  final int? noOfSessions;
  @JsonKey(name: 'therapy_title')
  final String? therapyTitle;
  @JsonKey(name: 'therapy_name')
  final String? therapyName;
  @JsonKey(name: 'total_amount')
  final int? totalAmount;

  TherapyDetails({
    this.priceListKey,
    this.noOfSessions,
    this.therapyTitle,
    this.therapyName,
    this.totalAmount,
  });

  factory TherapyDetails.fromJson(Map<String, dynamic> json) =>
      _$TherapyDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TherapyDetailsToJson(this);
}
