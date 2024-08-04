import 'package:citilink_app/data/data.dart';
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
                  const DisplayListOfExpenses(
                    expenses: [
                      Expenses(
                        id: 1,
                        title: '',
                        time: 'Monday',
                        amount: 100 ,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 2,
                        title: '',
                        time: 'Tuesday',
                        amount: 34 ,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 3,
                        title: '',
                        time: 'Wednesday',
                        amount: 34 ,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 4,
                        title: '',
                        time: 'Thursday',
                        amount: 34 ,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 5,
                        title: '',
                        time: 'Friday',
                        amount: 34 ,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 6,
                        title: '',
                        time: 'Saturday',
                        amount: 34 ,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 7,
                        title: '',
                        time: 'Sunday',
                        amount: 34 ,
                        isRecent: false,
                      ),
                    ],
                  ),
                  const Gap(20),
                  Text(
                    'Recent Expenses',
                    style: context.textTheme.headlineMedium,
                  ),
                  const Gap(20),
                  const DisplayListOfExpenses(expenses: [
                     Expenses(
                        id: 1,
                        title: 'Buy Milk',
                        time: '19:00 PM',
                        amount: 10 ,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 2,
                        title: 'Monthly subscription',
                        time: '17:00 PM',
                        amount: 12 ,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 3,
                        title: 'Monthly subscription',
                        time: '14:00 PM',
                        amount: 12 ,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 4,
                        title: 'Lunch ',
                        time: '12:07 PM',
                        amount: 12 ,
                        isRecent: false,
                      ),
                  ], isRecent: true),
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
