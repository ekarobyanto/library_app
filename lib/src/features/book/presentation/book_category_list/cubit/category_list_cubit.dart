import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/book/data/category_repository.dart';
import 'package:library_app/src/features/book/domain/category.dart';

part 'category_list_cubit.freezed.dart';
part 'category_list_state.dart';

class CategoryListCubit extends Cubit<CategoryListState> {
  final CategoryRepository categoryRepository;
  CategoryListCubit({required this.categoryRepository})
      : super(const CategoryListState.initial());

  getCategories() async {
    emit(const CategoryListState.loading());
    try {
      final categories = await categoryRepository.getCategories();
      logger.i(categories);
      emit(CategoryListState.success(categories: categories));
    } catch (e) {
      logger.e('Failed to get categories: $e');
      emit(const CategoryListState.error(
        message: "Failed to get categories",
      ));
    }
  }
}
