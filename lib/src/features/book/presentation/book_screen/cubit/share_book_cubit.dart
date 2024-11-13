import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/community/data/community_repository.dart';
import 'package:library_app/src/features/community/domain/message.dart';
import 'package:library_app/src/features/user/data/domain/user_search.dart';
import 'package:library_app/src/utils/generate_share_book_text.dart';

part 'share_book_state.dart';
part 'share_book_cubit.freezed.dart';

class ShareBookCubit extends Cubit<ShareBookState> {
  final CommunityRepository communityRepository;
  ShareBookCubit(this.communityRepository)
      : super(const ShareBookState.initial());

  shareBook({
    required String bookId,
    required User sender,
    required UserSearch receiver,
  }) async {
    try {
      final userIds = ([sender.uid, receiver.id]);
      userIds.sort((a, b) => a.compareTo(b));
      final chatRoomId = userIds.join('-');
      await communityRepository.sendMessageToChatRoom(
        Message(
          message: generateShareBookText(bookId),
          senderId: sender.uid,
          senderName: sender.displayName ?? '',
          receiverId: receiver.id,
          receiverName: receiver.name,
          timestamp: DateTime.now().toIso8601String(),
        ),
        chatRoomId,
      );
      emit(const _Success());
    } catch (err) {
      emit(const _Fail());
    }
  }
}
