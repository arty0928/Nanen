import 'package:flutter/material.dart';
import 'package:nanen/src/constants/colors.dart';
import 'package:nanen/src/features/core/screens/misson/widgets/mission_image.dart';
import 'package:nanen/src/utils/appbar/costume_app_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MissionDetail extends StatelessWidget {
  final int idx;

  MissionDetail(this.idx, {Key? key}) : super(key: key);

  List missionCategory = [
    'Active',
    'Calm',
    'Creative',
    'People',
  ];

  List missiontexts = [
    '30분 산책하기',
    '마트가서 장보기',
    '달 사진 찍어보기',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CostumedAppBar(bartitle: 'Mission'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade200,
                  ),
                ),
                Positioned(
                  left: 120,
                  top: 50,
                  child: Container(
                    width: 180,
                    height: 200,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ),
                const Positioned(
                    left: 160,
                    top: 90,
                    child: Text(
                      // text 변경 필요
                      'Active',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: LinearPercentIndicator(
                lineHeight: 35,
                // percent 는 실제 데이터에 따라 수정이 필요하다.
                percent: 0.6,
                progressColor: Colors.deepPurple.shade200,
                backgroundColor: Colors.grey.shade300,
                barRadius: const Radius.circular(15),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 90,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                    Container(
                      height: 70,
                      width: 70,
                      margin: const EdgeInsets.only(right: 15),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(children: [
                        Text(
                          missiontexts[idx - 1],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ]),
                    )
                  ]),
                ),
                Container(
                  height: 320,
                  width: 400,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '기록 방식',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          '산책을 하고 난 후 풍경 사진을 한 장 찍어보세요!',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          '기록 하기',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const MissionImage(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              // context,
                              // MaterialPageRoute(
                              //     builder: (context) => const UpdateProfileScreen()
                              //     ),
                              // );
                            },
                            child: Row(children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: tWhiteColor,
                                    border: Border.all(color: tPrimaryColor),
                                  ),
                                  child: const Text(
                                    'AI 대화하기',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => const UpdateProfileScreen()),
//           );
//         },
//         child: Row(
//           children: [
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(vertical: 5),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(3),
//                   border: Border.all(color: tPrimaryColor),
//                 ),
//                 child: const Text(
//                   'Edit Profile',
//                   style: TextStyle(
//                     color: tDarkColor,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
  