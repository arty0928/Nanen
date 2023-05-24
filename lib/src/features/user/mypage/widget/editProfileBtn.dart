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
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const UpdateProfileScreen()),
          );
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
