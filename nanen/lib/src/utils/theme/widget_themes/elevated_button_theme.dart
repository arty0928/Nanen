import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //to avoid creating instances

  // Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      backgroundColor: tSeconddaryColor,
      side: const BorderSide(color: tSeconddaryColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );

  // Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: tSeconddaryColor,
      backgroundColor: tWhiteColor,
      side: const BorderSide(color: tWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}
