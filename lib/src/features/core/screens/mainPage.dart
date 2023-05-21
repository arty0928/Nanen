import 'package:flutter/material.dart';
import 'package:nanen/src/utils/nav_foot_bar/nav_foot_bar.dart';

import '../../user/mypage/mypage.dart';
import 'Home/home_page.dart';
import 'calendar/calendar_main.dart';
import 'misson/mission_main.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  List screens = [
    const HomePage(),
    const MissionHomePage(),
    const CalendarPage(),
    const Mypage(),
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
