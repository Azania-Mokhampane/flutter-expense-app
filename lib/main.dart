import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Expense App"),
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  child: Center(
                    child: Text("CHART!!"),
                  ),
                  elevation: 5,
                ),
              ),
              UserTransactions()
            ],
          )),
    );
  }
}
