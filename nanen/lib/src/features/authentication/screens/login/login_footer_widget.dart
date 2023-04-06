import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
        const SizedBox(
          height: tFormHeight - 20,
        ),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
                text: tDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(
                    text: tSignup,
                    style: TextStyle(color: Colors.blue),
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
