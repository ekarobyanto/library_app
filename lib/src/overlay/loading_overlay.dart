import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_app/src/theme/app_theme.dart';

class LoadingOverlay {
  late OverlayEntry _overlayEntry;

  set _overlay(OverlayEntry overlay) => _overlayEntry = overlay;

  void show(BuildContext context, [String? message]) {
    _overlay = createOverlay(message);
    Overlay.of(context).insert(_overlayEntry);
  }

  void hide() => _overlayEntry.remove();

  OverlayEntry createOverlay([String? message]) => OverlayEntry(
        builder: (context) => Stack(
          children: [
            ModalBarrier(
              dismissible: false,
              color: Colors.grey.withOpacity(0.3),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SpinKitFoldingCube(
                    itemBuilder: (context, index) => DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven
                            ? color.primaryShade
                            : color.primaryColor,
                      ),
                    ),
                  ),
                ),
                message != null
                    ? Material(
                        color: Colors.transparent,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: color.primaryColor,
                            fontSize: 16,
                          ),
                          child: Text(message),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      );
}
