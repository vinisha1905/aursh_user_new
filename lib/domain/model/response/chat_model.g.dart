// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      json['deleted'] as bool,
      json['to_uid'] as String,
      (json['sendAt'] as num).toInt(),
      json['message'] as String,
      json['type'] as String,
      json['from_uid'] as String,
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'deleted': instance.deleted,
      'to_uid': instance.toUid,
      'sendAt': instance.sendAt,
      'message': instance.message,
      'type': instance.type,
      'from_uid': instance.fromUid,
    };
