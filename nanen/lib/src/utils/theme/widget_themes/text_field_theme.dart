import 'package:flutter/material.dart';
import 'package:nanen/src/constants/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInPutDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: tSeconddaryColor,
          floatingLabelStyle: TextStyle(color: tSeconddaryColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: tSeconddaryColor),
          ));

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: tPrimaryColor,
          floatingLabelStyle: TextStyle(color: tPrimaryColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: tPrimaryColor),
          ));
}
