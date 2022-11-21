import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); // the underscore means the class in a private, it can'y be used in other files
  }
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> transactions = [
    Transaction(
      id: "1",
      title: "Samsung A32",
      amount: 4299.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "2",
      title: "Macbook Air",
      amount: 18999.99,
      date: DateTime.now(),
    ),
  ];
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
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Title",
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: "Amount"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Add Expense"),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: transactions.map((transaction) {
                  return Card(
                    child: Row(children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            style: BorderStyle.solid,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R${transaction.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(transaction.date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ]),
                  );
                }).toList(),
              )
            ],
          )),
    );
  }
}
