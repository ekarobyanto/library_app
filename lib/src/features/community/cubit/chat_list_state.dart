part of 'chat_list_cubit.dart';

@freezed
class ChatListState with _$ChatListState {
  const factory ChatListState.initial() = _Initial;
  const factory ChatListState.loading() = _Loading;
  const factory ChatListState.connected(List<ChatList> messages) = _Connected;
  const factory ChatListState.failed(String? message) = _Failed;
}
