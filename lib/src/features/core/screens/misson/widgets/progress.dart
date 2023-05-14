import 'package:flutter/material.dart';
import 'package:nanen/src/utils/nav_foot_bar/nav_foot_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'mission_list.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  int selectedIndex = 0;

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: NavFootBar(selectedIndex: 1, onClicked: onClicked),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                      iconSize: 30,
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings),
                      iconSize: 35,
                    )
                  ],
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
          Container(
            child: const Column(children: [
              MissionList(),
              // MissionDetail(),
            ]),
          )
        ],
      ),
    );
  }
}
