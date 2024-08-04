import 'package:flutter/material.dart';
import 'package:citilink_app/data/data.dart';
import 'package:citilink_app/utils/utils.dart';
import 'package:citilink_app/widgets/widgets.dart';
import 'common_container.dart';
import 'expense_tile.dart'; // Ensure this import is correct

class DisplayListOfExpenses extends StatelessWidget {
  const DisplayListOfExpenses({
    super.key,
    required this.expenses,
    this.isRecent = false,
  });

  final List<Expenses> expenses;
  final bool isRecent;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height = isRecent ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyExpenses = isRecent
        ? 'There are no Recent Expenses'
        : 'There are no expenses this week';

    return CommonContainer(
      height: height,
      child: expenses.isEmpty
          ? Center(
              child: Text(
                emptyExpenses,
                style: context.textTheme.titleMedium?.copyWith(color: Colors.black54),
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: expenses.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final expense = expenses[index];
                return expense.day.isEmpty
                    ? ExpenseTile(
                        expense: expense,
                        isRecent: isRecent,
                      )
                    : InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            builder: (ctx) {
                              return ExpenseDetails(expenses: expense);
                            },
                          );
                        },
                        child: ExpenseTile(
                          expense: expense,
                          isRecent: isRecent,
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(thickness: 2.0);
              },
            ),
    );
  }
}
