import 'package:flutter/material.dart';
import 'package:nanen/src/constants/colors.dart';
import 'package:nanen/src/constants/image_strings.dart';
import 'package:nanen/src/features/core/screens/survey/survey.dart';
import 'package:nanen/src/utils/appbar/costume_app_bar.dart';
import 'package:nanen/src/utils/chart/graph/myBarGraph.dart';

import 'widgets/graph/doctor_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var timezone = DateTime.now().timeZoneName;
    var day = DateTime.now().day;

    return Scaffold(
      appBar: const CostumedAppBar(bartitle: '나는'),
      backgroundColor: Colors.deepPurple[100],
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SurveyPage()));
        },
        child: const Icon(Icons.question_mark_outlined), //icon inside button
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
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
                    color: tSeconddaryColor,
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
                    color: tSeconddaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        timezone,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        day.toString(),
                        style: const TextStyle(
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
                          'HomeText',
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
                  color: tSeconddaryColor,
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
                        color: tPrimaryColor,
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

            const SizedBox(
              height: 20,
            ),

            //Graph
            const SizedBox(height: 200, child: MyBarGraph()),

            const SizedBox(
              height: 20,
            ),

            // //Youtuber
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Youtuber~~',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  DoctorCard(
                    doctorImagePath: tEmindyogaImage,
                    rating: '4.8',
                    doctorName: 'tEmindYoga~',
                    doctorProfession: 'Yoga',
                  ),
                  DoctorCard(
                    doctorImagePath: tYangbroImage,
                    rating: '',
                    doctorName: 'tYangbro~',
                    doctorProfession: 'Doctor',
                  ),
                  DoctorCard(
                    doctorImagePath: tBrainrichImage,
                    rating: '4.9',
                    doctorName: 'tBrainrich~',
                    doctorProfession: 'Doctor',
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
