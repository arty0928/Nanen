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
      // padding: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile
          Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(tProfileImage),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Number
          Expanded(child: MyPageNumbers())
        ],
      ),
    );
  }
}
