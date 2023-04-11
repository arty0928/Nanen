import 'package:flutter/material.dart';

class MissionDetail extends StatelessWidget {
  const MissionDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text('$index 만큼 산책하기'),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        );
      },
    );
  }
}
