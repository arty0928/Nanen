import 'package:flutter/material.dart';
import 'package:nanen/src/utils/theme/widget_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: ElevatedButton.styleFrom()));
  static ThemeData dartTheme = ThemeData(
      brightness: Brightness.dark, textTheme: TTextTheme.darkTextTheme);
}
