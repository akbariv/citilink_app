import 'package:flutter/material.dart';
import 'package:citilink_app/utils/utils.dart';
import 'package:citilink_app/widgets/widgets.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: deviceSize.height * 0.3,
              width: deviceSize.width,
              color: colors.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DisplayWhiteText(
                    text: 'Weekly Expense Tracker',
                    fontWeight: FontWeight.normal,
                    size: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Total Spent: ',
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      children: const [
                        TextSpan(
                          text: '\$ 0',
                          style: TextStyle(
                            color: Colors.red, // Red color for the amount
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'This Week Expenses',
                    style: context.textTheme.headlineMedium,
                  ),
                  const Gap(20),
                  const DisplayListOfExpenses(expenses: []),
                  const Gap(20),
                  Text(
                    'Recent Expenses',
                    style: context.textTheme.headlineMedium,
                  ),
                  const Gap(20),
                  const DisplayListOfExpenses(expenses: [], isRecent: true),
                  const Gap(20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: DisplayWhiteText(
                        text: 'Add New Expenses',
                      ),
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
