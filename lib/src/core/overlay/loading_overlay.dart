import 'package:flutter/material.dart';
import 'package:library_app/src/core/overlay/overlay.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/loading.dart';

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
                const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: LoadingWidget()),
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
