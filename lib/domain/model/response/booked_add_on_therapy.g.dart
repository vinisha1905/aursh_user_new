// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booked_add_on_therapy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookedAddOnTherapy _$BookedAddOnTherapyFromJson(Map<String, dynamic> json) =>
    BookedAddOnTherapy(
      json['name'] as String?,
      json['therapy_title'] as String,
      json['session_duration_in_min'],
      json['session_no'],
      json['amount_payable'],
      json['total_amount'],
      json['image_url'] as String,
      json['total_sessions'],
      json['therapy_headline'] as String,
    );

Map<String, dynamic> _$BookedAddOnTherapyToJson(BookedAddOnTherapy instance) =>
    <String, dynamic>{
      'name': instance.name,
      'therapy_title': instance.title,
      'session_duration_in_min': instance.sessionDurationInMin,
      'total_sessions': instance.totalSessions,
      'session_no': instance.sessionNo,
      'image_url': instance.imageUrl,
      'amount_payable': instance.amountPayable,
      'total_amount': instance.totalAmount,
      'therapy_headline': instance.headline,
    };
