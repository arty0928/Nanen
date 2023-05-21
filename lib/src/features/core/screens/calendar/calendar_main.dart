import 'package:flutter/material.dart';
import 'package:nanen/src/utils/appbar/costume_app_bar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CostumedAppBar(bartitle: 'Calendar'),
      body: Text("this is calendar page"),
    );
  }
}
