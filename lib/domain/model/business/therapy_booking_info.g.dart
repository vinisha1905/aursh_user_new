// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_booking_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyBookingInfo _$TherapyBookingInfoFromJson(Map<String, dynamic> json) =>
    TherapyBookingInfo(
      SessionSelectedInfo.fromJson(
          json['sessionSelectedInfo'] as Map<String, dynamic>),
      (json['totalAmount'] as num).toDouble(),
      (json['totalAmountOfSessions'] as num).toDouble(),
      (json['serviceCharge'] as num).toDouble(),
      (json['travelExpense'] as num).toDouble(),
      json['therapyHeadline'] as String,
      json['therapyTitle'] as String,
      json['therapyImage'] as String,
      json['categoryTitle'] as String,
      json['servicesOffered'] as String?,
      json['doctorBookingId'] as String?,
      json['consultationBookingId'] as String?,
      json['bookingUserModel'] == null
          ? null
          : BookingUserModel.fromJson(
              json['bookingUserModel'] as Map<String, dynamic>),
      json['checkoutDescription'] as String?,
      json['selectedAddress'] as String?,
      (json['addOnTherapies'] as List<dynamic>)
          .map((e) => AddOnTherapyPost.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['finderResponse'] == null
          ? null
          : ClinicFinderResponse.fromJson(
              json['finderResponse'] as Map<String, dynamic>),
      json['serviceType'] as String?,
      json['therapyDuration'] as String?,
      $enumDecodeNullable(_$ServiceTypeEnumMap, json['serviceTypeEnum']),
      $enumDecodeNullable(_$ServicePartEnumMap, json['servicePart']),
    );

Map<String, dynamic> _$TherapyBookingInfoToJson(TherapyBookingInfo instance) =>
    <String, dynamic>{
      'sessionSelectedInfo': instance.sessionSelectedInfo,
      'totalAmount': instance.totalAmount,
      'totalAmountOfSessions': instance.totalAmountOfSessions,
      'serviceCharge': instance.serviceCharge,
      'travelExpense': instance.travelExpense,
      'therapyHeadline': instance.therapyHeadline,
      'therapyTitle': instance.therapyTitle,
      'therapyImage': instance.therapyImage,
      'servicesOffered': instance.servicesOffered,
      'categoryTitle': instance.categoryTitle,
      'doctorBookingId': instance.doctorBookingId,
      'consultationBookingId': instance.consultationBookingId,
      'bookingUserModel': instance.bookingUserModel,
      'checkoutDescription': instance.checkoutDescription,
      'selectedAddress': instance.selectedAddress,
      'addOnTherapies': instance.addOnTherapies,
      'finderResponse': instance.finderResponse,
      'serviceType': instance.serviceType,
      'therapyDuration': instance.therapyDuration,
      'serviceTypeEnum': _$ServiceTypeEnumMap[instance.serviceTypeEnum],
      'servicePart': _$ServicePartEnumMap[instance.servicePart],
    };

const _$ServiceTypeEnumMap = {
  ServiceType.Full: 'Full',
  ServiceType.Part: 'Part',
  ServiceType.Baby: 'Baby',
  ServiceType.Massage: 'Massage',
  ServiceType.Other: 'Other',
};

const _$ServicePartEnumMap = {
  ServicePart.None: 'None',
  ServicePart.Body: 'Body',
  ServicePart.Knee: 'Knee',
  ServicePart.Baby: 'Baby',
  ServicePart.Massage: 'Massage',
  ServicePart.Other: 'Other',
};
