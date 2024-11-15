import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_list.g.dart';
part 'chat_list.freezed.dart';

@freezed
class ChatList with _$ChatList {
  factory ChatList({
    required String id,
    List<String>? participants,
    required String recipientName,
    required String senderName,
    required String lastMessage,
    required String timestamp,
  }) = _ChatList;

  factory ChatList.fromJson(Map<String, dynamic> json) =>
      _$ChatListFromJson(json);
}
