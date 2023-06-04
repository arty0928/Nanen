import 'package:nanen/src/constants/data_string.dart';

class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final int answerIndex;
  final bool isChecked;

  Answer(this.answerText, this.answerIndex, this.isChecked);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
      surveyQuestion[0],
      List.generate(surveyMultiChoices[0].length,
          (index) => Answer(surveyMultiChoices[0][index], index, false))));

  list.add(Question(
      surveyQuestion[1],
      List.generate(surveyMultiChoices[1].length,
          (index) => Answer(surveyMultiChoices[1][index], index, false))));

  list.add(Question(
      surveyQuestion[2],
      List.generate(surveyMultiChoices[2].length,
          (index) => Answer(surveyMultiChoices[2][index], index, false))));

  list.add(Question(
      surveyQuestion[3],
      List.generate(surveyMultiChoices[3].length,
          (index) => Answer(surveyMultiChoices[3][index], index, false))));

  return list;
}
