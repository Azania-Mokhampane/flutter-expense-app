import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double amountSpent;
  final amountSpentPct;

  ChartBar(
      {@required this.day,
      @required this.amountSpent,
      @required this.amountSpentPct});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Column(
          children: [
            Container(
              height: 20,
              child: FittedBox(
                child: Text('R${amountSpent.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              width: 10,
              height: 60,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: amountSpentPct,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(day)
          ],
        );
      },
    );
  }
}
