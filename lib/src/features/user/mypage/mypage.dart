// import 'package:flutter/material.dart';
// import 'package:nanen/src/constants/colors.dart';
// import 'package:nanen/src/features/user/mypage/widget/accountTab.dart';
// import 'package:nanen/src/utils/appbar/costume_app_bar.dart';
// import 'package:nanen/src/utils/chart/graph/myBarGraph.dart';

// import 'widget/editProfileBtn.dart';

// class Mypage extends StatefulWidget {
//   const Mypage({super.key});

//   @override
//   State<Mypage> createState() => _MypageState();
// }

// class _MypageState extends State<Mypage> {
//   List<double> dataSummary = [40.40, 60.50, 80.42, 19.50];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CostumedAppBar(
//         bartitle: 'MyPage',
//       ),
//       body: DefaultTabController(
//         length: 4,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   //Profile
//                   Container(
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                         color: Colors.grey[300], shape: BoxShape.circle),
//                   ),

//                   //number
//                   const Expanded(
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 25, vertical: 10),
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Eunseopark',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 20),
//                             ),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Column(
//                               children: [
//                                 Text(
//                                   '237',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18),
//                                 ),
//                                 Text('active')
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   '237',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18),
//                                 ),
//                                 Text('calm')
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   '237',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18),
//                                 ),
//                                 Text('creative')
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   '237',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18),
//                                 ),
//                                 Text('people')
//                               ],
//                             ),

//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             const EditProfileBtn(),
//             const TabBar(
//               unselectedLabelColor: tPrimaryColor,
//               indicatorColor: tSeconddaryColor,
//               indicatorWeight: 2,
//               tabs: [
//                 Tab(
//                   icon: Icon(
//                     Icons.sports,
//                     color: tPrimaryColor,
//                   ),
//                 ),
//                 Tab(
//                   icon: Icon(
//                     Icons.face,
//                     color: tPrimaryColor,
//                   ),
//                 ),
//                 Tab(
//                   icon: Icon(
//                     Icons.movie_creation_rounded,
//                     color: tPrimaryColor,
//                   ),
//                 ),
//                 Tab(
//                   icon: Icon(
//                     Icons.people,
//                     color: tPrimaryColor,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//                 height: 200, child: MyBarGraph(weeklySummary: dataSummary)),
//             const SizedBox(
//               height: 20,
//             ),
//             const Expanded(
//               child: TabBarView(
//                 children: [
//                   AccountTab(tabColor: tAccentColor, itemCount: 10),
//                   AccountTab(tabColor: tPrimaryColor, itemCount: 5),
//                   AccountTab(tabColor: tDarkColor, itemCount: 4),
//                   AccountTab(tabColor: tAccentColor, itemCount: 8),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

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
  List<double> dataSummary = [40.40, 60.50, 80.42, 19.50];

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
              //graph
              SizedBox(
                  height: 200, child: MyBarGraph(weeklySummary: dataSummary)),
              const SizedBox(
                height: 20,
              ),

              //tab bar
              TabBar(
                unselectedLabelColor: tPrimaryColor,
                indicatorColor: tSeconddaryColor,
                indicatorWeight: 2,
                tabs: tabs,
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
