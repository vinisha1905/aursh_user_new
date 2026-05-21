// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booked_therapy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookedTherapyModel _$BookedTherapyModelFromJson(Map<String, dynamic> json) =>
    BookedTherapyModel(
      json['therapy_title'] as String,
      (json['total_sessions'] as num).toInt(),
      (json['session_duration_in_min'] as num).toInt(),
      json['amount_payable'],
      (json['membership_discount'] as num).toDouble(),
      json['total_amount'],
      json['address_flat_no_building'] as String,
      json['address_area_locality'] as String,
      json['address_landmark'] as String,
      json['address_city'] as String,
      json['patient_name'] as String,
      json['patient_age'] as String,
      json['patient_gender'] as String,
      (json['sessions'] as List<dynamic>)
          .map((e) => SessionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['therapy_headline'] as String,
      (json['booked_on_ts'] as num).toInt(),
      json['therapy_status'] as String,
      json['invoice_url'] as String?,
      (json['therapy_messages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['recent_session'] as num).toInt(),
      json['can_book_next'] as bool,
      json['can_provide_feedback'] as bool,
      json['display_image'] as String,
      (json['add_on_therapies'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BookedAddOnTherapy.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['image_url'] as String,
      json['can_therapist_be_called'] as bool,
    );

Map<String, dynamic> _$BookedTherapyModelToJson(BookedTherapyModel instance) =>
    <String, dynamic>{
      'therapy_title': instance.therapyTitle,
      'total_sessions': instance.totalSessions,
      'session_duration_in_min': instance.sessionDurationInMin,
      'amount_payable': instance.amountPayable,
      'membership_discount': instance.membershipDiscount,
      'total_amount': instance.totalAmount,
      'address_flat_no_building': instance.addressFlatNoBuilding,
      'address_area_locality': instance.addressAreaLocality,
      'address_landmark': instance.addressLandmark,
      'address_city': instance.addressCity,
      'patient_name': instance.patientName,
      'patient_age': instance.patientAge,
      'patient_gender': instance.patientGender,
      'sessions': instance.sessions,
      'therapy_headline': instance.therapyHeadline,
      'booked_on_ts': instance.bookedOnTs,
      'therapy_status': instance.therapyStatus,
      'invoice_url': instance.invoiceUrl,
      'therapy_messages': instance.therapyMessages,
      'recent_session': instance.recentSession,
      'can_book_next': instance.canBookNext,
      'can_provide_feedback': instance.canProvideFeedback,
      'display_image': instance.displayImage,
      'image_url': instance.imageUrl,
      'add_on_therapies': instance.addOnTherapies,
      'can_therapist_be_called': instance.canTherapistBeCalled,
    };
