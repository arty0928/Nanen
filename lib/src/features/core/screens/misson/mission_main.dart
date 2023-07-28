// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:intl/intl.dart';
// // import 'package:nanen_mission/widget/app_large_text.dart';
// // import 'package:nanen_mission/widget/app_text.dart';

// import 'package:nanen/src/constants/colors.dart';
// import 'package:nanen/src/features/core/screens/HomeTemplate/fitness_app/fitness_app_theme.dart';
// import 'package:nanen/src/features/core/screens/HomeTemplate/fitness_app/my_diary/my_diary_screen.dart';
// import 'package:nanen/src/utils/appbar/costume_app_bar.dart';
// import '../../../../constants/text_strings.dart';
// import "../../../../utils/button/button.dart";

// class MissionHomePage extends StatefulWidget {
//   // const MissionHomePage({Key? key}) : super(key: key);

//   const MissionHomePage({
//     required this.animationController,
//     Key? key, // 'Key?' 타입으로 변경
//   }) : super(key: key); // 'super.key' 추가

//   final AnimationController animationController;

//   @override
//   // ignore: library_private_types_in_public_api
//   _MissionHomePageState createState() => _MissionHomePageState();
// }

// class _MissionHomePageState extends State<MissionHomePage> {
//   List backgroundColor = [
//     tWhiteColor,
//     tPrimaryColor,
//     tSeconddaryColor,
//     tAccentColor
//   ];

//   List texts = [
//     tActiveText,
//     tCalmText,
//     tCreativeText,
//     tPeopleText,
//   ];

//   final CarouselController carouselController = CarouselController();
//   List<Widget> listViews = <Widget>[];
//   late final Animation<double> topBarAnimation;
//   double topBarOpacity = 0.0;
//   late final ScrollController scrollController;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: FitnessAppTheme.background,
//       child: Stack(
//         children: <Widget>[
//           // getAppBarUI(),
//           getAppBarUI(
//               widget: widget,
//               topBarAnimation: topBarAnimation,
//               topBarOpacity: topBarOpacity),
//           SizedBox(
//             height: MediaQuery.of(context).padding.bottom,
//           )
//         ],
//       ),
//     );
//     // return Scaffold(
//     //   appBar: const CostumedAppBar(bartitle: 'Mission'),
//     //   body: PageView.builder(
//     //       scrollDirection: Axis.horizontal,
//     //       itemCount: backgroundColor.length,
//     //       itemBuilder: (_, index) {
//     //         return Container(
//     //           width: double.maxFinite,
//     //           height: double.maxFinite,
//     //           decoration: BoxDecoration(
//     //             color: backgroundColor[index],
//     //           ),
//     //           child: Container(
//     //             margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
//     //             child: Column(
//     //               children: [
//     //                 Row(
//     //                   children: [
//     //                     Column(
//     //                       crossAxisAlignment: CrossAxisAlignment.start,
//     //                       children: [
//     //                         AppLargeText(text: texts[index]),
//     //                         const AppText(
//     //                           text: "화면 구성은 추후의",
//     //                           size: 30,
//     //                         ),
//     //                         const SizedBox(
//     //                           height: 10,
//     //                         ),
//     //                         const SizedBox(
//     //                           width: 250,
//     //                           child: AppText(
//     //                             text: "세부 디자인 과정을 통해 완성됩니다.",
//     //                             color: textColor2,
//     //                             size: 14,
//     //                           ),
//     //                         ),
//     //                         const SizedBox(
//     //                           height: 180,
//     //                         ),
//     //                       ],
//     //                     ),
//     //                   ],
//     //                 ),
//     //                 Row(
//     //                   mainAxisAlignment: MainAxisAlignment.center,
//     //                   children: List.generate(
//     //                     4,
//     //                     (indexDots) {
//     //                       return Container(
//     //                         margin: const EdgeInsets.only(right: 4),
//     //                         width: index == indexDots ? 25 : 8,
//     //                         height: 8,
//     //                         decoration: BoxDecoration(
//     //                           borderRadius: BorderRadius.circular(8),
//     //                           color: index == indexDots
//     //                               ? Colors.deepPurple
//     //                               : Colors.deepPurple.shade100,
//     //                         ),
//     //                       );
//     //                     },
//     //                   ),
//     //                 ),
//     //                 const SizedBox(
//     //                   height: 20,
//     //                 ),
//     //                 const ResponsiveButton(),
//     //               ],
//     //             ),
//     //           ),
//     //         );
//     //       }),
//     // );
//   }
// }

