import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';
import 'widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];

  List<Transaction> get _recentTtransactions {
    return transactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addTransaction(String title, double amount, DateTime date) {
    final newTrasaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );

    setState(() {
      transactions.add(newTrasaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expense App"),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                size: 30,
              ),
              onPressed: () {
                // _startAddNewTransaction(context);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Chart(_recentTtransactions),
            TransactionList(
              transactions: transactions,
            )
          ],
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            child: Icon(
              Icons.add,
            ),
            onPressed: () {
              _startAddNewTransaction(context);
            },
          ),
        ),
      ),
    );
  }
}
