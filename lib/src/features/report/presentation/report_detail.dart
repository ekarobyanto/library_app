import 'package:flutter/material.dart';
import 'package:library_app/src/features/book/domain/book.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/book_header.dart';

class ReportDetail extends StatelessWidget {
  final String reportId;
  const ReportDetail({super.key, required this.reportId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ApplicationAppbar(
        title: '17/09/2021 (Book Name)',
        onBackButtonPressed: () => router.pop(),
      ),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookHeader(
                showDetailButton: true,
                book: Book(id: 'asasd'),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Report',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Expanded(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Text(
                      'Lorem ipsum dolor sit amet, cLorem ipsum dolor sit amet, consectetur adipis',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
