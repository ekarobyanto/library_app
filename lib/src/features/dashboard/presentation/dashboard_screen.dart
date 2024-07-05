import 'package:flutter/material.dart';
import 'package:library_app/src/features/auth/widgets/background_decoration.dart';
import 'package:library_app/src/features/dashboard/presentation/widget/content_row.dart';
import 'package:library_app/src/features/dashboard/presentation/widget/dashboard_stats.dart';
import 'package:library_app/src/features/user/presentation/widget/user_header.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/horizontal_book_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const AuthBackgroundDecoration(),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const UserHeader(),
                    const SizedBox(height: 12),
                    StatsCard(
                      icon: Icon(
                        Icons.book,
                        color: color.primaryColor,
                      ),
                      contents: [
                        ContentRowContent(
                          label: 'Book Readed',
                          message: '100',
                        ),
                        ContentRowContent(
                          label: 'Book Complete',
                          message: '100',
                        ),
                        ContentRowContent(
                          label: 'Completion',
                          message: '100%',
                        ),
                        ContentRowContent(
                          label: 'Book Complete',
                          message: '100',
                        ),
                        ContentRowContent(
                          label: 'Completion',
                          message: '100%',
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recently Readed",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        HorizontalBookList(
                          books: ['', '', ''],
                        ),
                      ],
                    ),
                    const HorizontalBookList(
                      label: "Popular Books",
                      books: ['', '', ''],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
