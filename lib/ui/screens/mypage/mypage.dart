import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wonders/styles/colors.dart';
import 'package:wonders/ui/screens/mission/widget/home_template.dart';
import 'package:wonders/ui/screens/mission/widget/home_template_widget/diet_view.dart';
import 'package:wonders/ui/screens/mission/widget/home_template_widget/title_view.dart';
import 'package:wonders/ui/screens/mypage/top/mypage_top.dart';
import 'package:wonders/ui/screens/mypage/update_profile_screen.dart';
import 'package:wonders/ui/screens/mypage/widget/edit_profile_btn.dart';
import 'package:wonders/ui/screens/mypage/widget/tab_category.dart';
import 'package:wonders/utils/appbar/costume_app_bar.dart';
import 'package:wonders/utils/graph/graph.dart';
import 'package:flutter/foundation.dart';
import 'package:wonders/common_libs.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({
    required this.animationController,
    Key? key,
  }) : super(key: key);

  final AnimationController animationController;

  @override
  State<MyPageScreen> createState() => _MyPageState();
}

class _MyPageState extends State<MyPageScreen> with TickerProviderStateMixin {
  late final ScrollController scrollController;
  List<Widget> listViews = <Widget>[];
  late final Animation<double> topBarAnimation;
  double topBarOpacity = 0.0;

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
      MyPageBody(
        animationController: widget.animationController,
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve: const Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
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
}

// Widget body() {
//     return DefaultTabController(
//       length: 4,
//       child: Material(
//         color: NanenAppTheme.background,
//         child: Stack(
//           children: [
//             SizedBox(
//               height: 200,
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: ListView(
//                 children: const [
//                   Column(
//                     children: [
//                       mypageTop(),
//                     ],
//                   ),
//                   EditBtn(
//                     btnTitle: 'Edit Profile',
//                     backgroundStartColor: Color(0xFF738AE6),
//                     backgroundEndColor: Color(0xFF5C5EDD),
//                     path: UpdateProfileScreen(),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

class MyPageBody extends StatefulWidget {
  const MyPageBody({super.key, required this.animationController, required this.animation});

  final AnimationController animationController;
  final Animation<double> animation;

  @override
  State<MyPageBody> createState() => _MyPageBodyState();
}

class _MyPageBodyState extends State<MyPageBody> with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  //tabs
  final List<Widget> tabs = const [
    Tab(
      icon: Icon(
        Icons.sports,
        color: tActiveColor,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.video_camera_back_outlined,
        color: tCalmColor,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.home,
        color: tCreativeColor,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.bookmark,
        color: tPeopleColor,
      ),
    ),
  ];

  // tab bar views
  final List<Widget> tabBarViews = const [
    TabCategory(
      tabCategory: 'active',
    ),
    TabCategory(
      tabCategory: 'calm',
    ),
    TabCategory(
      tabCategory: 'active',
    ),
    TabCategory(
      tabCategory: 'calm',
    ),
  ];

  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: SingleChildScrollView(
        controller: scrollController,
        child: AnimatedBuilder(
            animation: widget.animationController,
            builder: (BuildContext context, _) {
              return FadeTransition(
                opacity: widget.animation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      mypageTop(),
                      EditBtn(
                        btnTitle: 'Edit Profile',
                        backgroundStartColor: Color(0xFF738AE6),
                        backgroundEndColor: Color(0xFF5C5EDD),
                        path: UpdateProfileScreen(),
                        newwidth: 400,
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TabBar(
                        unselectedLabelColor: tPrimaryColor,
                        indicatorColor: tSeconddaryColor,
                        indicatorWeight: 2,
                        tabs: tabs,
                        onTap: (index) {
                          setState(() {
                            selectedTabIndex = index;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - kToolbarHeight - 200 - 20,
                        child: tabBarViews[selectedTabIndex],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class getAppBarUI extends StatefulWidget {
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
  State<getAppBarUI> createState() => _getAppBarUIState();
}

class _getAppBarUIState extends State<getAppBarUI> {
  late DateTime currentDate;
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
    formattedDate = DateFormat('MMM d').format(currentDate);
  }

  void updateFormattedDate() {
    setState(() {
      formattedDate = DateFormat('MMM d').format(currentDate);
      print(formattedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.widget.animationController,
          builder: (BuildContext context, _) {
            return FadeTransition(
              opacity: widget.topBarAnimation,
              child: Transform(
                transform: Matrix4.translationValues(0.0, 30 * (1.0 - widget.topBarAnimation.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: NanenAppTheme.white.withOpacity(widget.topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: NanenAppTheme.grey.withOpacity(0.4 * widget.topBarOpacity),
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
                            top: 16 - 8.0 * widget.topBarOpacity,
                            bottom: 12 - 8.0 * widget.topBarOpacity),
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
                                    // fontFamily: NanenAppTheme.fontName,
                                    fontFamily: 'writerFont',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * widget.topBarOpacity,
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
                                onTap: () {
                                  setState(() {
                                    currentDate = currentDate.subtract(Duration(days: 1));
                                    updateFormattedDate();
                                    print(formattedDate);
                                  });
                                },
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
                                onTap: () {
                                  setState(() {
                                    currentDate = currentDate.add(Duration(days: 1));
                                    updateFormattedDate();
                                  });
                                },
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
