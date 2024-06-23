import 'package:flutter/material.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/back_button.dart';

AppBar applicationAppbar({required String title}) {
  return AppBar(
    toolbarOpacity: 1,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    forceMaterialTransparency: false,
    leading: Padding(
      padding: const EdgeInsets.all(8),
      child: AppBackButton(
        onPressed: () => router.pop(),
      ),
    ),
    title: Text(
      title,
      style: TextStyle(color: color.primaryColor),
    ),
  );
}
