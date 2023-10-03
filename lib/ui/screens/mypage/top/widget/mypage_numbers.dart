import 'package:flutter/material.dart';
import 'package:wonders/common_libs.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'djdropthebeat',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: NanenAppTheme.fontName),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, fontFamily: NanenAppTheme.fontName),
                ),
                Text(
                  'active',
                  style: TextStyle(fontFamily: NanenAppTheme.fontName),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  '14',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, fontFamily: NanenAppTheme.fontName),
                ),
                Text(
                  'calm',
                  style: TextStyle(fontFamily: NanenAppTheme.fontName),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  '17',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, fontFamily: NanenAppTheme.fontName),
                ),
                Text(
                  'creative',
                  style: TextStyle(fontFamily: NanenAppTheme.fontName),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  '9',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, fontFamily: NanenAppTheme.fontName),
                ),
                Text(
                  'people',
                  style: TextStyle(fontFamily: NanenAppTheme.fontName),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
