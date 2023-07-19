import 'package:flutter/material.dart';
import 'package:nanen/src/features/user/settings/update_profile.dart';

import '../../../../constants/colors.dart';

class EditProfileBtn extends StatelessWidget {
  const EditProfileBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          _navigateEditPage(context);
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: tPrimaryColor),
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: tDarkColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_navigateEditPage(BuildContext context) {
  Navigator.of(context).push(PageRouteBuilder(
    transitionDuration: const Duration(microseconds: 2000),
    pageBuilder: (context, animation, secondaryAnimation) {
      return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: const UpdateProfileScreen());
    },
  ));
}

class SaveEditProfileBtn extends StatelessWidget {
  const SaveEditProfileBtn({super.key});

  void saveEditProfile() {
    print("save eidt profile");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          saveEditProfile();
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: tAccentColor),
                    color: tAccentColor),
                child: const Text(
                  'SAVE',
                  style: TextStyle(
                    color: tDarkColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditAIProfileAIBtn extends StatelessWidget {
  const EditAIProfileAIBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          _navigateEditPage(context);
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: tPrimaryColor),
                    color: tPrimaryColor),
                child: const Text(
                  'Make AI Profile',
                  style: TextStyle(
                    color: tDarkColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
