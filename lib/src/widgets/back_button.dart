import 'package:flutter/material.dart';
import 'package:library_app/src/theme/app_theme.dart';

class AppBackButton extends StatelessWidget {
  final void Function()? onPressed;
  const AppBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: color.primaryColor,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(color.primaryShade),
      ),
      icon: Icon(
        Icons.chevron_left,
        color: color.primaryColor,
      ),
    );
  }
}
