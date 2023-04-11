import 'package:flutter/material.dart';
import 'package:nanen_mission/pages/main_mission_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Page',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      // home: ProgressPage(),
    );
  }
}
