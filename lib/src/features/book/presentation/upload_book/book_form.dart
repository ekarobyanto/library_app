import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/core/overlay/loading_overlay.dart';
import 'package:library_app/src/features/book/cubit/all_book_cubit.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/book/domain/book.dart';
import 'package:library_app/src/features/book/dto/create_book.dto.dart';
import 'package:library_app/src/features/book/presentation/upload_book/cubit/create_book_cubit.dart';
import 'package:library_app/src/features/book/presentation/upload_book/widgets/add_category_dialog.dart';
import 'package:library_app/src/features/common/cubit/category_list_cubit.dart';
import 'package:library_app/src/features/library/presentation/cubit/library_cubit.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/utils/check_uri.dart';
import 'package:library_app/src/utils/show_alert.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/button.dart';
import 'package:library_app/src/widgets/doc_field.dart';
import 'package:library_app/src/widgets/image_field.dart';
import 'package:library_app/src/widgets/multi_dropdown.dart';
import 'package:library_app/src/widgets/text_field.dart';

class BookForm extends StatefulWidget {
  final Book? book;
  const BookForm({super.key, this.book});

  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoadingOverlay loadingOverlay = LoadingOverlay();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String? docPath;
  String? imagePath;
  List<String> selectedCategories = [];

  @override
  void initState() {
    if (widget.book != null) {
      docPath = '${widget.book?.name}.pdf';
      imagePath = widget.book?.thumbnailUrl;
      selectedCategories = widget.book?.categories ?? [];
      titleController.text = widget.book!.name!;
      descriptionController.text = widget.book!.description!;
    }
    super.initState();
  }

  void setDocument(String path) {
    setState(() {
      docPath = path;
    });
  }

  void setImage(String path) {
    setState(() {
      imagePath = path;
    });
  }

  void updateCategories(List<String> items) {
    setState(() {
      selectedCategories = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<CategoryListCubit>().state.whenOrNull(
              success: (categories) => categories,
            ) ??
        [];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateBookCubit(context.read<BookRepository>()),
        ),
      ],
      child: BlocListener<CreateBookCubit, CreateBookState>(
        listener: (context, state) {
          state.whenOrNull(
            created: () {
              loadingOverlay.hide();
              context.read<LibraryCubit>().getBooks();
              context.read<CategoryListCubit>().getCategories();
              context.read<AllBookCubit>().getAllBook();
              context.pop(true);
            },
            loading: (label) => loadingOverlay.show(context, label),
            error: (message) {
              loadingOverlay.hide();
              showAlert(
                context: context,
                message: message ?? 'Something went wrong',
              );
            },
          );
        },
        child: Builder(builder: (context) {
          final label = "${widget.book != null ? 'Edit' : 'Upload'} Book";
          return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                label: label,
                onPressed: () {
                  if ((imagePath?.isEmpty ?? true)) {
                    showAlert(
                        context: context,
                        message: 'Please select a book cover');
                  }
                  if ((docPath?.isEmpty ?? true)) {
                    showAlert(
                        context: context,
                        message: 'Please select a book document');
                  }

                  if (formKey.currentState?.validate() ?? false) {
                    List<String> categories = [
                      ...(context.read<CategoryListCubit>().state.whenOrNull(
                                success: (categories) => categories
                                    .where((category) => selectedCategories
                                        .contains(category.name))
                                    .map((category) => category.id)
                                    .toList(),
                              ) ??
                          [])
                    ];
                    List<String> categoryNames = [
                      ...(context.read<CategoryListCubit>().state.whenOrNull(
                                success: (categories) => categories
                                    .where((category) => selectedCategories
                                        .contains(category.name))
                                    .map((category) => category.name)
                                    .toList(),
                              ) ??
                          [])
                    ];
                    if (widget.book != null) {
                      final bookCategory = [...(widget.book!.categories ?? [])];
                      final selectedCategory = [...categoryNames];

                      if (bookCategory.join(',') ==
                          selectedCategory.join(',')) {
                        categories = [];
                      }
                    }
                    final book = CreateBookDTO(
                      title: titleController.text,
                      description: descriptionController.text,
                      categories: categories,
                      docUrl: isStringAUrl(docPath!) ||
                              docPath == '${widget.book?.name}.pdf'
                          ? ''
                          : docPath!,
                      thumbnailUrl: isStringAUrl(imagePath!) ||
                              imagePath == widget.book?.thumbnailUrl
                          ? ''
                          : imagePath!,
                    );
                    logger.i(book);
                    if (widget.book != null) {
                      context
                          .read<CreateBookCubit>()
                          .updateBook(book: book, bookId: widget.book!.id!);
                    } else {
                      context.read<CreateBookCubit>().createBook(book: book);
                    }
                  }
                },
              ),
            ),
            appBar: ApplicationAppbar(
              title: label,
              onBackButtonPressed: router.pop,
            ),
            body: SafeArea(
              child: GestureDetector(
                onTap: FocusScope.of(context).unfocus,
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          AppTextField(
                            label: 'Title',
                            placeholder: 'Enter book title',
                            controller: titleController,
                            onValidate: (value) => (value?.isEmpty ?? true)
                                ? 'Enter book title'
                                : null,
                          ),
                          const SizedBox(height: 12),
                          AppMultiDropdown(
                            label: "Categories",
                            placeholder: "Select categories",
                            items: categories
                                .map((category) => category.name)
                                .toList(),
                            selectedItems: selectedCategories,
                            onChanged: updateCategories,
                            validationWidgetBuilder: (context, items) =>
                                Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AppButton(
                                    onPressed: () => showDialog(
                                      context: context,
                                      builder: (context) =>
                                          const AddCategoryDialog(),
                                    ),
                                    label: 'Add Category',
                                    mode: ButtonMode.outlined,
                                  ),
                                  const SizedBox(width: 8),
                                  AppButton(
                                      onPressed: () {
                                        context.pop();
                                        updateCategories(items);
                                      },
                                      label: 'Ok'),
                                ],
                              ),
                            ),
                            validator: (values) {
                              if ((values?.isEmpty ?? true)) {
                                return 'Select at least one category';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          AppTextField(
                            minLines: 4,
                            maxLines: 4,
                            label: 'Description',
                            placeholder: 'Enter book description',
                            controller: descriptionController,
                            onValidate: (value) {
                              if ((value?.isEmpty ?? false)) {
                                return 'Enter book description';
                              }

                              if (value!.length < 10) {
                                return 'Description must be at least 10 characters';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          ImageField(
                            label: 'Book Cover',
                            image: imagePath,
                            onImageChanged: setImage,
                          ),
                          const SizedBox(height: 12),
                          DocumentField(
                            docPath: docPath,
                            onDocumentChanged: setDocument,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
