import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/features/auth/widgets/background_decoration.dart';
import 'package:library_app/src/features/dashboard/presentation/widget/content_row.dart';
import 'package:library_app/src/features/dashboard/presentation/widget/dashboard_stats.dart';
import 'package:library_app/src/features/user/cubit/user_stat_cubit.dart';
import 'package:library_app/src/features/user/presentation/widget/user_header.dart';
import 'package:library_app/src/theme/app_theme.dart';

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
        child: Column(
          children: [
            AuthBackgroundDecoration(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 8,
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      const UserHeader(),
                      const SizedBox(height: 12),
                      StatsCard(
                        icon: Icon(
                          Icons.book,
                          color: color.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
