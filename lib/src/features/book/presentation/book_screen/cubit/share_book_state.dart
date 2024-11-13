part of 'share_book_cubit.dart';

@freezed
class ShareBookState with _$ShareBookState {
  const factory ShareBookState.initial() = _Initial;
  const factory ShareBookState.success() = _Success;
  const factory ShareBookState.fail() = _Fail;
}
