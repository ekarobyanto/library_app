part of 'user_chat_cubit.dart';

@freezed
class UserChatState with _$UserChatState {
  const factory UserChatState.initial() = _Initial;
  const factory UserChatState.loading() = _Loading;
  const factory UserChatState.connected(List<Message> messages) = _Connected;
  const factory UserChatState.failed(String? message) = _Failed;
}
