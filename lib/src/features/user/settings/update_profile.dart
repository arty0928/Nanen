import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nanen/src/constants/colors.dart';
import 'package:nanen/src/constants/image_strings.dart';
import 'package:nanen/src/constants/sizes.dart';
import 'package:nanen/src/constants/text_strings.dart';
import 'package:nanen/src/features/user/settings/widget/settingCategory.dart';
import 'package:nanen/src/features/user/mypage/top/mypageTop.dart';
import 'package:nanen/src/features/user/mypage/widget/editProfileBtn.dart';
import 'package:nanen/src/utils/appbar/costume_app_bar.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CostumedAppBar(
        bartitle: 'Edit Profile',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child:
                                const Image(image: AssetImage(tProfileImage))),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: tPrimaryColor.withOpacity(0.8)),
                          child: const Icon(
                            LineAwesomeIcons.camera,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              const EditAIProfileAIBtn(),
              const SizedBox(
                height: 10,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tEmail),
                          iconColor: tSeconddaryColor,
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tID),
                          iconColor: tSeconddaryColor,
                          prefixIcon: Icon(Icons.person_outline_rounded)),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tPassword),
                          iconColor: tSeconddaryColor,
                          prefixIcon: Icon(Icons.password_outlined)),
                    ),
                    const SizedBox(
                      height: tFormHeight,
                    ),

                    /// - Form Submit Button
                    const SaveEditProfileBtn(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
