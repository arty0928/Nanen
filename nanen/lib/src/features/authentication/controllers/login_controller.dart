import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nanen/src/repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  //Call this Function from Design & it will do the rest
  void loginUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }
}
