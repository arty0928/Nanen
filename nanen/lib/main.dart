import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanen/firebase_options.dart';
import 'package:nanen/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:nanen/src/repository/authentication_repository/authentication_repository.dart';
import 'package:nanen/src/utils/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
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
      home: const CircularProgressIndicator(),
    );
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
