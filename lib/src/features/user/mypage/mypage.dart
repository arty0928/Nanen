import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nanen/src/constants/colors.dart';
import 'package:nanen/src/constants/image_strings.dart';

import '../../core/screens/profile/widget/avatar_widget.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  Widget _information() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              AvatarWidget(
                type: AvatarType.TYPE3,
                thumbPath: tProfileImage,
                size: 80,
              ),
              _userInformation("Eunseopark", 15),
              _userInformation("Eunseopark", 15),
              _userInformation("Eunseopark", 15),
            ],
          ),
        ),
      ],
    );
  }

  Widget _userInformation(String title, int value) {
    return Row(
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
    return Scaffold(
        backgroundColor: tWhiteColor,
        appBar: const CostumedAppBar(
          bartitle: 'MyPage',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              _information(),
            ],
          ),
        ));
  }
}

class CostumedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String bartitle;

  const CostumedAppBar({
    super.key,
    required this.bartitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: tSeconddaryColor,
      elevation: 0,
      title: Text(
        bartitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: tWhiteColor,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              LineAwesomeIcons.cog,
              size: 25.0,
              color: tWhiteColor,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
