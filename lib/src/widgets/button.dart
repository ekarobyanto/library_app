import 'package:flutter/material.dart';
import 'package:library_app/src/theme/app_theme.dart';

enum ButtonMode {
  contained,
  outlined,
}

enum IconPosition {
  left,
  right,
}

class AppButton extends StatelessWidget {
  final ButtonMode? mode;
  final String label;
  final Function()? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final IconData? icon;
  final IconPosition? iconPosition;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.buttonStyle,
    this.textStyle,
    this.mode = ButtonMode.contained,
    this.icon,
    this.iconPosition = IconPosition.left,
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
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                iconPosition == IconPosition.left
                    ? Row(
                        children: [
                          Icon(icon, color: Colors.white),
                          const SizedBox(width: 8),
                        ],
                      )
                    : const SizedBox.shrink(),
                Text(
                  label,
                  style: textStyle ??
                      const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                ),
                iconPosition == IconPosition.right
                    ? Row(
                        children: [
                          const SizedBox(width: 8),
                          Icon(icon, color: Colors.white),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            )
          : Text(
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
