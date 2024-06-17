import 'package:flutter/material.dart';
import 'package:library_app/src/theme/app_theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.buttonStyle,
  });

  final String label;
  final Function()? onPressed;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle ??
          ElevatedButton.styleFrom(
            backgroundColor: color.primaryColor,
          ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: color.primaryShade,
        ),
      ),
    );
  }
}
