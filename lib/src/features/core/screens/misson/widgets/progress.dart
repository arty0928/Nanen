import 'package:flutter/material.dart';
import 'package:nanen/src/features/core/screens/misson/widgets/mission_list.dart';
import 'package:nanen/src/utils/appbar/costume_app_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({
    super.key,
  });

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  List category = [
    'Active',
    'Creative',
    'Calm',
    'People',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CostumedAppBar(bartitle: 'Mission'),
      body: Column(
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
              percent: 0.6,
              progressColor: Colors.deepPurple.shade200,
              backgroundColor: Colors.grey.shade300,
              barRadius: const Radius.circular(15),
            ),
          ),
          const Column(children: [MissionList()])
        ],
      ),
    );
  }
}
