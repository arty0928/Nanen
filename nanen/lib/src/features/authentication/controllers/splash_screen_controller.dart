import 'package:get/get.dart';
import 'package:nanen/src/features/authentication/screens/welcome/welcome.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(microseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(microseconds: 5000));
    Get.to(() => const Welcome());
  }
}
