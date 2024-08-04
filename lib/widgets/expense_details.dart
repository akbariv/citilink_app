import 'package:citilink_app/data/data.dart';
import 'package:citilink_app/provider/state_notifier_provider.dart';
import 'package:citilink_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseDetails extends ConsumerWidget {
  const ExpenseDetails({super.key, required this.expenses});
  final Expenses expenses;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allExpenses = ref.watch(expenseProvider);
    
    final detailExpenses = allExpenses.where((expense) => expense.day == expenses.day).toList();

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Expense Details on ${expenses.day}',
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(height: 20), 
          Expanded(
            child: ListView.builder(
              itemCount: detailExpenses.length,
              itemBuilder: (context, index) {
                final expense = detailExpenses[index];
                return ListTile(
                  leading: const Icon(Icons.receipt_long_rounded, color: Colors.red),
                  title: Text(expense.title),
                  subtitle: Text('Amount: \$${expense.amount}\nTime: ${expense.time}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
