import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/models_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  get pages => [
        OnBoardingPageWidget(
          model: OnBoardingModel(
            image: tOnBoardingImage1,
            title: tOnBoardingTitle1,
            subTitle: tOnBoardingSubTitle1,
            counterText: tOnBoardingCounter1,
            bgColor: tOnBoardingPage1Color,
          ),
        ),
        OnBoardingPageWidget(
          model: OnBoardingModel(
            image: tOnBoardingImage2,
            title: tOnBoardingTitle2,
            subTitle: tOnBoardingSubTitle2,
            counterText: tOnBoardingCounter2,
            bgColor: tOnBoardingPage2Color,
          ),
        ),
        OnBoardingPageWidget(
          model: OnBoardingModel(
            image: tOnBoardingImage3,
            title: tOnBoardingTitle3,
            subTitle: tOnBoardingSubTitle3,
            counterText: tOnBoardingCounter3,
            bgColor: tOnBoardingPage3Color,
          ),
        ),
      ];

  onPageChangedCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
  skip() => controller.jumpToPage(page: 2);

  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    if (nextPage == 3) {
      nextPage = 0;
    }
    controller.jumpToPage(page: nextPage);
  }
}