// class getAppBarUI extends StatelessWidget {
//   const getAppBarUI({
//     super.key,
//     required this.widget,
//     required this.topBarAnimation,
//     required this.topBarOpacity,
//   });

//   // final MyDiaryScreen widget;
//   final MissionHomePage widget;
//   final Animation<double> topBarAnimation;
//   final double topBarOpacity;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         AnimatedBuilder(
//           animation: widget.animationController,
//           builder: (BuildContext context, _) {
//             var now = DateTime.now();
//             var formatter = DateFormat('MMM d');
//             String formattedDate = formatter.format(now);

//             return FadeTransition(
//               opacity: topBarAnimation,
//               child: Transform(
//                 transform: Matrix4.translationValues(
//                     0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: FitnessAppTheme.white.withOpacity(topBarOpacity),
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(32.0),
//                     ),
//                     boxShadow: <BoxShadow>[
//                       BoxShadow(
//                           color: FitnessAppTheme.grey
//                               .withOpacity(0.4 * topBarOpacity),
//                           offset: const Offset(1.1, 1.1),
//                           blurRadius: 10.0),
//                     ],
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       SizedBox(
//                         height: MediaQuery.of(context).padding.top,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                             left: 16,
//                             right: 16,
//                             top: 16 - 8.0 * topBarOpacity,
//                             bottom: 12 - 8.0 * topBarOpacity),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   '나는_',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     fontFamily: FitnessAppTheme.fontName,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 22 + 6 - 6 * topBarOpacity,
//                                     letterSpacing: 1.2,
//                                     color: FitnessAppTheme.darkerText,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 38,
//                               width: 38,
//                               child: InkWell(
//                                 highlightColor: Colors.transparent,
//                                 borderRadius: const BorderRadius.all(
//                                     Radius.circular(32.0)),
//                                 onTap: () {},
//                                 child: const Center(
//                                   child: Icon(
//                                     Icons.keyboard_arrow_left,
//                                     color: FitnessAppTheme.grey,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 8,
//                                 right: 8,
//                               ),
//                               child: Row(
//                                 children: <Widget>[
//                                   const Padding(
//                                     padding: EdgeInsets.only(right: 8),
//                                     child: Icon(
//                                       Icons.calendar_today,
//                                       color: FitnessAppTheme.grey,
//                                       size: 18,
//                                     ),
//                                   ),
//                                   Text(
//                                     formattedDate,
//                                     textAlign: TextAlign.left,
//                                     style: const TextStyle(
//                                       fontFamily: FitnessAppTheme.fontName,
//                                       fontWeight: FontWeight.normal,
//                                       fontSize: 18,
//                                       letterSpacing: -0.2,
//                                       color: FitnessAppTheme.darkerText,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 38,
//                               width: 38,
//                               child: InkWell(
//                                 highlightColor: Colors.transparent,
//                                 borderRadius: const BorderRadius.all(
//                                     Radius.circular(32.0)),
//                                 onTap: () {},
//                                 child: const Center(
//                                   child: Icon(
//                                     Icons.keyboard_arrow_right,
//                                     color: FitnessAppTheme.grey,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         )
//       ],
//     );
//   }
// }
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nanen/src/features/core/screens/HomeTemplate/fitness_app/fitness_app_theme.dart';
import 'package:nanen/src/features/core/screens/HomeTemplate/fitness_app/ui_view/area_list_view.dart';
import 'package:nanen/src/features/core/screens/HomeTemplate/fitness_app/ui_view/mediterranesn_diet_view.dart';
import 'package:nanen/src/features/core/screens/HomeTemplate/fitness_app/ui_view/title_view.dart';
import 'package:nanen/src/features/core/screens/design_course/category_list_view.dart';
import 'package:nanen/src/features/core/screens/design_course/course_info_screen.dart';
import 'package:nanen/src/features/core/screens/design_course/design_course_app_theme.dart';

import 'package:intl/intl.dart';
import 'package:nanen/src/features/core/screens/HomeTemplate/fitness_app/my_diary/meals_list_view.dart';

class MissionHomePage extends StatefulWidget {
  const MissionHomePage({
    required this.animationController,
    Key? key, // 'Key?' 타입으로 변경
  }) : super(key: key); // 'super.key' 추가

  final AnimationController animationController;

  @override
  State<MissionHomePage> createState() => _MissionHomePageState();
}

class _MissionHomePageState extends State<MissionHomePage>
    with TickerProviderStateMixin {
  late final ScrollController scrollController;

  List<Widget> listViews = <Widget>[];
  late final Animation<double> topBarAnimation;
  double topBarOpacity = 0.0;

  late Category category;
  late AnimationController animationController;
  late Animation<double> animation;

  //dots_indicator
  final PageController pageController = PageController();
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController,
            curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          if (mounted) {
            setState(() {
              topBarOpacity = 1.0;
            });
          }
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          if (mounted) {
            setState(() {
              topBarOpacity = scrollController.offset / 24;
            });
          }
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          if (mounted) {
            setState(() {
              topBarOpacity = 0.0;
            });
          }
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void addAllListData() {
    const int count = 6;

    listViews.add(
      TitleView(
        titleTxt: 'My Diary',
        subTxt: 'more',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve: const Interval((1 / count) * 0, 1.0,
                curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      MediterranesnDietView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve: const Interval((1 / count) * 1, 1.0,
                curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: FitnessAppTheme.background,
      child: Stack(
        children: <Widget>[
          // getMainListViewUI(),
          getAppBarUI(
              widget: widget,
              topBarAnimation: topBarAnimation,
              topBarOpacity: topBarOpacity),
          PageView(
            controller: pageController,
            onPageChanged: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            children: <Widget>[
              Container(
                color: FitnessAppTheme.darkGrey,
                alignment: Alignment.center,
                child: const Text(
                  '첫 번째 아이템',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                color: FitnessAppTheme.darkGrey,
                alignment: Alignment.center,
                child: const Text(
                  '두 번째 아이템',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                color: FitnessAppTheme.darkGrey,
                alignment: Alignment.center,
                child: const Text(
                  '세 번째 아이템',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                color: FitnessAppTheme.darkGrey,
                alignment: Alignment.center,
                child: const Text(
                  '네 번째 아이템',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: DotsIndicator(
                  dotsCount: 4,
                  position: currentPageIndex.toDouble(),
                  decorator: const DotsDecorator(
                      activeColor: FitnessAppTheme.nearlyDarkBlue,
                      color: FitnessAppTheme.darkGrey)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const CourseInfoScreen(),
      ),
    );
  }
}

class getAppBarUI extends StatelessWidget {
  const getAppBarUI({
    super.key,
    required this.widget,
    required this.topBarAnimation,
    required this.topBarOpacity,
  });

  final MissionHomePage widget;
  final Animation<double> topBarAnimation;
  final double topBarOpacity;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('MMM d');
    String formattedDate = formatter.format(now);
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, _) {
            return FadeTransition(
              opacity: topBarAnimation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FitnessAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '미션',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: FitnessAppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0)),
                                onTap: () {},
                                child: const Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: FitnessAppTheme.grey,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                              ),
                              child: Row(
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: FitnessAppTheme.grey,
                                      size: 18,
                                    ),
                                  ),
                                  Text(
                                    formattedDate,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      letterSpacing: -0.2,
                                      color: FitnessAppTheme.darkerText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0)),
                                onTap: () {},
                                child: const Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: FitnessAppTheme.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
