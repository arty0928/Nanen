import 'package:flutter/material.dart';
import 'package:nanen/src/features/core/screens/design_course/home_design_course.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return const DesignCourseHomeScreen();
    }
}
