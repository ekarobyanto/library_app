import 'package:flutter/material.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/back_button.dart';

class ApplicationAppbar extends AppBar {
  ApplicationAppbar({
    super.key,
    required String title,
    required VoidCallback onBackButtonPressed,
  }) : super(
          toolbarOpacity: 1,
          scrolledUnderElevation: 0,
          forceMaterialTransparency: false,
          backgroundColor: Colors.white,
          title: Text(
            title,
            maxLines: 1,
            style: TextStyle(color: color.primaryColor),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: AppBackButton(
              onPressed: onBackButtonPressed,
            ),
          ),
        );
}
