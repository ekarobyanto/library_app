part of 'book_search_cubit.dart';

@freezed
class BookSearchState with _$BookSearchState {
  const factory BookSearchState.initial() = _Initial;
  const factory BookSearchState.loading() = _Loading;
  const factory BookSearchState.success({required List<Book> books}) = _Success;
  const factory BookSearchState.error([String? message]) = _Error;
}
