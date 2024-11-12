import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/community/data/community_repository.dart';
import 'package:library_app/src/features/community/domain/message.dart';

part 'chat_state.dart';
part 'chat_cubit.freezed.dart';

class ChatCubit extends Cubit<ChatState> {
  final CommunityRepository communityRepository;
  ChatCubit(this.communityRepository) : super(const ChatState.initial());

  late StreamSubscription<List<Message>> chatConnection;

  connectToChat() {
    emit(const _Loading());
    chatConnection = communityRepository.openChatConnection().listen(
          (event) => emit(ChatState.connected(event)),
          cancelOnError: true,
          onError: (e) => emit(ChatState.failed(e.toString())),
          onDone: () => logger.t('Connection Closed'),
        );
  }

  sendToChat(Message message, [String? recipientId]) {
    if (recipientId != null) {
      communityRepository.sendMessage(message, '${message.id}-$recipientId');
    } else {
      communityRepository.sendMessage(message);
    }
  }

  @override
  Future<void> close() async {
    try {
      await chatConnection.cancel();
      logger.i('Connection Closed');
    } catch (err) {
      logger.e('Error closing connection: $err');
    }
    return super.close();
  }
}
