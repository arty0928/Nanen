import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanen/src/utils/theme/theme.dart';

import 'src/features/core/screens/misson/mission_main.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  //     .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.dartTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        // home: const OnBoardingScreen(),
        // home: const SplashScreen(),
        // home: const CircularProgressIndicator(),
        home: const MissionHomePage());
  }
}

class AppHome extends StatelessWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("나는_")),
      body: const Center(child: Text("Home page")),
    );
  }
}
