import 'package:flutter/material.dart';
import 'package:nanen/src/constants/colors.dart';
import 'package:nanen/src/features/user/mypage/widget/accountTab.dart';

import '../../../../constants/colors.dart';
import '../mypage.dart';
import 'editprofilebtn.dart';
import 'mypageChart.dart';

class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const CostumedAppBar(
          bartitle: 'MyPage',
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Profile
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey[300], shape: BoxShape.circle),
                  ),

                  //number
                  const Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Eunseopark',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '237',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text('active')
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '237',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text('calm')
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '237',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text('creative')
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '237',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text('people')
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 3,
            ),
            const EditProfileBtn(),
            const TabBar(
              indicatorColor: tSeconddaryColor,
              indicatorWeight: 2,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.sports,
                    color: tPrimaryColor,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.face,
                    color: tPrimaryColor,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.movie_creation_rounded,
                    color: tPrimaryColor,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.people,
                    color: tPrimaryColor,
                  ),
                ),
              ],
            ),
            const MyPageChart(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AccountTab(tabColor: tAccentColor, itemCount: 10),
                  AccountTab(tabColor: tPrimaryColor, itemCount: 5),
                  AccountTab(tabColor: tDarkColor, itemCount: 4),
                  AccountTab(tabColor: tAccentColor, itemCount: 8),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
