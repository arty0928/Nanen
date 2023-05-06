import 'package:flutter/material.dart';

import '../pages/calendar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const HomePage(),
      home: const CalendarPage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
