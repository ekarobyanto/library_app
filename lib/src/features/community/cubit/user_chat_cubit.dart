import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/community/data/community_repository.dart';
import 'package:library_app/src/features/community/domain/message.dart';

part 'user_chat_state.dart';
part 'user_chat_cubit.freezed.dart';

class UserChatCubit extends Cubit<UserChatState> {
  final CommunityRepository _communityRepository;
  UserChatCubit(
    this._communityRepository,
  ) : super(const UserChatState.initial());

  late StreamSubscription<List<Message>> _streamSubscription;

  getChats(String chatRoomId) {
    emit(const _Loading());
    _streamSubscription =
        _communityRepository.connectToChatRoom(chatRoomId).listen(
              (event) => emit(_Connected(event)),
            );
  }

  sendChat(String chatRoomId, Message message) =>
      _communityRepository.sendMessageToChatRoom(message, chatRoomId);

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
