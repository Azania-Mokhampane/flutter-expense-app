import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );

        var totalSum = 0.0;

        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay.day &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.year == weekDay.year) {
            totalSum += recentTransactions[i].amount;
          }
        }
        return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return recentTransactions.length != 0
        ? Card(
            elevation: 6,
            margin: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "Expenses in the last 7 days",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: groupedTransactionValues.map((item) {
                      return Flexible(
                        child: ChartBar(
                          day: item['day'],
                          amountSpent: item['amount'],
                          amountSpentPct: totalSpending == 0.0
                              ? 0.0
                              : (item['amount'] as double) / totalSpending,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          )
        : Text("");
  }
}
