import 'package:flutter/widgets.dart';
import 'package:library_app/src/theme/app_theme.dart';

class AuthBackgroundDecoration extends StatelessWidget {
  const AuthBackgroundDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: color.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(constraints.large),
          bottomRight: Radius.circular(constraints.large),
        ),
      ),
    );
  }
}
