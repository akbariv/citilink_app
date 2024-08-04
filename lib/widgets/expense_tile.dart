import 'package:citilink_app/data/data.dart';
import 'package:citilink_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({super.key, required this.expense, this.isRecent = true});

  final Expenses expense;
  final bool isRecent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0, // Reduced padding
        horizontal: 12.0, // Reduced padding
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6.0), // Reduced padding
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.white),
              color: const Color.fromARGB(255, 235, 109, 100),
            ),
            child: Center(
              child: Icon(
                isRecent ? Icons.history : Icons.receipt_long_outlined,
                color: Colors.white,
                size: 20, // Reduced icon size
              ),
            ),
          ),
          const Gap(8), // Reduced gap

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                    expense.day.isNotEmpty ? expense.day : expense.time,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 16, 
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                if (expense.title.isNotEmpty)
                  Text(
                    expense.title,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: Colors.black,
                      fontSize: 14, 
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              ],
            ),
          ),

          const Spacer(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0), // Reduced padding
                child: Text(
                  '\$${expense.amount.toString()}',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.red,
                    fontSize: 16, // Reduced font size
                    fontWeight: FontWeight.w400, // Adjusted font weight
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
