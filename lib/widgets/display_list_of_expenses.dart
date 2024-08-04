import 'package:flutter/material.dart';
import 'package:citilink_app/data/data.dart';
import 'package:citilink_app/utils/utils.dart';
import 'common_container.dart';

class DisplayListOfExpenses extends StatelessWidget {
  const DisplayListOfExpenses({super.key, required this.expenses, this.isRecent = false});

  final List<Expense> expenses;
  final bool isRecent;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height = isRecent ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyExpenses = isRecent ? 'There are no Recent Expenses' : 'There are no expenses this week';
    
    return CommonContainer(
      height: height,
      child: expenses.isEmpty 
          ? Center(
              child: Text(
                emptyExpenses,
                style: context.textTheme.titleMedium?.copyWith(color: Colors.black54),
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: expenses.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                return const Text('Home');
              },
            ),
    );
  }
}
