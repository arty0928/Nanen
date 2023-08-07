import 'package:flutter/material.dart';
import 'package:wonders/logic/data/wonders_data/nanen_image_data.dart/image_strings.dart';
import 'package:wonders/ui/screens/mypage/top/widget/mypage_numbers.dart';

class mypageTop extends StatelessWidget {
  const mypageTop({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(tProfileImage),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Number
          const MyPageNumbers(),
        ],
      ),
    );
  }
}
