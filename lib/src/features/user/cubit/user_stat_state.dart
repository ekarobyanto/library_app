part of 'user_stat_cubit.dart';

@freezed
class UserStatState with _$UserStatState {
  const factory UserStatState.loading() = _Loading;
  const factory UserStatState.failed() = _Failed;
  const factory UserStatState.success(UserStat userStat) = _Success;
}
