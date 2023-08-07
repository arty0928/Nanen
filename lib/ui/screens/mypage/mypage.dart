// import 'package:flutter/material.dart';
// import 'package:wonders/styles/colors.dart';
// import 'package:wonders/ui/screens/mypage/top/mypage_top.dart';
// import 'package:wonders/ui/screens/mypage/widget/edit_profile_btn.dart';
// import 'package:wonders/ui/screens/mypage/widget/tab_category.dart';
// import 'package:wonders/utils/appbar/costume_app_bar.dart';
// import 'package:wonders/utils/graph/graph.dart';

// class MyPageScreen extends StatefulWidget {
//   const MyPageScreen({super.key});

//   @override
//   State<MyPageScreen> createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPageScreen> {
//   //graph

//   //tabs
//   final List<Widget> tabs = const [
//     Tab(
//       icon: Icon(
//         Icons.sports,
//         color: tDarkColor,
//       ),
//     ),
//     Tab(
//       icon: Icon(
//         Icons.video_camera_back_outlined,
//         color: tDarkColor,
//       ),
//     ),
//     Tab(
//       icon: Icon(
//         Icons.home,
//         color: tDarkColor,
//       ),
//     ),
//     Tab(
//       icon: Icon(
//         Icons.bookmark,
//         color: tDarkColor,
//       ),
//     ),
//   ];

//   // tab bar views
//   final List<Widget> tabBarViews = const [
//     //feed view
//     TabCategory(
//       tabCategory: 'calm',
//     ),
//     //reels view
//     TabCategory(
//       tabCategory: 'active',
//     ),
//     //tagged view
//     TabCategory(
//       tabCategory: 'calm',
//     ),
//     TabCategory(
//       tabCategory: 'active',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: const CostumedAppBar(bartitle: 'MyPage'),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView(
//             children: [
//               //profile details
//               const Column(
//                 children: [
//                   mypageTop(),
//                 ],
//               ),
//               const EditProfileBtn(),
//               const SizedBox(
//                 height: 10,
//               ),
//               //tab bar
//               TabBar(
//                 unselectedLabelColor: tPrimaryColor,
//                 indicatorColor: tSeconddaryColor,
//                 indicatorWeight: 2,
//                 tabs: tabs,
//               ),

//               //graph
//               const SizedBox(height: 200, child: MyBarGraph()),
//               const SizedBox(
//                 height: 20,
//               ),

//               //tab bar view
//               SizedBox(height: 1000, child: TabBarView(children: tabBarViews)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:wonders/common_libs.dart';

import 'package:intl/intl.dart';
import 'package:wonders/ui/screens/mission/widget/home_template_widget/area_list_view.dart';
import 'package:wonders/ui/screens/mission/widget/home_template_widget/diet_view.dart';
import 'package:wonders/ui/screens/mission/widget/home_template_widget/meals_list_view.dart';
import 'package:wonders/ui/screens/mission/widget/home_template_widget/mission_detail_screen.dart';
import 'package:wonders/ui/screens/mission/widget/home_template_widget/title_view.dart';
import 'package:wonders/ui/screens/mypage/top/mypage_top.dart';
import 'package:wonders/ui/screens/mypage/widget/edit_profile_btn.dart';
import 'package:wonders/ui/screens/mypage/widget/tab_category.dart';
import 'package:wonders/utils/graph/graph.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({
    required this.animationController,
    Key? key, // 'Key?' 타입으로 변경
  }) : super(key: key); // 'super.key' 추가

  final AnimationController animationController;

  @override
  State<MyPageScreen> createState() => _MyDiaryScreenState();
}

class _MyDiaryScreenState extends State<MyPageScreen> with TickerProviderStateMixin {
  // tabs
  final List<Widget> tabs = const [
    Tab(
      icon: Icon(
        Icons.sports,
        color: tDarkColor,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.video_camera_back_outlined,
        color: tDarkColor,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.home,
        color: tDarkColor,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.bookmark,
        color: tDarkColor,
      ),
    ),
  ];

  // tab bar views
  final List<Widget> tabBarViews = const [
    //feed view
    TabCategory(
      tabCategory: 'calm',
    ),
    //reels view
    TabCategory(
      tabCategory: 'active',
    ),
    //tagged view
    TabCategory(
      tabCategory: 'calm',
    ),
    TabCategory(
      tabCategory: 'active',
    ),
  ];

  late final ScrollController scrollController;

  List<Widget> listViews = <Widget>[];
  late final Animation<double> topBarAnimation;
  double topBarOpacity = 0.0;

  late Category category;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: widget.animationController, curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
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
      } else if (scrollController.offset <= 24 && scrollController.offset >= 0) {
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
      const Column(
        children: [
          mypageTop(),
        ],
      ),
    );
    listViews.add(
      EditProfileBtn(),
    );

    listViews.add(
      const SizedBox(
        height: 10,
      ),
    );
    listViews.add(
      //tab bar
      TabBar(
        unselectedLabelColor: tPrimaryColor,
        indicatorColor: tSeconddaryColor,
        indicatorWeight: 2,
        tabs: tabs,
      ),
    );
    listViews.add(
      //graph
      const SizedBox(height: 200, child: MyBarGraph()),
    );
    listViews.add(
      const SizedBox(
        height: 20,
      ),
    );
    listViews.add(
      //tab bar view
      SizedBox(height: 1000, child: TabBarView(children: tabBarViews)),
    );

    listViews.add(
      MealsListView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve: const Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
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
      color: NanenAppTheme.background,
      child: Stack(
        children: <Widget>[
          getMainListViewUI(),
          getAppBarUI(widget: widget, topBarAnimation: topBarAnimation, topBarOpacity: topBarOpacity),
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
              top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 24,
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

  final MyPageScreen widget;
  final Animation<double> topBarAnimation;
  final double topBarOpacity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, _) {
            var now = DateTime.now();
            var formatter = DateFormat('MMM d');
            String formattedDate = formatter.format(now);

            return FadeTransition(
              opacity: topBarAnimation,
              child: Transform(
                transform: Matrix4.translationValues(0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: NanenAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: NanenAppTheme.grey.withOpacity(0.4 * topBarOpacity),
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
                            left: 16, right: 16, top: 16 - 8.0 * topBarOpacity, bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '나는_',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: NanenAppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: NanenAppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                                onTap: () {},
                                child: const Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: NanenAppTheme.grey,
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
                                      color: NanenAppTheme.grey,
                                      size: 18,
                                    ),
                                  ),
                                  Text(
                                    formattedDate,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontFamily: NanenAppTheme.fontName,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      letterSpacing: -0.2,
                                      color: NanenAppTheme.darkerText,
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
                                borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                                onTap: () {},
                                child: const Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: NanenAppTheme.grey,
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
