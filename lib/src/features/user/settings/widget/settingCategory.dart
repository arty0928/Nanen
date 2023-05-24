import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nanen/src/constants/colors.dart';

class MyPageCategory extends StatelessWidget {
  const MyPageCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const heightSpace = 15.0;

    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: heightSpace - 5.0,
          ),
          Row(
            children: [
              Icon(
                LineAwesomeIcons.face_with_tears_of_joy,
                size: 18.0,
                color: tSeconddaryColor,
              ),
              SizedBox(width: 10),
              Text(
                '감정온도',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 1,
            color: tPrimaryColor,
          ),
          SizedBox(
            height: heightSpace - 3.0,
          ),
          Row(
            children: [
              Icon(
                LineAwesomeIcons.calendar_check_1,
                size: 18.0,
                color: tSeconddaryColor,
              ),
              SizedBox(width: 10),
              Text(
                '미션',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(
            height: heightSpace,
          ),
          Row(
            children: [
              Icon(
                LineAwesomeIcons.angle_right,
                size: 18.0,
                color: tSeconddaryColor,
              ),
              SizedBox(width: 10),
              Text(
                '다이어리',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(
            height: heightSpace,
          ),
          Row(
            children: [
              Icon(
                LineAwesomeIcons.address_book_1,
                size: 18.0,
                color: tSeconddaryColor,
              ),
              SizedBox(width: 10),
              Text(
                '감정 다이어리',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),

          //기타
          SizedBox(height: 50),
          SizedBox(
            height: heightSpace,
          ),
          Row(
            children: [
              Icon(
                LineAwesomeIcons.cogs,
                size: 18.0,
                color: tSeconddaryColor,
              ),
              SizedBox(width: 10),
              Text(
                '기타',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Divider(
            thickness: 1,
            color: tPrimaryColor,
          ),
          SizedBox(
            height: heightSpace - 3.0,
          ),

          Row(
            children: [
              Icon(
                LineAwesomeIcons.question,
                size: 18.0,
                color: tSeconddaryColor,
              ),
              SizedBox(width: 10),
              Text(
                'FAQ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(
            height: heightSpace,
          ),
          Row(
            children: [
              Icon(
                LineAwesomeIcons.user_friends,
                size: 18.0,
                color: tSeconddaryColor,
              ),
              SizedBox(width: 10),
              Text(
                '친구초대',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
