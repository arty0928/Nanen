import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nanen/src/constants/colors.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'MyPage',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: tPrimaryColor),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              LineAwesomeIcons.angle_right,
              size: 18.0,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: const Text("this is mypage"),
    );
  }
}
