part of 'book_list_cubit.dart';

@freezed
class BookListState with _$BookListState {
  const factory BookListState.initial() = _Initial;
  const factory BookListState.loading() = _Loading;
  const factory BookListState.success({required List<Book> books}) = _Success;
  const factory BookListState.error({required String message}) = _Error;
}
