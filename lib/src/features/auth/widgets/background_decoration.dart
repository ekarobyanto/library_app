import 'package:flutter/widgets.dart';
import 'package:library_app/src/theme/app_theme.dart';

class AuthBackgroundDecoration extends StatelessWidget {
  final Widget? child;
  final double? height;
  const AuthBackgroundDecoration({super.key, this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(constraints.large),
          bottomRight: Radius.circular(constraints.large),
        ),
      ),
      child: child,
    );
  }
}
