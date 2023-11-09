import 'dart:async';
import 'dart:ui';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:wonders/common_libs.dart';
import 'package:wonders/logic/common/platform_info.dart';
import 'package:wonders/ui/common/utils/page_routes.dart';
import 'package:wonders/ui/userInfo/userInfoProvider.dart';

class AppLogic {
  /// Indicates to the rest of the app that bootstrap has not completed.
  /// The router will use this to prevent redirects while bootstrapping.
  bool isBootstrapComplete = false;
  UserInfoProvider? _userInfoProvider;

  UserInfoProvider get userInfoProvider => _userInfoProvider!;
  set userInfoProvider(UserInfoProvider value) {
    _userInfoProvider = value;
  }

  /// Indicates which orientations the app will allow be default. Affects Android/iOS devices only.
  /// Defaults to both landscape (hz) and portrait (vt)
  List<Axis> supportedOrientations = [Axis.vertical, Axis.horizontal];

  /// Allow a view to override the currently supported orientations. For example, [FullscreenVideoViewer] always wants to enable both landscape and portrait.
  /// If a view sets this override, they are responsible for setting it back to null when finished.
  List<Axis>? _supportedOrientationsOverride;
  set supportedOrientationsOverride(List<Axis>? value) {
    if (_supportedOrientationsOverride != value) {
      _supportedOrientationsOverride = value;
      _updateSystemOrientation();
    }
  }

  /// Initialize the app and all main actors.
  /// Loads settings, sets up services etc.
  Future<void> bootstrap() async {
    debugPrint('bootstrap start...');
    // Set min-sizes for desktop apps
    if (PlatformInfo.isDesktop) {
      await DesktopWindow.setMinWindowSize($styles.sizes.minAppSize);
    }

    // Load any bitmaps the views might need
    await AppBitmaps.init();

    // Set preferred refresh rate to the max possible (the OS may ignore this)
    if (PlatformInfo.isAndroid) {
      await FlutterDisplayMode.setHighRefreshRate();
    }

    // Settings
    await settingsLogic.load();

    // Localizations
    await localeLogic.load();

    // Wonders Data
    wondersLogic.init();

    // Events
    // timelineLogic.init();

    // Flag bootStrap as complete
    isBootstrapComplete = true;

    // Load initial view (replace empty initial view which is covered by a native splash screen)
    bool showIntro = settingsLogic.hasCompletedOnboarding.value == false;
    if (showIntro) {
      // appRouter.go(ScreenPaths.intro);
      appRouter.go(ScreenPaths.home);
    } else {
      appRouter.go(ScreenPaths.home);
    }
  }

  Future<T?> showFullscreenDialogRoute<T>(BuildContext context, Widget child, {bool transparent = false}) async {
    return await Navigator.of(context).push<T>(
      PageRoutes.dialog<T>(child, duration: $styles.times.pageTransition),
    );
  }

  /// Called from the UI layer once a MediaQuery has been obtained
  void handleAppSizeChanged() {
    /// Disable landscape layout on smaller form factors
    bool isSmall = display.size.shortestSide / display.devicePixelRatio < 600;
    supportedOrientations = isSmall ? [Axis.vertical] : [Axis.vertical, Axis.horizontal];
    _updateSystemOrientation();
  }

  Display get display => PlatformDispatcher.instance.displays.first;

  bool shouldUseNavRail() => display.size.width > display.size.height && display.size.height > 250;

  /// Enable landscape, portrait or both. Views can call this method to override the default settings.
  /// For example, the [FullscreenVideoViewer] always wants to enable both landscape and portrait.
  /// If a view overrides this, it is responsible for setting it back to [supportedOrientations] when disposed.
  void _updateSystemOrientation() {
    final axisList = _supportedOrientationsOverride ?? supportedOrientations;
    //debugPrint('updateDeviceOrientation, supportedAxis: $axisList');
    final orientations = <DeviceOrientation>[];
    if (axisList.contains(Axis.vertical)) {
      orientations.addAll([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    if (axisList.contains(Axis.horizontal)) {
      orientations.addAll([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    SystemChrome.setPreferredOrientations(orientations);
  }
}

class AppImageCache extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() {
    this.imageCache.maximumSizeBytes = 250 << 20; // 250mb
    return super.createImageCache();
  }
}
