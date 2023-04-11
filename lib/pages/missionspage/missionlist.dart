import 'package:flutter/material.dart';

class MissionList extends StatelessWidget {
  const MissionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i < 4; i++)
          Container(
            height: 100,
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(children: [
                  Text(
                    // index에 맞게 변경
                    '20분 산책하기',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ]),
              )
            ]),
          )
      ],
    );
  }
}
