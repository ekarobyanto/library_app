part of 'user_last_read_cubit.dart';

@freezed
class UserLastReadState with _$UserLastReadState {
  const factory UserLastReadState.loading() = _Loading;
  const factory UserLastReadState.failed() = _Failed;
  const factory UserLastReadState.success(BookLastRead userStat) = _Success;
}
