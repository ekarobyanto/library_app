import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/core/overlay/loading_overlay.dart';
import 'package:library_app/src/features/book/presentation/upload_book/cubit/add_category_cubit.dart';
import 'package:library_app/src/features/common/cubit/category_list_cubit.dart';
import 'package:library_app/src/widgets/button.dart';
import 'package:library_app/src/widgets/text_field.dart';

class AddCategoryDialog extends StatelessWidget {
  const AddCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController categoryName = TextEditingController();
    final LoadingOverlay loadingOverlay = LoadingOverlay();
    return BlocProvider(
      create: (context) => AddCategoryCubit(
        categoryRepository:
            context.read<CategoryListCubit>().categoryRepository,
      ),
      child: BlocListener<AddCategoryCubit, AddCategoryState>(
        listener: (context, state) => state.whenOrNull(
          success: () {
            loadingOverlay.hide();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Category added successfully'),
                duration: Duration(seconds: 2),
              ),
            );
            context.read<CategoryListCubit>().getCategories();
            return null;
          },
          loading: () => loadingOverlay.show(context),
          error: (message) {
            loadingOverlay.hide();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message ?? 'Failed to add category'),
                duration: const Duration(seconds: 2),
              ),
            );
            context.read<CategoryListCubit>().getCategories();
            return null;
          },
        ),
        child: Builder(builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: const Text(
              'Add Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            content: Padding(
              padding: const EdgeInsets.all(4),
              child: AppTextField(
                placeholder: 'Enter category name',
                controller: categoryName,
              ),
            ),
            actions: [
              AppButton(
                onPressed: () {
                  context.pop();
                  context
                      .read<AddCategoryCubit>()
                      .addCategory(categoryName.text);
                },
                label: 'Add',
              )
            ],
          );
        }),
      ),
    );
  }
}
