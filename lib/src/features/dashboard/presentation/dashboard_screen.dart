import 'package:flutter/material.dart';
import 'package:library_app/src/features/dashboard/presentation/widget/dashboard_appbar.dart';
import 'package:library_app/src/theme/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: color.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const DashboardAppbar(),
                  Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}