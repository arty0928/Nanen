import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:nanen/src/constants/colors.dart';
import 'package:nanen/src/features/core/screens/misson/controller/mission_controller.dart';
import 'package:nanen/src/features/core/screens/misson/widgets/progress.dart';
import 'package:nanen/src/utils/appbar/costume_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final obController = MissionController();
    return Scaffold(
      appBar: const CostumedAppBar(bartitle: 'Mission'),
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obController.pages,
            enableSideReveal: true,
            liquidController: obController.controller,
            onPageChangeCallback: obController.onPageChangedCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            waveType: WaveType.circularReveal,
          ),
          Positioned(
            bottom: 40.0,
            child: OutlinedButton(
              // onPressed: () => obController.animateToNextSlide(),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProgressPage()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                    color: tDarkColor, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
            // ResponsiveButton(),
          ),
          // Positioned(
          //   top: 50,
          //   right: 20,
          //   child: TextButton(
          //     onPressed: () => obController.skip(),
          //     child: const Text("Skip", style: TextStyle(color: Colors.grey)),
          //   ),
          // ),
          Obx(
            () => Positioned(
              bottom: 15,
              child: AnimatedSmoothIndicator(
                count: 4,
                activeIndex: obController.currentPage.value,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color(0xff272727),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
