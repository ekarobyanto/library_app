import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_app/src/features/community/domain/message.dart';

class CommunityRepository {
  final FirebaseFirestore _firestoreInstance;
  const CommunityRepository(this._firestoreInstance);

  Stream<List<Message>> openChatConnection() => _firestoreInstance
          .collection('community-chat')
          .orderBy('timestamp')
          .snapshots()
          .map((docs) {
        if (docs.docs.isNotEmpty) {
          return docs.docs.map((doc) => Message.fromJson(doc.data())).toList();
        }
        return [];
      });

  Future<void> sendMessage(Message message) async =>
      _firestoreInstance.collection('community-chat').add(message.toJson());
}
