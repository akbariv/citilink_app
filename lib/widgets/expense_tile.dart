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
        vertical: 6.0, 
        horizontal: 12.0, 
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.white),
              color: const Color.fromARGB(255, 235, 109, 100),
            ),
            child: Center(
              child: Icon(
                isRecent ? Icons.history : Icons.receipt_long_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const Gap(8), 

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                    expense.title.isEmpty ? expense.day : expense.title,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                Text(
                  expense.title.isEmpty? 'tap to details' : expense.time,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: const Color.fromARGB(255, 97, 97, 97),
                    fontSize: 16,
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
                    horizontal: 8.0), 
                child: Text(
                  '\$${expense.amount.toString()}',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.red,
                    fontSize: 16, 
                    fontWeight: FontWeight.w400, 
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
