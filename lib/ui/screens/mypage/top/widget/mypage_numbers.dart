import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wonders/common_libs.dart';
import 'package:wonders/ui/screens/mypage/top/widget/image_count.dart';
import 'package:wonders/ui/userInfo/userInfoProvider.dart';

class MyPageNumbers extends StatefulWidget {
  const MyPageNumbers({
    super.key,
  });

  @override
  State<MyPageNumbers> createState() => _MyPageNumbersState();
}

class _MyPageNumbersState extends State<MyPageNumbers> {
  late UserInfoProvider userInfoProvider;

  void initState() {
    super.initState();
    print("여기는 마이페이지 넘버");

    userInfoProvider = Provider.of<UserInfoProvider>(context, listen: false);

    // userInfo의 변화를 감지하여 화면 업데이트
    // userInfo의 변화를 감지하여 화면 업데이트
    userInfoProvider.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    userInfoProvider.getUserInfo();
    userInfoProvider.getImageCount();
  }

  @override
  void dispose() {
    // dispose에서 listener를 제거해야 합니다.
    userInfoProvider.removeListener(() {});

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              userInfoProvider.userName.toString(),
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
                  userInfoProvider.activeCount.toString(),
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
                  userInfoProvider.calmCount.toString(),
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
                  userInfoProvider.creativeCount.toString(),
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
                  userInfoProvider.peopleCount.toString(),
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
