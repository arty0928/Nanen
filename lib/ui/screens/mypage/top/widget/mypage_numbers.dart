import 'package:flutter/material.dart';

class MyPageNumbers extends StatelessWidget {
  const MyPageNumbers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'djdropthebeat',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  '10',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text('active')
              ],
            ),
            Column(
              children: [
                Text(
                  '14',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text('calm')
              ],
            ),
            Column(
              children: [
                Text(
                  '17',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text('creative')
              ],
            ),
            Column(
              children: [
                Text(
                  '9',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text('people')
              ],
            ),
          ],
        )
      ],
    );
  }
}
