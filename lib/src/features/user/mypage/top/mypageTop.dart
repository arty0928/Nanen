import 'package:flutter/material.dart';

import 'widget/myPageNumbers.dart';

class mypageTop extends StatelessWidget {
  const mypageTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Profile
          Container(
            height: 100,
            width: 100,
            decoration:
                BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
          ),

          //number
          const MyPageNumbers(),
        ],
      ),
    );
  }
}
