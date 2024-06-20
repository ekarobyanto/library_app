import 'package:flutter/material.dart';
import 'package:library_app/src/theme/app_theme.dart';

enum ButtonMode {
  contained,
  outlined,
}

class AppButton extends StatelessWidget {
  final ButtonMode? mode;
  final String label;
  final Function()? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.buttonStyle,
    this.textStyle,
    this.mode = ButtonMode.contained,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle ??
          ElevatedButton.styleFrom(
            backgroundColor: mode == ButtonMode.contained
                ? color.primaryColor
                : color.primaryShade,
          ),
      child: Text(
        label,
        style: textStyle ??
            TextStyle(
              fontWeight: FontWeight.w600,
              color: mode == ButtonMode.contained
                  ? color.primaryShade
                  : color.primaryColor,
            ),
      ),
    );
  }
}
