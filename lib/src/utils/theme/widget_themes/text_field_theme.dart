import 'package:flutter/material.dart';
import 'package:nanen/src/constants/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInPutDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      prefixIconColor: tSeconddaryColor,
      floatingLabelStyle: const TextStyle(color: tSeconddaryColor),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: tSeconddaryColor),
      ));

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      prefixIconColor: tPrimaryColor,
      floatingLabelStyle: const TextStyle(color: tPrimaryColor),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: tPrimaryColor),
      ));
}
