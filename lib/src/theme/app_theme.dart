import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

class AppColors {
  final Color primaryColor = const Color.fromRGBO(25, 67, 177, 1);
  final Color primaryShade = const Color.fromRGBO(229, 236, 255, 1);
  final Color greenShade = const Color(0xFFCAFFCA);
  final Color grayShade = const Color(0xFFF5F5F5);
  final Color danger = const Color(0xFFFF0000);
}

class Constraints {
  final double small = 4.0;
  final double medium = 8.0;
  final double large = 12.0;
  final double xl = 16.0;
  final double xxl = 20.0;
}

AppColors color = AppColors();
Constraints constraints = Constraints();

final appFont = GoogleFonts.inter();
