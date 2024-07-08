import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_app/src/theme/app_theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitFoldingCube(
      itemBuilder: (context, index) => DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? color.primaryShade : color.primaryColor,
        ),
      ),
    );
  }
}
