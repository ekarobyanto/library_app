import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const AuthBackgroundDecoration(),
            SafeArea(
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
                          label: 'Book Uploaded',
                          message: '100',
                        ),
                        ContentRowContent(
                          label: 'Book Readed',
                          message: '100',
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const HorizontalBookList(
                      label: "Recently Read",
                      books: ['', '', ''],
                    ),
                    const HorizontalBookList(
                      label: "Popular Books",
                      books: ['', '', ''],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
