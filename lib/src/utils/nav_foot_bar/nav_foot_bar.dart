import 'package:flutter/material.dart';

class navFootBar extends StatefulWidget {
  const navFootBar({super.key});

  @override
  State<navFootBar> createState() => _navFootBarState();
}

class _navFootBarState extends State<navFootBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
