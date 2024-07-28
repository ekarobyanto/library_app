import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/book/data/category_repository.dart';

part 'add_category_state.dart';
part 'add_category_cubit.freezed.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  final CategoryRepository categoryRepository;
  AddCategoryCubit({required this.categoryRepository})
      : super(const AddCategoryState.initial());

  addCategory(String categoryName) async {
    emit(const _Loading());
    try {
      await categoryRepository.addCategory(categoryName);
      emit(const _Success());
    } catch (e) {
      logger.e('Failed to add category: $e');
      emit(const AddCategoryState.error(
        message: "Failed to add category",
      ));
    }
  }
}
