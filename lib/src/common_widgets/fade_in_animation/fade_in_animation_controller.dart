import 'package:get/get.dart';
import 'package:nanen/src/features/core/screens/Home/home_page.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(const Duration(microseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(microseconds: 3000));
    animate.value = false;
    await Future.delayed(const Duration(microseconds: 2000));
    Get.offAll(() => const HomePage());
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(microseconds: 500));
    animate.value = true;
  }
}
