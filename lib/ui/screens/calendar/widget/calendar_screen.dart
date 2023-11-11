import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyCalandarScreen extends StatefulWidget {
  const MyCalandarScreen({super.key});

  @override
  State<MyCalandarScreen> createState() => _MyCalandarScreenState();
}

class _MyCalandarScreenState extends State<MyCalandarScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black, width: 2.0), // Add this line for a black border
              ),
              child: HeatMapCalendar(
                datasets: {
                  DateTime(2023, 11, 1): 3,
                  DateTime(2023, 11, 6): 1,
                  DateTime(2023, 11, 9): 2,
                  DateTime(2023, 11, 10): 3,
                  DateTime(2023, 11, 11): 4,
                  DateTime(2023, 11, 13): 2,
                  DateTime(2023, 11, 16): 1,
                  DateTime(2023, 11, 19): 3,
                  DateTime(2023, 11, 23): 2,
                  DateTime(2023, 11, 25): 3,
                  DateTime(2023, 11, 29): 4,
                },
                initDate: DateTime.now(),
                size: 40,
                colorMode: ColorMode.color,
                colorsets: const {
                  1: Color(0xffF14c14),
                  2: Color(0xffFFAC15),
                  3: Color(0xff1185EA),
                  4: Color(0xff1C7D36),
                },
                onClick: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
                },
              ),
            ),
            const SizedBox(height: 40),
            _buildRoundedTile('슬픔', 'lib/images/red.png'),
            const SizedBox(height: 10),
            _buildRoundedTile('보통', 'lib/images/orange.png'),
            const SizedBox(height: 10),
            _buildRoundedTile('기쁨', 'lib/images/blue.png'),
            const SizedBox(height: 10),
            _buildRoundedTile('행복', 'lib/images/green.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedTile(String title, String imagePath) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black, width: 2.0),
          // You can set the background color here
        ),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0), // Adjust the vertical padding as needed
            child: Text(title),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
