import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class NavFootBar extends StatelessWidget {
  final selectedIndex;
  ValueChanged<int> onClicked;
  NavFootBar({
    this.selectedIndex,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      iconSize: 30,

      // type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.deepPurple.shade200,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.task),
          label: 'Mission',
          backgroundColor: Colors.deepPurple.shade200,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.calendar_today),
          label: 'Calendar',
          backgroundColor: Colors.deepPurple.shade200,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: 'My Page',
          backgroundColor: Colors.deepPurple.shade200,
        ),
      ],
      onTap: onClicked,
      backgroundColor: tPrimaryColor,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.white,
    );
  }
}
