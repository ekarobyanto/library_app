import 'package:flutter/material.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/button.dart';
import 'package:library_app/src/widgets/dropdown.dart';
import 'package:library_app/src/widgets/text_field.dart';

class CreateReport extends StatelessWidget {
  const CreateReport({super.key});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
          ),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AppTextField(
                    enabled: false,
                    label: 'Report Date',
                    placeholder: DateTime.now()
                        .toLocal()
                        .toString()
                        .split(' ')
                        .first
                        .split('-')
                        .reversed
                        .join('/'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AppDropdown(
                    label: 'Select Book',
                    placeholder: 'Select a book',
                    searchPlaceholder: 'Search for a book',
                    items: const [],
                    selectedItems: null,
                    onChanged: (v) {},
                    validator: (v) => null,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const AppTextField(
                    label: 'Description',
                    maxLines: 4,
                    minLines: 4,
                    placeholder: 'Enter a description',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
