import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../constants/colors.dart';

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
