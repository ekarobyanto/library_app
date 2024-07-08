part of 'book_detail_cubit.dart';

@freezed
class BookDetailState with _$BookDetailState {
  const factory BookDetailState.initial() = _Initial;
  const factory BookDetailState.success({required Book book}) = _Success;
  const factory BookDetailState.loading() = _Loading;
  const factory BookDetailState.error({String? message}) = _Error;
}
