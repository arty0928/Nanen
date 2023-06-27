// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nanen/src/utils/theme/theme.dart';

// import 'src/features/core/screens/mainPage.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//         theme: TAppTheme.lightTheme,
//         darkTheme: TAppTheme.dartTheme,
//         themeMode: ThemeMode.system,
//         debugShowCheckedModeBanner: false,
//         defaultTransition: Transition.leftToRightWithFade,
//         transitionDuration: const Duration(milliseconds: 500),
//         // home: const OnBoardingScreen(),
//         // home: const SplashScreen(),
//         // home: const CircularProgressIndicator(),
//         // home: const MissionHomePage());
//         home: const MainPage());
//   }
// }

// class AppHome extends StatelessWidget {
//   const AppHome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("나는_")),
//       body: const Center(child: Text("Home page")),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';
import 'package:nanen/src/features/core/screens/mainPage.dart';

void main() async {
  KakaoSdk.init(nativeAppKey: '76e93a7e6dad66a0b2d3f68f72ae66e7');
  WidgetsFlutterBinding.ensureInitialized(); //flutter 코어 엔진 초기화
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override //alt + shift + f => 코드 정리(format document)
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const App(),
      //home: const KakaoMain(),
      //home: const LoginPage(),
      home: const MainPage(),
    );
  }
}
