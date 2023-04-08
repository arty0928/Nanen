import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nanen/src/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  //Call
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }
}
