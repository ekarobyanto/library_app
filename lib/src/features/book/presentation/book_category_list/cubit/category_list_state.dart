part of 'category_list_cubit.dart';

@freezed
class CategoryListState with _$CategoryListState {
  const factory CategoryListState.initial() = _Initial;
  const factory CategoryListState.loading() = _Loading;
  const factory CategoryListState.success(
      {required List<BookCategory> categories}) = _Success;
  const factory CategoryListState.error({String? message}) = _Error;
}
