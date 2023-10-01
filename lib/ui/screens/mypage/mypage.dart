import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wonders/styles/colors.dart';
import 'package:wonders/ui/screens/mission/widget/home_template.dart';
import 'package:wonders/ui/screens/mypage/top/mypage_top.dart';
import 'package:wonders/ui/screens/mypage/update_profile_screen.dart';
import 'package:wonders/ui/screens/mypage/widget/edit_profile_btn.dart';
import 'package:wonders/ui/screens/mypage/widget/tab_category.dart';
import 'package:wonders/utils/appbar/costume_app_bar.dart';
import 'package:wonders/utils/graph/graph.dart';
import 'package:flutter/foundation.dart';
import 'package:wonders/common_libs.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageState();
}

class _MyPageState extends State<MyPageScreen> {
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
      length: 4,
      child: Scaffold(
        // appBar: const CostumedAppBar(bartitle: 'MyPage'),
        body: Material(
          color: NanenAppTheme.background,
          child: Stack(
            children: [
              // getAppBarUI(),
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    //profile details
                    const Column(
                      children: [
                        mypageTop(),
                      ],
                    ),
                    // const EditProfileBtn(),
                    EditBtn(
                      btnTitle: 'Edit Profile',
                      // Color(0xFF738AE6),
                      // Color(0xFF5C5EDD),
                      backgroundStartColor: Color(0xFF738AE6),
                      backgroundEndColor: Color(0xFF5C5EDD), path: UpdateProfileScreen(),
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
                    //graph
                    // const SizedBox(height: 200, child: MyBarGraph()),
                    // const SizedBox(
                    //   height: 20,
                    // ),

                    ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height - kToolbarHeight - 200 - 20,
                            child: tabBarViews[selectedTabIndex],
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
