import 'package:flutter/material.dart';
import 'package:nanen/src/constants/image_strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: const navFootBar(),
      backgroundColor: Colors.deepPurple[100],
      body: Column(
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
                              'AI瑜? ?솢?슜?븳 留덉쓬嫄닿컯 湲곕줉 ?빋 ?꽌鍮꾩뒪',
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
            height: 5,
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
                        '?삤?뒛?쓽 誘몄뀡',
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
                        image: AssetImage(tActiveImage),
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
                        image: AssetImage(tCreativeImage),
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
                        image: AssetImage(tPeopleImage),
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
                        image: AssetImage(tCalmImage),
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
          // const SizedBox(
          //   height: 20,
          // ),

          // Container(
          //   child: LineChartWidget(pricePoints),
          // ),

          // const SizedBox(
          //   height: 20,
          // ),

          //Youtuber
          //   const Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 20),
          //     child: Text(
          //       '紐낆긽 ?겕由ъ뿉?씠?꽣',
          //       textAlign: TextAlign.left,
          //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //     ),
          //   ),
          //   const SizedBox(
          //     height: 20,
          //   ),
          //   Expanded(
          //       child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: const [
          //       DoctorCard(
          //         doctorImagePath: 'lib/images/emindyoga.jpg',
          //         rating: '4.8',
          //         doctorName: '?뿉?씪由? mind yoga',
          //         doctorProfession: 'Yoga',
          //       ),
          //       DoctorCard(
          //         doctorImagePath: 'lib/images/yangbro.jpg',
          //         rating: '',
          //         doctorName: '?뼇釉뚮줈?쓽 ?젙?떊?꽭怨?',
          //         doctorProfession: 'Doctor',
          //       ),
          //       DoctorCard(
          //         doctorImagePath: 'lib/images/brainrich.jpg',
          //         rating: '4.9',
          //         doctorName: '?젙?떊怨쇱쓽?궗 ?뇤遺??옄?뱾',
          //         doctorProfession: 'Doctor',
          //       ),
          //     ],
          //   ))
        ],
      ),
    );
  }
}
