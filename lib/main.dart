import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); // the underscore means the class in a private, it can'y be used in other files
  }
}

class _MyAppState extends State<MyApp> {
  static const questions = [
    {
      'question': 'What is your favorite color?',
      'answer': [
        {'text': 'redd', 'score': 5},
        {'text': 'blue', 'score': 3},
        {'text': 'gray', 'score': 8}
      ]
    },
    {
      'question': 'What is your favorite animal?',
      'answer': [
        {'text': 'rabbit', 'score': 2},
        {'text': 'dog', 'score': 9},
        {'text': 'fish', 'score': 5}
      ]
    },
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    print(_totalScore);
    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override //decorader
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(score: _totalScore, onReset: _resetQuiz),
      ),
    );
  }
}
