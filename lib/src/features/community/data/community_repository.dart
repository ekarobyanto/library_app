import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_app/src/features/community/domain/chat_list.dart';
import 'package:library_app/src/features/community/domain/message.dart';

class CommunityRepository {
  final FirebaseFirestore _firestoreInstance;
  const CommunityRepository(this._firestoreInstance);

  Stream<List<ChatList>> getChatRooms(String userId) {
    return _firestoreInstance
        .collection('chat-rooms')
        .where('participants', arrayContains: userId)
        .snapshots()
        .map((docs) {
      if (docs.docs.isNotEmpty) {
        return docs.docs.map((doc) => ChatList.fromJson(doc.data())).toList();
      }
      return [];
    });
  }

  Stream<List<Message>> connectToChatRoom(String chatRoomId) {
    return _firestoreInstance
        .collection('chat-rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp')
        .snapshots()
        .map(
      (docs) {
        if (docs.docs.isNotEmpty) {
          return docs.docs.map((doc) => Message.fromJson(doc.data())).toList();
        }
        return [];
      },
    );
  }

  Future<void> sendMessageToChatRoom(
    Message message,
    String chatRoomId,
  ) async {
    final chatRoom = await _firestoreInstance
        .collection('chat-rooms')
        .where('id', isEqualTo: chatRoomId)
        .limit(1)
        .get()
        .then(
          (docs) => docs.docs.isEmpty
              ? null
              : ChatList.fromJson(docs.docs.first.data()),
        );

    final updatedChatRoom = chatRoom != null
        ? chatRoom.copyWith(
            senderUsername: message.senderName,
            lastMessage: message.message,
            timestamp: DateTime.now().toIso8601String(),
          )
        : ChatList(
            id: chatRoomId,
            senderUsername: message.senderName,
            participants: chatRoomId.split('-'),
            lastMessage: message.message,
            timestamp: DateTime.now().toIso8601String(),
          );

    await _firestoreInstance
        .collection('chat-rooms')
        .doc(chatRoomId)
        .set(updatedChatRoom.toJson());

    await _firestoreInstance
        .collection('chat-rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(message.toJson());
  }

  Stream<List<Message>> connectToCommunityChat() {
    return _firestoreInstance
        .collection('community-chat')
        .orderBy('timestamp')
        .snapshots()
        .map(
      (docs) {
        if (docs.docs.isNotEmpty) {
          return docs.docs.map((doc) => Message.fromJson(doc.data())).toList();
        } else {
          return [];
        }
      },
    );
  }

  Future<void> sendMessageToCommunityChat(Message message) async {
    await _firestoreInstance.collection('community-chat').add(message.toJson());
  }
}
