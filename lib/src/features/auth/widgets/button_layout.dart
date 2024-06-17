import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthButtonLayout extends StatelessWidget {
  AuthButtonLayout({super.key, required this.buttons});

  List<Widget> buttons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buttons.map(
        (button) {
          final isLastChild = buttons.indexOf(button) == buttons.length - 1;
          return Expanded(
            child: Row(
              children: [
                Expanded(child: button),
                isLastChild
                    ? const SizedBox.shrink()
                    : const SizedBox(width: 8),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
