part of 'create_book_cubit.dart';

@freezed
class CreateBookState with _$CreateBookState {
  const factory CreateBookState.initial() = _Initial;
  const factory CreateBookState.loading([String? label]) = _Loading;
  const factory CreateBookState.created() = _Created;
  const factory CreateBookState.error([String? message]) = _Error;
}
