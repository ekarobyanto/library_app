part of 'library_cubit.dart';

@freezed
class LibraryState with _$LibraryState {
  const factory LibraryState.success(List<LibraryBook> results) = _Success;
}
