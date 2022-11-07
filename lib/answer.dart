import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerName;
  final Function onPressed;

  Answer({this.answerName, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(answerName),
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
      ),
    );
  }
}
