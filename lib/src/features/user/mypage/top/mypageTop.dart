import 'package:flutter/material.dart';
import 'package:nanen/src/constants/image_strings.dart';

import 'widget/myPageNumbers.dart';

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
