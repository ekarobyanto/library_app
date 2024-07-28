part of 'add_category_cubit.dart';

@freezed
class AddCategoryState with _$AddCategoryState {
  const factory AddCategoryState.initial() = _Initial;
  const factory AddCategoryState.success() = _Success;
  const factory AddCategoryState.loading() = _Loading;
  const factory AddCategoryState.error({String? message}) = _Error;
}
