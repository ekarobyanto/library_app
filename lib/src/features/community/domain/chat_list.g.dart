// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatListImpl _$$ChatListImplFromJson(Map<String, dynamic> json) =>
    _$ChatListImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      recipientId: json['recipientId'] as String,
      recipientName: json['recipientName'] as String?,
      lastMessage: json['lastMessage'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$ChatListImplToJson(_$ChatListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'recipientId': instance.recipientId,
      'recipientName': instance.recipientName,
      'lastMessage': instance.lastMessage,
      'timestamp': instance.timestamp,
    };
