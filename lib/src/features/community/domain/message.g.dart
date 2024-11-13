// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String?,
      message: json['message'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      receiverId: json['receiverId'] as String?,
      receiverName: json['receiverName'] as String?,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'receiverId': instance.receiverId,
      'receiverName': instance.receiverName,
      'timestamp': instance.timestamp,
    };
