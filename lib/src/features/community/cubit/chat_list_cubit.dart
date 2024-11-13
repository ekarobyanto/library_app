import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/community/data/community_repository.dart';
import 'package:library_app/src/features/community/domain/chat_list.dart';

part 'chat_list_state.dart';
part 'chat_list_cubit.freezed.dart';

class ChatListCubit extends Cubit<ChatListState> {
  final CommunityRepository communityRepository;
  late StreamSubscription<List<ChatList>> chatsStreamSubscription;
  ChatListCubit({
    required this.communityRepository,
  }) : super(const ChatListState.initial());

  getChatRooms(String userId) {
    emit(const ChatListState.loading());
    chatsStreamSubscription = communityRepository.getChatRooms(userId).listen(
      cancelOnError: true,
      (event) => emit(ChatListState.connected(event)),
      onError: (e) {
        logger.e(e.toString());
        emit(ChatListState.failed(e.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    chatsStreamSubscription.cancel();
    return super.close();
  }
}
