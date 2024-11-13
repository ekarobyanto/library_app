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

  retrieveChats(String chatRoomId) {
    emit(const _Loading());
    final userId = chatRoomId.split('-').first;
    final recipientId = chatRoomId.split('-').last;
    _streamSubscription =
        _communityRepository.openChatConnection(userId, recipientId).listen(
              cancelOnError: true,
              (event) => emit(_Connected(event)),
              onError: (error) => emit(_Failed(error.toString())),
            );
  }

  sendChat(Message message) => _communityRepository.sendMessage(message);

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
