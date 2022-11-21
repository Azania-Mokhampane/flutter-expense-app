import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  String amountInput;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              onChanged: (value) => amountInput = value,
            ),
            ElevatedButton(
              onPressed: () {
                print(titleController.text);
                print("Amount: $amountInput");
              },
              child: Text("Add Expense"),
            ),
          ],
        ),
      ),
    );
  }
}
