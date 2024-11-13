import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/community/domain/chat_list.dart';
import 'package:library_app/src/features/community/domain/message.dart';

class CommunityRepository {
  final FirebaseFirestore _firestoreInstance;
  const CommunityRepository(this._firestoreInstance);

  Stream<List<ChatList>> getChatList(String userId) => _firestoreInstance
          .collection('chat-list')
          .where('id', isEqualTo: userId)
          .orderBy('timestamp')
          .snapshots()
          .map(
        (docs) {
          if (docs.docs.isNotEmpty) {
            final chats =
                docs.docs.map((doc) => ChatList.fromJson(doc.data())).toList();
            logger.e(chats);
            return chats;
          }
          return [];
        },
      );

  Stream<List<Message>> openChatConnection([
    String? userId,
    String? recipient,
  ]) {
    if (userId != null) {
      return _firestoreInstance
          .collection('user-chat-message')
          .where('id', isEqualTo: userId)
          .where('recipientId', isEqualTo: recipient)
          .orderBy('timestamp')
          .snapshots()
          .map(
        (docs) {
          if (docs.docs.isNotEmpty) {
            return docs.docs
                .map((doc) => Message.fromJson(doc.data()))
                .toList();
          }
          return [];
        },
      );
    } else {
      return _firestoreInstance
          .collection('community-chat')
          .orderBy('timestamp')
          .snapshots()
          .map(
        (docs) {
          if (docs.docs.isNotEmpty) {
            return docs.docs
                .map((doc) => Message.fromJson(doc.data()))
                .toList();
          }
          return [];
        },
      );
    }
  }

  Future<void> sendMessage(Message message) async {
    if (message.recipientId != null) {
      _firestoreInstance.collection('user-chat-message').add(message.toJson());
      final _chatList = await _firestoreInstance
          .collection('chat-list')
          .where('id', isEqualTo: message.id)
          .where('recipientId', isEqualTo: message.recipientId)
          .get();
      if (_chatList.docs.isEmpty) {
        _firestoreInstance.collection('chat-list').add(
              ChatList(
                id: message.id,
                userId: message.id,
                recipientId: message.recipientId!,
                lastMessage: message.message,
                timestamp: message.timestamp,
                recipientName: message.recipientName,
              ).toJson(),
            );
      } else {
        _firestoreInstance
            .collection('chat-list')
            .doc(_chatList.docs.first.id)
            .update(
          {
            'recipientName': message.recipientName,
            'lastMessage': message.message,
            'timestamp': message.timestamp,
          },
        );
      }
    } else {
      _firestoreInstance.collection('community-chat').add(message.toJson());
    }
  }
}
