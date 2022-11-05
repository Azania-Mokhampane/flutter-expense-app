import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerName;

  Answer({this.answerName});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text("Question 1"),
        onPressed: () => null,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black)),
      ),
    );
  }
}
