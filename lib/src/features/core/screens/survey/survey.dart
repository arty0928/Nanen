import 'package:flutter/material.dart';
import 'package:nanen/src/constants/colors.dart';
import 'package:nanen/src/constants/data_string.dart';
import 'package:nanen/src/utils/appbar/costume_app_bar.dart';

import 'widget/survey2.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  List<bool> isButtonPressedList = [false, false];

  void buttonPressed(int index) {
    setState(() {
      isButtonPressedList[index] = !isButtonPressedList[index];
    });
  }

  Widget SurveyMultiButton(int currentIndex, int multichoiceIndex) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor:
            isButtonPressedList[multichoiceIndex] ? tPrimaryColor : tWhiteColor,
        minimumSize: const Size(250, 80),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      onPressed: () {
        buttonPressed(multichoiceIndex);
      },
      child: Text(
        surveyMultiChoices[currentIndex][multichoiceIndex],
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var currentIndex = 1;
    return Scaffold(
      appBar: const CostumedAppBar(bartitle: '나는'),
      body: Container(
        color: Colors.deepPurple.shade100,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                surveyQuestion[currentIndex],
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            SurveyMultiButton(currentIndex, 0),
            const SizedBox(
              height: 50,
            ),
            SurveyMultiButton(currentIndex, 1),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.deepPurple.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              onPressed: null,
              icon: const Icon(Icons.arrow_back_ios_rounded),
            ),
            Text(
              '$currentIndex/${surveyQuestion.length}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Survey2Page()),
                );
              },
              icon: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
