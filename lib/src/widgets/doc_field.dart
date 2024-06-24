import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:library_app/src/utils/check_uri.dart';
import 'package:library_app/src/widgets/text_field.dart';

class DocumentField extends StatelessWidget {
  final String? label;
  final String? docPath; //path or url
  final Function(String)? onDocumentChanged;
  final String defaultLabel = "Book Document (.pdf)";

  const DocumentField({
    super.key,
    this.label,
    this.docPath,
    this.onDocumentChanged,
  });

  Future<String?> pickDocument(BuildContext context) async {
    final doc = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    return doc?.paths.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            final docPath = await FilePicker.platform.pickFiles(
              allowMultiple: false,
              type: FileType.custom,
              allowedExtensions: ['pdf'],
            ).then((doc) => doc?.paths.first);
            if (docPath == null || onDocumentChanged == null) return;
            onDocumentChanged!(docPath);
          },
          child: AppTextField(
            enabled: false,
            placeholder: "Select a document",
            label: label ?? defaultLabel,
            controller:
                TextEditingController(text: docPath?.split('/').last ?? ''),
            leftIcon: const Icon(Icons.file_present),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          (docPath != null && !isStringAUrl(docPath!))
              ? 'Size : ${(File(docPath!).lengthSync() / 1024).toStringAsFixed(2)} KB'
              : '',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
