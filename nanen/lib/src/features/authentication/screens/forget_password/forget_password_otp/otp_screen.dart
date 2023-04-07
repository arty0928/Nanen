import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanen/src/constants/sizes.dart';
import 'package:nanen/src/constants/text_strings.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tOtpTitle,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 80.0,
                  ),
                ),
                Text(tOtpSubTitle.toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 40.0),
                const Text("${tOtpMessage}support@naver.com",
                    textAlign: TextAlign.center),
                const SizedBox(height: 20.0),
                OtpTextField(
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  onSubmit: (code) {
                    print("otp is => $code");
                  },
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text(tNext))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
