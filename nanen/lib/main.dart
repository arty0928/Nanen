import 'package:flutter/material.dart';
import 'package:nanen/src/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.dartTheme,
      themeMode: ThemeMode.system,
      home: const AppHome(),
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
