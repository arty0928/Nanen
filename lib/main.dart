import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wonders/common_libs.dart';
import 'package:wonders/logic/locale_logic.dart';
import 'package:wonders/logic/wallpaper_logic.dart';
import 'package:wonders/logic/wonders_logic.dart';
import 'package:wonders/ui/screens/nanen_home/nanen_home_screen.dart';
import 'package:wonders/ui/userInfo/userInfoProvider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Keep native splash screen up until app is finished bootstrapping
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Start app
  registerSingletons();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserInfoProvider(),
      child: WondersApp(),
    ),
  );

  // Initialize UserInfoProvider
  appLogic.userInfoProvider = GetIt.I.get<UserInfoProvider>();

  await appLogic.bootstrap();

  // Remove splash screen when bootstrap is complete
  FlutterNativeSplash.remove();
}

/// Creates an app using the [MaterialApp.router] constructor and the global `appRouter`, an instance of [GoRouter].
class WondersApp extends StatelessWidget with GetItMixin {
  WondersApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final locale = watchX((SettingsLogic s) => s.currentLocale);
    return MaterialApp.router(
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
      locale: locale == null ? null : Locale(locale),
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.routerDelegate,
      // routerDelegate: appRouter.routerDelegate.clone(initialRoutes: [NanenHomeScreen()]),
      theme: ThemeData(fontFamily: $styles.text.body.fontFamily, useMaterial3: true),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

/// Create singletons (logic and services) that can be shared across the app.
void registerSingletons() {
  //Home
  // GetIt.I.registerLazySingleton<HomeLogic>(() => HomeLogic());

  // Top level app controller
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());
  // Wonders
  GetIt.I.registerLazySingleton<WondersLogic>(() => WondersLogic());
  GetIt.I.registerLazySingleton<SettingsLogic>(() => SettingsLogic());
  // Localizations
  GetIt.I.registerLazySingleton<LocaleLogic>(() => LocaleLogic());

  //Login
  GetIt.I.registerLazySingleton<UserInfoProvider>(() => UserInfoProvider());
}

/// Add syntax sugar for quickly accessing the main "logic" controllers in the app
/// We deliberately do not create shortcuts for services, to discourage their use directly in the view/widget layer.
AppLogic get appLogic => GetIt.I.get<AppLogic>();
WondersLogic get wondersLogic => GetIt.I.get<WondersLogic>();
SettingsLogic get settingsLogic => GetIt.I.get<SettingsLogic>();
WallPaperLogic get wallpaperLogic => GetIt.I.get<WallPaperLogic>();
LocaleLogic get localeLogic => GetIt.I.get<LocaleLogic>();

/// Global helpers for readability
AppLocalizations get $strings => localeLogic.strings;
AppStyle get $styles => WondersAppScaffold.style;
