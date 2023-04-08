import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanen/src/features/authentication/controllers/signup_controller.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.fullName,
                decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                  label: Text(tEmail),
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.phoneNo,
                decoration: const InputDecoration(
                  label: Text(tPhoneNo),
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                  label: Text(tPassword),
                  prefixIcon: Icon(Icons.fingerprint),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: tFormHeight - 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      SignUpController.instance.registerUser(
                          controller.email.text.trim(),
                          controller.password.text.trim());
                    }
                  },
                  child: Text(tSignup.toUpperCase()),
                ),
              )
            ],
          )),
    );
  }
}
