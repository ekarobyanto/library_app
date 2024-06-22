import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_app/src/core/overlay/overlay.dart';
import 'package:library_app/src/theme/app_theme.dart';

class LoadingOverlay implements AppOverlay {
  late OverlayEntry _overlayEntry;

  set _overlay(OverlayEntry overlay) => _overlayEntry = overlay;

  @override
  void show(BuildContext context, [String? message]) {
    _overlay = _createOverlay(message);
    Overlay.of(context).insert(_overlayEntry);
  }

  @override
  void hide() => _overlayEntry.remove();

  _createOverlay([String? message]) => OverlayEntry(
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
