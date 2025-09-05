// app_theme.dart ya app_constants.dart

import 'package:flutter/material.dart';

class AppBorderRadius {
  static const double small = 12.0;
  static const double medium = 20.0;
  static const double large = 30.0;
  static const BorderRadius roundedSmall = BorderRadius.all(Radius.circular(small));
  static const BorderRadius roundedMedium = BorderRadius.all(Radius.circular(medium));
  static const BorderRadius roundedLarge = BorderRadius.all(Radius.circular(large));
}
