import 'package:flutter/material.dart';
import 'package:nanen/src/constants/colors.dart';
import 'package:nanen/src/features/user/mypage/top/mypageTop.dart';
import 'package:nanen/src/features/user/mypage/widget/editProfileBtn.dart';
import 'package:nanen/src/utils/appbar/costume_app_bar.dart';
import 'package:nanen/src/utils/chart/graph/myBarGraph.dart';

import 'tabs/widget/tabCategory.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  //graph

  //tabs
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const CostumedAppBar(bartitle: 'MyPage'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              //profile details
              const Column(
                children: [
                  mypageTop(),
                ],
              ),
              const EditProfileBtn(),
              const SizedBox(
                height: 10,
              ),
              //tab bar
              TabBar(
                unselectedLabelColor: tPrimaryColor,
                indicatorColor: tSeconddaryColor,
                indicatorWeight: 2,
                tabs: tabs,
              ),

              //graph
              const SizedBox(height: 200, child: MyBarGraph()),
              const SizedBox(
                height: 20,
              ),

              //tab bar view
              SizedBox(height: 1000, child: TabBarView(children: tabBarViews)),
            ],
          ),
        ),
      ),
    );
  }
}
