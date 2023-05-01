import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanen/src/features/authentication/screens/login/login_screen.dart';
import 'package:nanen/src/features/authentication/screens/signup/signup_screen.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: tFormHeight - 30,
        ),
        SizedBox(
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
              ),
              // borderRadius: BorderRadiusDirectional.circular(12),
              // color: Colors.red,
            ),
            child: OutlinedButton.icon(
              icon: const Image(
                image: AssetImage(tGoogleLogoImage),
                width: 20.0,
              ),
              onPressed: () {
                Get.to(() => const SignUpScreen());
              },
              label: const Text(
                tSignInWithGoogle,
                style: TextStyle(
                  color: (Colors.black87),
                ),
              ),
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              Get.to(() => const LoginScreen());
            },
            child: Text.rich(TextSpan(children: [
              TextSpan(
                text: tAlreadyHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextSpan(
                text: tLogin.toUpperCase(),
              ),
            ])))
      ],
    );
  }
}
