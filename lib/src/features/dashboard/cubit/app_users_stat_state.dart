part of 'app_users_stat_cubit.dart';

@freezed
class AppUsersStatState with _$AppUsersStatState {
  const factory AppUsersStatState.initial() = _Initial;
  const factory AppUsersStatState.success(Map<String, int> stat) = _Success;
  const factory AppUsersStatState.failed() = _Failed;
}
