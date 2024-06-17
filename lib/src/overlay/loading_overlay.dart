import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_app/src/theme/app_theme.dart';

OverlayEntry loadingOverlay = OverlayEntry(
  builder: (context) => Stack(
    children: [
      ModalBarrier(
        dismissible: false,
        color: Colors.grey.withOpacity(0.3),
      ),
      Center(
        child: SpinKitFoldingCube(
          itemBuilder: (context, index) => DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? color.primaryShade : color.primaryColor,
            ),
          ),
        ),
      ),
    ],
  ),
);
