import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class MyPageChart extends StatelessWidget {
  const MyPageChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Column(
        children: [
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Text(
          //       'calm',
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 13,
          //           color: tDarkColor),
          //     ),
          //     Text(
          //       'active',
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 13,
          //           color: tDarkColor),
          //     ),
          //     Text(
          //       'people',
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 13,
          //           color: tDarkColor),
          //     ),
          //     Text(
          //       'creative',
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 13,
          //           color: tDarkColor),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 10),
          Container(
            width: 410,
            height: 200,
            color: tPrimaryColor,
          ),
        ],
      ),
    );
  }
}
