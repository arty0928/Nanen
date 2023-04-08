import 'package:flutter/material.dart';
import 'package:nanen/src/constants/colors.dart';
import 'package:nanen/src/constants/image_strings.dart';
import 'package:nanen/src/constants/text_strings.dart';
import 'package:nanen/src/repository/authentication_repository/authentication_repository.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: Icon(
        Icons.menu,
        color: isDark ? tWhiteColor : tDarkColor,
      ),
      title: Text(
        tAppName,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //For Dark Color
            color: isDark ? tSeconddaryColor : tCardBgColor,
          ),
          child: IconButton(
            onPressed: () {
              AuthenticationRepository.instance.logout();
            },
            icon: const Image(image: AssetImage(tUserProfileImage)),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
