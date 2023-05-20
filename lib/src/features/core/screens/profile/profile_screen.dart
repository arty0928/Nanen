import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import 'widget/avatar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget _userInformation(String title, int value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 15, color: tDarkColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              AvatarWidget(
                type: AvatarType.TYPE3,
                thumbPath: 'https://picsum.photos/250?image=9',
                size: 80,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        _userInformation("Eunseopark", 15),
                        _userInformation("rer", 15),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
