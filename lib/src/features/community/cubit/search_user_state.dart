part of 'search_user_cubit.dart';

@freezed
class SearchUserState with _$SearchUserState {
  const factory SearchUserState.initial() = _Initial;
  const factory SearchUserState.loading() = _Loading;
  const factory SearchUserState.success(List<UserSearch> users) = _Success;
  const factory SearchUserState.failed(String? message) = _Failed;
}
