import 'package:flutter/material.dart';
import 'package:nanen/src/features/core/screens/misson/widgets/misson_detail.dart';

class MissionList extends StatefulWidget {
  const MissionList({super.key});

  @override
  State<MissionList> createState() => _MissionListState();
}

class _MissionListState extends State<MissionList> {
  List activemissiontexts = [
    '30분 산책하기',
    '마트가서 장보기',
    '달 사진 찍어보기',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i < activemissiontexts.length + 1; i++)
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MissionDetail(i)));
            },
            child: Container(
              height: 90,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                Radio(
                  value: "",
                  groupValue: "",
                  activeColor: Colors.deepPurple.shade100,
                  onChanged: (index) {},
                ),
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
                      // mission index에 맞게 변경
                      activemissiontexts[i - 1],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ]),
                )
              ]),
            ),
          )
      ],
    );
  }
}
