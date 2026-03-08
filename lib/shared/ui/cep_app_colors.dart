import 'package:flutter/material.dart';

sealed class CepAppColors {
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color primaryColor = Color(0xFFE040FB);
  static const Color secondaryColor = whiteColor;
  static const Color errorColor = Color(0xFFFF5252);

  // Dark Theme Colors
  static const Color darkBgColor = Color(0xFF222222);
  // Light Theme Colors
  static const Color lightBgColor = whiteColor;
}
