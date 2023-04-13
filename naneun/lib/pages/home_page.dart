import 'package:flutter/material.dart';
import 'package:naneun/graph/linechart.dart';
import 'package:naneun/graph/pricePoints.dart';
import 'package:naneun/util/doctor_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        // top: false,
        // bottom: false,
        // right: false,
        // left: false,
        // maintainBottomViewPadding: false,
        child: Column(
          children: [
            //app bar
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'AIÎ•? ?ôú?ö©?ïú ÎßàÏùåÍ±¥Í∞ï Í∏∞Î°ù ?ï± ?ÑúÎπÑÏä§',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Nanuen',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                            ],
                          ),

                          //setting
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.settings),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //card -> how do you feel?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 130,
                  width: 150,
                  padding: const EdgeInsets.fromLTRB(35, 10, 10, 10),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'AI Model',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Container(
                  height: 130,
                  width: 150,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'THURSDAY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        '28',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[400],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                            child: Text(
                          '?ò§?äò?ùò ÎØ∏ÏÖò',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            //search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: 'How can we help you?',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('lib/images/active.png'),
                        ),
                        color: Colors.deepPurple[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [],
                      ),
                    ),
                    const Text('Active'),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('lib/images/creative.png'),
                        ),
                        color: Colors.deepPurple[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [],
                      ),
                    ),
                    const Text('Creative'),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('lib/images/people.png'),
                        ),
                        color: Colors.deepPurple[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [],
                      ),
                    ),
                    const Text('People'),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('lib/images/calm.png'),
                        ),
                        color: Colors.deepPurple[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [],
                      ),
                    ),
                    const Text('Calm'),
                  ],
                ),
              ],
            ),

            //Graph
            // Container(
            //   child: LineChartWidget(pricePoints),
            // ),
            const SizedBox(
              height: 20,
            ),

            Container(
              child: LineChartWidget(pricePoints),
            ),

            const SizedBox(
              height: 20,
            ),

            //Youtuber
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Î™ÖÏÉÅ ?Å¨Î¶¨Ïóê?ù¥?Ñ∞',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                DoctorCard(
                  doctorImagePath: 'lib/images/emindyoga.jpg',
                  rating: '4.8',
                  doctorName: '?óê?ùºÎ¶? mind yoga',
                  doctorProfession: 'Yoga',
                ),
                DoctorCard(
                  doctorImagePath: 'lib/images/yangbro.jpg',
                  rating: '',
                  doctorName: '?ñëÎ∏åÎ°ú?ùò ?†ï?ã†?Ñ∏Í≥?',
                  doctorProfession: 'Doctor',
                ),
                DoctorCard(
                  doctorImagePath: 'lib/images/brainrich.jpg',
                  rating: '4.9',
                  doctorName: '?†ï?ã†Í≥ºÏùò?Ç¨ ?áåÎ∂??ûê?ì§',
                  doctorProfession: 'Doctor',
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
