import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_app/src/features/community/domain/chat_list.dart';
import 'package:library_app/src/features/community/domain/message.dart';

class CommunityRepository {
  final FirebaseFirestore _firestoreInstance;
  const CommunityRepository(this._firestoreInstance);

  Stream<List<ChatList>> getChatList(String userId) => _firestoreInstance
          .collection('chat-list')
          .where('userId', isEqualTo: userId)
          .orderBy('timestamp')
          .snapshots()
          .map(
        (docs) {
          if (docs.docs.isNotEmpty) {
            return docs.docs
                .map((doc) => ChatList.fromJson(doc.data()))
                .toList();
          }
          return [];
        },
      );

  Stream<List<Message>> openChatConnection() => _firestoreInstance
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

  Future<void> sendMessage(Message message, [String? collectionName]) async =>
      _firestoreInstance
          .collection(collectionName ?? 'community-chat')
          .add(message.toJson());
}
