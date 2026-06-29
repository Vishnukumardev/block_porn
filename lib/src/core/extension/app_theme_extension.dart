import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension AppExtension on BuildContext {
  // Quick access to the overall theme
  ThemeData get theme => Theme.of(this);

  // Quick access to color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Quick access to typography
  TextTheme get textTheme => Theme.of(this).textTheme;

  //access for AppBar
  AppBarThemeData get appBarTheme => Theme.of(this).appBarTheme;

  //access for height
  double get height => MediaQuery.of(this).size.height;

  //access for width
  double get width => MediaQuery.of(this).size.width;

  //access for inputDecortion
  InputDecorationThemeData get decoration => Theme.of(this).inputDecorationTheme;
}
