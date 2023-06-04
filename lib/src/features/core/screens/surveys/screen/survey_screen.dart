import 'package:flutter/material.dart';
import 'package:nanen/src/constants/colors.dart';
import 'package:nanen/src/constants/data_string.dart';
import 'package:nanen/src/features/core/screens/Home/home_page.dart';
import 'package:nanen/src/features/core/screens/surveys/model/survey_model.dart';
import 'package:nanen/src/utils/appbar/costume_app_bar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //define the datas
  List<Question> questionList = getQuestions();
  List<int> selectedAnswers = List<int>.filled(surveyQuestion.length, -1);
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: const CostumedAppBar(bartitle: '나는'),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _questionWidget(),
                const SizedBox(
                  height: 40,
                ),
                _answerList(),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _beforeButton(),
                      _nextButton(),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: tWhiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: tPrimaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: tWhiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

//각 버튼들에 초기화
  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

//answer 초기화
  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;
    int answerIndex =
        questionList[currentQuestionIndex].answersList.indexOf(answer);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? tDarkColor : tDarkColor,
          backgroundColor: isSelected ? tAccentColor : tWhiteColor,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            setState(() {
              selectedAnswer = answer;
              if (currentQuestionIndex < selectedAnswers.length) {
                selectedAnswers[currentQuestionIndex] = answerIndex;
              }
            });
          }
        },
        child: Text(answer.answerText),
      ),
    );
  }

  _beforeButton() {
    bool isFirstQuestion = true;
    if (currentQuestionIndex != 0) {
      isFirstQuestion = false;
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: tWhiteColor,
          backgroundColor: tSeconddaryColor,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          setState(() {
            if (!isFirstQuestion) currentQuestionIndex--;
            // selectedAnswers.add(selectedAnswer!.answerIndex);
          });
        },
        child: const Icon(
          Icons.arrow_left,
        ),
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: tWhiteColor,
          backgroundColor: tSeconddaryColor,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          if (selectedAnswer != null) {
            setState(() {
              if (!selectedAnswers.contains(selectedAnswer!.answerIndex)) {
                selectedAnswers.add(selectedAnswer!.answerIndex);
              }
              _showScoreDialog(selectedAnswer);

              if (isLastQuestion) {
                Navigator.pop(context);
                _showScoreDialog(selectedAnswer);
                print(selectedAnswers);
              } else {
                selectedAnswer = null;
                currentQuestionIndex++;
              }
            });
          }
        },
        child: Icon(
          isLastQuestion ? Icons.check_circle : Icons.arrow_right,
        ),
      ),
    );
  }

  _showScoreDialog(selectedAnswer) {
    print(selectedAnswer);
    print(selectedAnswers);
    print("~~~~~~~~~~~~~");
    // bool isPassed = false;

    // if (score >= questionList.length * 0.6) {
    //   //pass if 60 %
    //   isPassed = true;
    // }
    // String title = isPassed ? "Passed " : "Failed";

    //   return AlertDialog(
    //     title: Text(
    //       title + " | Score is $score",
    //       style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
    //     ),
    //     content: ElevatedButton(
    //       child: const Text("Restart"),
    //       onPressed: () {
    //         Navigator.pop(context);
    //         setState(() {
    //           currentQuestionIndex = 0;
    //           score = 0;
    //           selectedAnswer = null;
    //         });
    //       },
    //     ),
    //   );
    // }
  }
}
