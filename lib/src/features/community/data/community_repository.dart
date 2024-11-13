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
    _firestoreInstance
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
