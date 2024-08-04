import 'package:citilink_app/data/data.dart';
import 'package:citilink_app/utils/utils.dart';
import 'package:flutter/material.dart';

class ExpenseDetails extends StatelessWidget {
  const ExpenseDetails({super.key, required this.expenses});
  final Expenses expenses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Expense Details on ${expenses.day}',
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(height: 20), // Add some space between the text and the list
          // Dummy List
          Expanded(
            child: ListView(
              children: List.generate(
                3, // Number of dummy items
                (index) => ListTile(
                  leading: const Icon(Icons.receipt_long, color: Colors.blueGrey),
                  title: Text('Dummy Item ${index + 1}'),
                  subtitle: Text('Details for item ${index + 1}'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
