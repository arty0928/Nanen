import 'package:flutter/material.dart';
import 'package:nanen/src/constants/colors.dart';
import 'package:nanen/src/constants/image_strings.dart';
import 'package:nanen/src/constants/sizes.dart';
import 'package:nanen/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var height = mediaQuery.size.height;

    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSeconddaryColor : tPrimaryColor,
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
                image: const AssetImage(tWelcomeScreenImage),
                height: height * 0.4),
            Column(
              children: [
                Text(
                  tWelcomeTitle,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  tWelcomeSubTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {}, child: Text(tLogin.toUpperCase())),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: Text(tSignup.toUpperCase())),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
