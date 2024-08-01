import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatelessWidget {
  final String url;
  final String title;
  const PdfScreen({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppbar(title: title, onBackButtonPressed: context.pop),
      body: SfPdfViewer.network(url),
    );
  }
}
