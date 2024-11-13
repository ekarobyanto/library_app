// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatListImpl _$$ChatListImplFromJson(Map<String, dynamic> json) =>
    _$ChatListImpl(
      id: json['id'] as String,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      recipientName: json['recipientName'] as String,
      senderName: json['senderName'] as String,
      lastMessage: json['lastMessage'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$ChatListImplToJson(_$ChatListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participants': instance.participants,
      'recipientName': instance.recipientName,
      'senderName': instance.senderName,
      'lastMessage': instance.lastMessage,
      'timestamp': instance.timestamp,
    };
