import 'package:flutter/material.dart';
import 'package:wonders/logic/data/wonders_data/nanen_image_data.dart/image_strings.dart';
import 'package:wonders/ui/screens/mypage/top/widget/mypage_numbers.dart';
import 'package:wonders/ui/screens/mypage/update_profile_screen.dart'; // EditMypageScreen을 import 해주세요

class MyPageTop extends StatefulWidget {
  const MyPageTop({
    super.key,
  });

  @override
  State<MyPageTop> createState() => _MyPageTopState();
}

class _MyPageTopState extends State<MyPageTop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile 이미지를 클릭할 수 있는 InkWell 위젯으로 감싸기
          InkWell(
            onTap: () {
              // Profile 이미지를 클릭했을 때 EditMypageScreen로 이동
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UpdateProfileScreen(),
              ));
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(tProfileImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Expanded(child: MyPageNumbers())
        ],
      ),
    );
  }
}
