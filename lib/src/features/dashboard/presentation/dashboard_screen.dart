import 'package:flutter/material.dart';
import 'package:library_app/src/features/user/presentation/widget/user_header.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                UserHeader(),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
