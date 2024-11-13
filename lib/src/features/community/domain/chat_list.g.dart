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
      senderName: json['senderName'] as String?,
      recipientName: json['recipientName'] as String?,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastMessage: json['lastMessage'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$ChatListImplToJson(_$ChatListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'recipientId': instance.recipientId,
      'senderName': instance.senderName,
      'recipientName': instance.recipientName,
      'participants': instance.participants,
      'lastMessage': instance.lastMessage,
      'timestamp': instance.timestamp,
    };
