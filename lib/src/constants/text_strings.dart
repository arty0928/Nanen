/* -- App Text Strings -- */

// -- GLOBAL Texts
import 'package:flutter/material.dart';

const String tNext = "Next";
const String tLogin = "Login";
const String tEmail = "E-Mail";
const String tSignup = "Signup";
const String tPhoneNo = "Phone No";
const String tPassword = "Password";
const String tFullName = "Full Name";
const String tForgetPassword = "Forget Password";
const String tSignInWithGoogle = "Sign-In with Google";

// -- Splash Screen Text
const String tAppName = ".appable/";
const String tAppTagLine = "Learn To Code. \nFree For Everyone";

// -- On Boarding Text
const String tOnBoardingTitle1 = "Active";
const String tOnBoardingTitle2 = "Calm";
const String tOnBoardingTitle3 = "Creative";
const String tOnBoardingTitle4 = "People";

const String tOnBoardingSubTitle1 =
    "Let's start your journey with us on this amazing and easy platform.";
const String tOnBoardingSubTitle2 =
    "Get Video Tutorials of each topic to learn things easily.";
const String tOnBoardingSubTitle3 =
    "Save time by just copy pasting complete apps you learned from videos.";
const String tOnBoardingSubTitle4 =
    "Save time by just copy pasting complete apps you learned from videos.";

const String tOnBoardingCounter1 = "1/4";
const String tOnBoardingCounter2 = "2/4";
const String tOnBoardingCounter3 = "3/4";
const String tOnBoardingCounter4 = "4/4";

// -- Welcome Screen Text
const String tWelcomeTitle = "Build Awesome Apps";
const String tWelcomeSubTitle =
    "Let's put your creativity on the development highway.";

// -- Login Screen Text
const String tLoginTitle = "Welcome Back,";
const String tLoginSubTitle = "Make it work, make it right, make it fast.";
const String tRememberMe = "Remember Me?";
const String tDontHaveAnAccount = "Don't have an Account? ";

// -- Sign Up Screen Text
const String tSignUpTitle = "Get On Board!";
const String tSignUpSubTitle = "Create your profile to start your Journey.";
const String tAlreadyHaveAnAccount = "Already have an Account? ";

// -- Forget Password Text
const String tForgetPasswordTitle = "Make Selection!";
const String tForgetPasswordSubTitle =
    "Select one of the options given below to reset your password.";
const String tResetViaEMail = "Reset via Mail Verification";
const String tResetViaPhone = "Reset via Phone Verification";

// -- Forget Password Via Phone - Text
const String tForgetPhoneSubTitle =
    "Enter your registered Phone No to receive OTP";

// -- Forget Password Via E-Mail - Text
const String tForgetMailSubTitle =
    "Enter your registered E-Mail to receive OTP";

// -- OTP Screen - Text
const String tOtpTitle = "CO\nDE";
const String tOtpSubTitle = "Verification";
const String tOtpMessage = "Enter the verification code sent at";

// -- Home - Text
const String tActiveText = "Active Design 화면입니다.";
const String tCalmText = "Calme Design 화면입니다.";
const String tCreativeText = "Creative Design 화면입니다.";
const String tPeopleText = "People Design 화면입니다.";

// -- Profile Screen - Text
const String tProfile = "Profile";
const String tEditProfile = "Edit Profile";
const String tLogoutDialogHeading = " Logout";
const String tProfileHeading = "Coding with T";
const String tProfileSubHeading = "superAdmin@coding.com";

// -- Update Profile Screen - Text
const String tDelete = "Delete";
const String tJoined = "Joined";
const String tJoinedAt = "31 October 2022";

// -- Menu
const String tMenu5 = "tLogout";
const String tMenu1 = "Settings";
const String tMenu4 = "Information";
const String tMenu2 = "Billing Details";
const String tMenu3 = "User Management";

// -- 김동진
class AppLargeText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;

  const AppLargeText(
      {Key? key, this.size = 30, required this.text, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class AppText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;

  const AppText(
      {Key? key,
      this.size = 16,
      required this.text,
      this.color = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
