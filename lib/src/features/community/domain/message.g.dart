// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String,
      recipientId: json['recipientId'] as String?,
      message: json['message'] as String,
      senderName: json['senderName'] as String,
      recipientName: json['recipientName'] as String?,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipientId': instance.recipientId,
      'message': instance.message,
      'senderName': instance.senderName,
      'recipientName': instance.recipientName,
      'timestamp': instance.timestamp,
    };
