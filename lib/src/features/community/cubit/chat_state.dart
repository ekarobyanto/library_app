part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.loading() = _Loading;
  const factory ChatState.connected(List<Message> messages) = _Connected;
  const factory ChatState.failed(String? message) = _Failed;
}
