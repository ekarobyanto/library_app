import 'package:flutter/material.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/button.dart';
import 'package:library_app/src/widgets/doc_field.dart';
import 'package:library_app/src/widgets/image_field.dart';
import 'package:library_app/src/widgets/multi_dropdown.dart';
import 'package:library_app/src/widgets/text_field.dart';

class BookForm extends StatefulWidget {
  const BookForm({super.key});

  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  String? docPath;
  String? imagePath;
  List<String> selectedCategories = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
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

  void updateCategories(List<String> categories) {
    setState(() {
      selectedCategories = categories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButton(
          label: "Upload Book",
          onPressed: () {},
        ),
      ),
      appBar: applicationAppbar(title: 'Upload Book'),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AppTextField(
                    label: 'Title',
                    placeholder: 'Enter book title',
                    controller: titleController,
                  ),
                  const SizedBox(height: 12),
                  AppMultiDropdown(
                    label: "Categories",
                    placeholder: "Select categories",
                    items: const [],
                    selectedItems: const [],
                    onChanged: updateCategories,
                    validator: (_) {
                      if (selectedCategories.isEmpty) {
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
    );
  }
}
