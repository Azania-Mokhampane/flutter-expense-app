import 'package:flutter/material.dart';

import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); // the underscore means the class in a private, it can'y be used in other files
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  void _answerQuestion() => setState(
        () => _questionIndex += 1,
      );

  @override //decorader
  Widget build(BuildContext context) {
    var questions = <String>[
      'Are you a developer?',
      'What is your experience level?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: Column(children: [
          Question(
            questionText: questions[_questionIndex],
          ),
          ElevatedButton(
            child: Text("Question 1"),
            onPressed: () {
              setState(() => _questionIndex = 0);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
          ),
          ElevatedButton(
            child: Text("Question 2"),
            onPressed: _answerQuestion,
          ),
          ElevatedButton(
            child: Text("Anser 3"),
            onPressed: _answerQuestion,
          ),
        ]),
      ),
    );
  }
}
