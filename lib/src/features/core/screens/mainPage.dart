import 'package:flutter/material.dart';
import 'package:nanen/src/features/core/screens/HomeTemplate/fitness_app/fitness_app_home_screen.dart';
import 'package:nanen/src/utils/nav_foot_bar/nav_foot_bar.dart';

import '../../user/mypage/mypage.dart';
import 'Home/home_page.dart';
import 'calendar/calendar_main.dart';
import 'misson/screen/mission_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  List screens = [
    const FitnessAppHomeScreen(),
    // const MissionHomePage(),
    const MissionScreen(),
    const CalendarPage(),
    const MyPage(),
  ];

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens.elementAt(selectedIndex),
      ),
      bottomNavigationBar:
          NavFootBar(selectedIndex: selectedIndex, onClicked: onClicked),
    );
  }
}
