import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/overlay/loading_overlay.dart';
import 'package:library_app/src/features/book/cubit/all_book_cubit.dart';
import 'package:library_app/src/features/report/cubit/report_cubit.dart';
import 'package:library_app/src/features/report/data/report_repository.dart';
import 'package:library_app/src/features/report/dto/create_report_dto.dart';
import 'package:library_app/src/features/report/presentation/cubit/create_report_cubit.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/utils/show_alert.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/button.dart';
import 'package:library_app/src/widgets/dropdown.dart';
import 'package:library_app/src/widgets/text_field.dart';

class CreateReport extends StatefulWidget {
  const CreateReport({super.key});

  @override
  State<CreateReport> createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  final LoadingOverlay loadingOverlay = LoadingOverlay();
  String? selectedBook;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _reportDateController = TextEditingController(
    text: DateTime.now()
        .toLocal()
        .toString()
        .split(' ')
        .first
        .split('-')
        .reversed
        .join('/'),
  );

  @override
  void dispose() {
    _descriptionController.dispose();
    _reportDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateReportCubit(context.read<ReportRepository>()),
      child: BlocListener<CreateReportCubit, CreateReportState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () => loadingOverlay.show(context, 'Submitting Report...'),
            success: () {
              loadingOverlay.hide();
              context.read<ReportCubit>().getReport(false);
              router.pop();
            },
            failed: (message) {
              loadingOverlay.hide();
              showAlert(context: context, message: message);
            },
          );
        },
        child: Builder(builder: (context) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: ApplicationAppbar(
                title: 'Create Report',
                onBackButtonPressed: () => router.pop(),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8),
                child: AppButton(
                  label: "Submit",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<CreateReportCubit>().createReport(
                            CreateReportDto(
                              bookId: context
                                  .read<AllBookCubit>()
                                  .state
                                  .maybeWhen(
                                    orElse: () => '',
                                    succces: (books) => books
                                        .firstWhere(
                                          (book) => book.name == selectedBook,
                                        )
                                        .id!,
                                  ),
                              description: _descriptionController.text,
                            ),
                          );
                    }
                  },
                ),
              ),
              body: Form(
                key: _formKey,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          AppTextField(
                            enabled: false,
                            label: 'Report Date',
                            controller: _reportDateController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          BlocBuilder<AllBookCubit, AllBookState>(
                            builder: (context, state) {
                              return AppDropdown(
                                label: 'Select Book',
                                placeholder: 'Select a book',
                                searchPlaceholder: 'Search for a book',
                                items: state.maybeWhen(
                                  orElse: () => [],
                                  succces: (books) =>
                                      books.map((book) => book.name!).toList(),
                                ),
                                selectedItems: selectedBook,
                                onChanged: (v) {
                                  print(v);
                                  setState(() {
                                    selectedBook = v;
                                  });
                                },
                                validator: (v) => (v?.isEmpty ?? true)
                                    ? 'Please select a book'
                                    : null,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AppTextField(
                            label: 'Description',
                            maxLines: 4,
                            minLines: 4,
                            placeholder: 'Enter a description',
                            controller: _descriptionController,
                            onValidate: (v) => (v?.isEmpty ?? true)
                                ? 'Please enter a description'
                                : null,
                          ),
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
