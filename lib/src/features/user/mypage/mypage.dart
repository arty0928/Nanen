import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nanen/src/constants/colors.dart';

import '../../core/screens/profile/widget/avatar_widget.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  Widget _information() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              AvatarWidget(
                type: AvatarType.TYPE3,
                thumbPath: 'https://picsum.photos/250?image=9',
                size: 80,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        _userInformation("Eunseopark", 15),
                        _userInformation("rer", 15),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _userInformation(String title, int value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 15, color: tDarkColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _EditButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 19),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: tPrimaryColor),
              ),
              child: const Text(
                'Edit Profile',
                style: TextStyle(
                    color: tDarkColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabMission() {
    return TabBar(
        controller: tabController,
        indicatorColor: tSeconddaryColor,
        indicatorWeight: 1.5,
        tabs: [
          Container(
              child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LineAwesomeIcons.cog,
                color: tPrimaryColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'active',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: tDarkColor),
              ),
            ],
          )),
          Container(
              child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LineAwesomeIcons.cog,
                color: tPrimaryColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'calm',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: tDarkColor),
              ),
            ],
          )),
          Container(
              child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LineAwesomeIcons.cog,
                color: tPrimaryColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'creative',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: tDarkColor),
              ),
            ],
          )),
          Container(
              child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LineAwesomeIcons.cog,
                color: tPrimaryColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'people',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: tDarkColor),
              ),
            ],
          )),
        ]);
  }

  Widget _missionChart() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Column(
        children: [
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Text(
          //       'calm',
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 13,
          //           color: tDarkColor),
          //     ),
          //     Text(
          //       'active',
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 13,
          //           color: tDarkColor),
          //     ),
          //     Text(
          //       'people',
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 13,
          //           color: tDarkColor),
          //     ),
          //     Text(
          //       'creative',
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 13,
          //           color: tDarkColor),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 10),
          Container(
            width: 410,
            height: 200,
            color: tPrimaryColor,
          ),
        ],
      ),
    );
  }

  Widget _tabView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          itemBuilder: (BuildContext context, index) {
            return Container(color: tAccentColor);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tWhiteColor,
        appBar: const CostumedAppBar(
          bartitle: 'MyPage',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              _information(),
              _EditButton(),
              _tabMission(),
              _missionChart(),
              SizedBox(
                height: 15,
              ),
              _tabView(),
            ],
          ),
        ));
  }
}

class CostumedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String bartitle;

  const CostumedAppBar({
    super.key,
    required this.bartitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: tSeconddaryColor,
      elevation: 0,
      title: Text(
        bartitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: tWhiteColor,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              LineAwesomeIcons.cog,
              size: 25.0,
              color: tWhiteColor,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
