import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({@required this.transactions});
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/no_expenses.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "No transactions added yet!",
                style: TextStyle(fontSize: 20),
              )
            ],
          )
        : Column(
            children: transactions.map((transaction) {
              return Card(
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'R${transaction.amount.toStringAsFixed(2)}',
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
          );
  }
}
