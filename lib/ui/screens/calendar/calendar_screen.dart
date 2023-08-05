import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:wonders/ui/screens/calendar/widget/calendar_form.dart';
import 'package:wonders/utils/appbar/costume_app_bar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<Calendar> _getDataSource() {
    final List<Calendar> meetings = <Calendar>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Calendar(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CostumedAppBar(bartitle: 'Calendar'),
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: MeetingDataSource(_getDataSource()),

        // 수정 x
        initialSelectedDate: DateTime.now(),
        cellBorderColor: Colors.transparent,
      ),
    );
  }
}
