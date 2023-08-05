import 'package:wonders/common_libs.dart';

extension WonderColorExtensions on WonderType {
  Color get bgColor {
    switch (this) {
      case WonderType.greatWall:
        return const Color(0xFF642828);
      case WonderType.petra:
        return const Color(0xFF444B9B);
      case WonderType.colosseum:
        return const Color(0xFF1E736D);
      case WonderType.chichenItza:
        return const Color(0xFF164F2A);
    }
  }

  Color get fgColor {
    switch (this) {
      case WonderType.greatWall:
        return const Color(0xFF688750);
      case WonderType.petra:
        return const Color(0xFF1B1A65);
      case WonderType.colosseum:
        return const Color(0xFF4AA39D);
      case WonderType.chichenItza:
        return const Color(0xFFE2CFBB);
    }
  }
}

extension ColorFilterOnColor on Color {
  ColorFilter get colorFilter => ColorFilter.mode(this, BlendMode.srcIn);
}
