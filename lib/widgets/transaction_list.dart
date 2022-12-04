import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(
      {@required this.transactions, @required this.deleteTransaction});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: transactions.isEmpty
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
          : SingleChildScrollView(
              child: Column(
                children: transactions.map((transaction) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                                'R${transaction.amount.toStringAsFixed(2)}'),
                          ),
                        ),
                      ),
                      title: Text(
                        transaction.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transaction.date),
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {
                          deleteTransaction(transaction.id);
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
