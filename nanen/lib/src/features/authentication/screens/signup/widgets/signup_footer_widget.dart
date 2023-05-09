import 'package:flutter/material.dart';

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
        const Text("OR"),
        const SizedBox(
          height: tFormHeight - 20,
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
              onPressed: () {},
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
            onPressed: () {},
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
