import 'package:wonders/common_libs.dart';

extension WonderColorExtensions on WonderType {
  Color get bgColor {
    switch (this) {
      case WonderType.greatWall:
        // return const Color(0xFF642828);
        return Color(0xFF1E1466);
      case WonderType.petra:
        // return const Color(0xFF444B9B);
        return tCalmColor;
      case WonderType.colosseum:
        // return const Color(0xFF1E736D);
        return tCreativeColor;
      case WonderType.chichenItza:
        // return const Color(0xFF164F2A);
        return tPeopleColor;
    }
  }

  Color get fgColor {
    switch (this) {
      case WonderType.greatWall:
        // return const Color(0xFF688750);
        return tActiveFgColor;
      case WonderType.petra:
        // return const Color(0xFF1B1A65);
        return tCalmFgColor;
      case WonderType.colosseum:
        // return const Color(0xFF4AA39D);
        return tCreativeFgColor;
      case WonderType.chichenItza:
        // return const Color(0xFFE2CFBB);
        return tPeopleFgColor;
    }
  }
}

extension ColorFilterOnColor on Color {
  ColorFilter get colorFilter => ColorFilter.mode(this, BlendMode.srcIn);
}
