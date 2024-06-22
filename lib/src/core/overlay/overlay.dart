import 'package:flutter/widgets.dart';

abstract class AppOverlay {
  void show(BuildContext context, [String? message]);
  void hide();
}
