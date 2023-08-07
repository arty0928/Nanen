import 'package:flutter/cupertino.dart';
import 'package:wonders/common_libs.dart';
import 'package:wonders/ui/screens/home/wonders_home_screen.dart';
import 'package:wonders/ui/screens/mission/mission_home_screen.dart';
import 'package:wonders/ui/screens/mypage/mypage.dart';
import 'package:wonders/ui/screens/nanen_home/nanen_home_screen.dart';
import 'package:wonders/ui/screens/wonder_details/wonders_details_screen.dart';

/// Shared paths / urls used across the app
class ScreenPaths {
  static String splash = '/';
  static String intro = '/welcome';
  static String home = '/home';
  static String mission = '/mission';
  static String mypage = '/mypage';
  static String settings = '/settings';
  static String wonderDetails(WonderType type, {int tabIndex = 0}) => '/wonder/${type.name}?t=$tabIndex';
  static String video(String id) => '/video/$id';
  static String highlights(WonderType type) => '/highlights/${type.name}';
  static String search(WonderType type) => '/search/${type.name}';
  static String artifact(String id) => '/artifact/$id';
  static String collection(String id) => '/collection?id=$id';
  static String maps(WonderType type) => '/maps/${type.name}';
  static String timeline(WonderType? type) => '/timeline?type=${type?.name ?? ''}';
  static String wallpaperPhoto(WonderType type) => '/wallpaperPhoto/${type.name}';
}

/// Routing table, matches string paths to UI Screens, optionally parses params from the paths
final appRouter = GoRouter(
  redirect: _handleRedirect,
  routes: [
    ShellRoute(
        builder: (context, router, navigator) {
          return WondersAppScaffold(child: navigator);
        },
        routes: [
          AppRoute(ScreenPaths.splash, (_) => Container(color: $styles.colors.greyStrong)), // This will be hidden
          AppRoute(ScreenPaths.home, (_) => NanenHomeScreen()),
          AppRoute(ScreenPaths.mission, (_) => HomeScreen()),
          AppRoute('/wonder/:type', (s) {
            int tab = int.tryParse(s.queryParams['t'] ?? '') ?? 0;
            return WonderDetailsScreen(
              type: _parseWonderType(s.params['type']),
              initialTabIndex: tab,
            );
          }, useFade: true),

          //
        ]),
  ],
);

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }
            return CupertinoPage(child: pageContent);
          },
        );
  final bool useFade;
}

String? _handleRedirect(BuildContext context, GoRouterState state) {
  // Prevent anyone from navigating away from `/` if app is starting up.
  if (!appLogic.isBootstrapComplete && state.location != ScreenPaths.splash) {
    return ScreenPaths.splash;
  }
  debugPrint('Navigate to: ${state.location}');
  return null; // do nothing
}

WonderType _parseWonderType(String? value) {
  const fallback = WonderType.chichenItza;
  if (value == null) return fallback;
  return _tryParseWonderType(value) ?? fallback;
}

WonderType? _tryParseWonderType(String value) => WonderType.values.asNameMap()[value];
