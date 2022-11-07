import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(
        questionText: questions[questionIndex]['question'],
      ),
      ...(questions[questionIndex]['answer'] as List<Map<String, Object>>).map(
        ((answer) {
          return Answer(
            answerName: answer['text'],
            onPressed: () => answerQuestion(answer['score']),
          );
        }),
      ).toList()
    ]);
  }
}
