import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function onReset;

  Result({@required this.score, @required this.onReset});

  String get resultPhrase {
    String resultText;
    if (score <= 5) {
      resultText = "You are likeable person!";
    } else if (score <= 10) {
      resultText = "You are an average person!";
    } else if (score <= 15) {
      resultText = "You are ..... strange!";
    } else {
      resultText = "You are really a bad person!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Center(
          child: Column(
            children: [
              Text(
                resultPhrase,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              TextButton(child: Text("Restart Quiz"), onPressed: onReset)
            ],
          ),
        ));
  }
}
