part of 'delete_book_cubit.dart';

@freezed
class DeleteBookState with _$DeleteBookState {
  const factory DeleteBookState.initial() = _Initial;
  const factory DeleteBookState.loading() = _Loading;
  const factory DeleteBookState.success() = _Success;
  const factory DeleteBookState.fail(String? message) = _Fail;
}
