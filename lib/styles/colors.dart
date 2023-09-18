import 'package:wonders/common_libs.dart';
import 'package:wonders/logic/common/color_utils.dart';

export 'wonders_color_extensions.dart';

const tActiveColor = Color.fromRGBO(107, 94, 194, 1);
const tCalmColor = Color.fromRGBO(41, 96, 115, 1);
const tCreativeColor = Color.fromRGBO(53, 108, 181, 1);
const tPeopleColor = Color.fromRGBO(173, 197, 207, 1);

const tActiveFgColor = Color.fromRGBO(253, 247, 255, 1);
const tCalmFgColor = Color.fromRGBO(174, 149, 215, 1);
const tCreativeFgColor = Color.fromRGBO(213, 202, 189, 1);
const tPeopleFgColor = Color.fromRGBO(155, 137, 179, 1);

////nanen
const tPrimaryColor = Color(0xFFC1B0DC);
const tSeconddaryColor = Color(0xFF7E57C2);
const tAccentColor = Color(0xFFFFE400);
const tCardBgColor = Color(0xFFF7F6F1);
const tWhiteColor = Color(0xFFFFFFFF);
const tDarkColor = Color(0xFF000000);
// -- ON-BOARDING COLORS
const tOnBoardingPage1Color = Colors.white;
const tOnBoardingPage2Color = Color(0xfffddcdf);
const tOnBoardingPage3Color = Color(0xffffdcbd);
const tOnBoardingPage4Color = Color(0xFFCDF7F5);
// -- 동진 선배
const textColor1 = Color(0xFF989acd);
const textColor2 = Color(0xFF878593);
const bigTextColot = Color(0xFF2e2e31);
const mainColor = Color(0xFF5d69b3);
const starColor = Color(0xFFe7bb4e);
const mainTextColor = Color(0xFFababad);
const oranges = Color(0xffFF815E);
const purple = Color(0xff613FE5);
const softPurple = Color(0xffD0C3FF);
const calmC = Color(0xff264653);
const activeC = Color(0xff2A9D8F);
const creativeC = Color(0xffF4A261);
const peopleC = Color(0xffE76F51);
//login
const tIconColor = Color(0xFFB6C7D1);
// const tActiveColor = Color(0xFF09126C);
const tTextColor1 = Color(0XFFA7BCC7);
const tTextColor2 = Color(0XFF9BB3C0);
const tFacebookColor = Color(0xFF3B5999);
const tGoogleColor = Color(0xFFDE4B39);
const tBackgroundColor = Color(0xFFECF3F9);

class NanenAppTheme {
  NanenAppTheme._();
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);

  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color darkGrey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color spacer = Color(0xFFF2F2F2);
  // static const String fontName = 'Roboto';
  static const String fontName = 'writerFont';

  //font
  static const String writerFont = 'writerFont';

  static const TextTheme textTheme = TextTheme(
    headlineMedium: display1,
    headlineSmall: headline,
    titleLarge: title,
    titleSmall: subtitle,
    bodyMedium: body2,
    bodyLarge: body1,
    bodySmall: caption,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
}

////////
class AppColors {
  /// Common
  // final Color accent1 = Color(0xFFE4935D);
  final Color accent1 = Color(0xFFe7bb4e);

  final Color accent2 = Color(0xFFBEABA1);
  final Color offWhite = Color(0xFFF8ECE5);
  final Color caption = const Color(0xFF7D7873);
  final Color body = const Color(0xFF514F4D);
  final Color greyStrong = const Color(0xFF272625);
  final Color greyMedium = const Color(0xFF9D9995);
  final Color white = Colors.white;
  final Color black = const Color(0xFF1E1B18);

  final bool isDark = false;

  Color shift(Color c, double d) => ColorUtils.shiftHsl(c, d * (isDark ? -1 : 1));

  ThemeData toThemeData() {
    /// Create a TextTheme and ColorScheme, that we can use to generate ThemeData
    TextTheme txtTheme = (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
    Color txtColor = white;
    ColorScheme colorScheme = ColorScheme(
        // Map our custom theme to the Material ColorScheme
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: accent1,
        primaryContainer: accent1,
        secondary: accent1,
        secondaryContainer: accent1,
        background: offWhite,
        surface: offWhite,
        onBackground: txtColor,
        onSurface: txtColor,
        onError: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red.shade400);

    /// Now that we have ColorScheme and TextTheme, we can create the ThemeData
    /// Also add on some extra properties that ColorScheme seems to miss
    var t = ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme).copyWith(
      textSelectionTheme: TextSelectionThemeData(cursorColor: accent1),
      highlightColor: accent1,
    );

    /// Return the themeData which MaterialApp can now use
    return t;
  }
}
