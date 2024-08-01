part of 'all_book_cubit.dart';

@freezed
class AllBookState with _$AllBookState {
  const factory AllBookState.initial() = _Initial;
  const factory AllBookState.loading() = _Loading;
  const factory AllBookState.failed(String message) = _Failed;
  const factory AllBookState.succces(List<Book> books) = _Success;
}
