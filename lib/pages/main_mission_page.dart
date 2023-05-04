import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nanen_mission/widget/app_large_text.dart';
import 'package:nanen_mission/widget/app_text.dart';

import '../misc/colors.dart';
import '../widget/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "Active.JPG",
    "Calm.JPG",
    "Creative.JPG",
    "People.JPG",
  ];

  List texts = [
    'Active Design 화면입니다',
    'Calm Design 화면입니다',
    'Creative Design 화면입니다',
    'People Design 화면입니다',
  ];

  final CarouselController carouselController = CarouselController();
  // This is for main
  int currentIndex = 0;

  // This is for bottom bar
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/" + images[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(text: texts[index]),
                            const AppText(
                              text: "화면 구성은 추후의",
                              size: 30,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 250,
                              child: AppText(
                                text: "세부 디자인 과정을 통해 완성됩니다.",
                                color: AppColors.textColor2,
                                size: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 280,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(right: 4),
                            width: index == indexDots ? 25 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? Colors.deepPurple
                                  : Colors.deepPurple.shade100,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ResponsiveButton(),
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30,

        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.deepPurple.shade200,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.task),
            label: 'Mission',
            backgroundColor: Colors.deepPurple.shade200,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_today),
            label: 'Calendar',
            backgroundColor: Colors.deepPurple.shade200,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'My Page',
            backgroundColor: Colors.deepPurple.shade200,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
