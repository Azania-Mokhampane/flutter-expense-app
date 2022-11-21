import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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

  void _addTransaction(String title, double amount) {
    final newTrasaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      transactions.add(newTrasaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransaction),
        TransactionList(
          transactions: transactions,
        )
      ],
    );
  }
}
