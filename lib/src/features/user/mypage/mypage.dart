import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nanen/src/constants/colors.dart';

import '../../core/screens/profile/widget/avatar_widget.dart';

// class MyPage extends StatefulWidget {
//   const MyPage({super.key});

//   @override
//   State<MyPage> createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> with TickerProviderStateMixin {
//   late TabController tabController;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     tabController = TabController(length: 4, vsync: this);
//   }

//   Widget _tabMission() {
//     return TabBar(
//         controller: tabController,
//         indicatorColor: tSeconddaryColor,
//         indicatorWeight: 1.5,
//         tabs: const [
//           Tab(
//             icon: Icon(
//               Icons.grid_3x3_outlined,
//               color: tPrimaryColor,
//             ),
//           ),
//           Tab(
//             icon: Icon(
//               Icons.person_2_outlined,
//               color: tPrimaryColor,
//             ),
//           ),
//           Tab(
//             icon: Icon(
//               Icons.grid_3x3_outlined,
//               color: tPrimaryColor,
//             ),
//           ),
//           Tab(
//             icon: Icon(
//               Icons.grid_3x3_outlined,
//               color: tPrimaryColor,
//             ),
//           )
//         ]);
//   }

//   Widget _tabView(viewColor, itemCount) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 18),
//       child: GridView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: itemCount,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             childAspectRatio: 1,
//             mainAxisSpacing: 1,
//             crossAxisSpacing: 1,
//           ),
//           itemBuilder: (BuildContext context, index) {
//             return Container(color: viewColor);
//           }),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: tWhiteColor,
//         appBar: const CostumedAppBar(
//           bartitle: 'MyPage',
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(10),
//               ),
//               _information(),
//               _EditButton(),
//               // _tabMission(),
//               _missionChart(),
//               const SizedBox(
//                 height: 15,
//               ),
//               // _tabView(),

//               TabBar(
//                   controller: tabController,
//                   indicatorColor: tSeconddaryColor,
//                   indicatorWeight: 1.5,
//                   tabs: const [
//                     Tab(
//                       icon: Icon(
//                         Icons.grid_3x3_outlined,
//                         color: tPrimaryColor,
//                       ),
//                     ),
//                     Tab(
//                       icon: Icon(
//                         Icons.person_2_outlined,
//                         color: tPrimaryColor,
//                       ),
//                     ),
//                     Tab(
//                       icon: Icon(
//                         Icons.grid_3x3_outlined,
//                         color: tPrimaryColor,
//                       ),
//                     ),
//                     Tab(
//                       icon: Icon(
//                         Icons.grid_3x3_outlined,
//                         color: tPrimaryColor,
//                       ),
//                     )
//                   ]),
//               TabBarView(
//                 children: [
//                   _tabView(tPrimaryColor, 10),
//                   _tabView(tPrimaryColor, 10),
//                   _tabView(tPrimaryColor, 10),
//                   _tabView(tPrimaryColor, 10)
//                 ],
//               )
//             ],
//           ),
//         ));
//   }
// }

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
