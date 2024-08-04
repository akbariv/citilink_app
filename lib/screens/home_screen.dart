import 'package:citilink_app/config/router/routes.dart';
import 'package:citilink_app/data/data.dart';
import 'package:citilink_app/provider/state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:citilink_app/utils/utils.dart';
import 'package:citilink_app/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
      
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    final expenses = ref.watch(expenseProvider);

    int sundayExpense = expenses
        .where((expense) => expense.day == 'Sunday')
        .fold(0, (sum, expense) => sum + expense.amount);

    int mondayExpense = expenses
        .where((expense) => expense.day == 'Monday')
        .fold(0, (sum, expense) => sum + expense.amount);

    int tuesdayExpense = expenses
        .where((expense) => expense.day == 'Tuesday')
        .fold(0, (sum, expense) => sum + expense.amount);

    int wednesdayExpense = expenses
        .where((expense) => expense.day == 'Wednesday')
        .fold(0, (sum, expense) => sum + expense.amount);

    int thursdayExpense = expenses
        .where((expense) => expense.day == 'Thursday')
        .fold(0, (sum, expense) => sum + expense.amount);

    int fridayExpense = expenses
        .where((expense) => expense.day == 'Friday')
        .fold(0, (sum, expense) => sum + expense.amount);

    int saturdayExpense = expenses
        .where((expense) => expense.day == 'Saturday')
        .fold(0, (sum, expense) => sum + expense.amount);

    final totalAmount = expenses.fold(0, (sum, item) => sum + item.amount);

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
                      children: [
                        TextSpan(
                          text: '\$' + totalAmount.toString(),
                          style: const TextStyle(
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
                  DisplayListOfExpenses(
                    expenses: [
                      Expenses(
                        id: 1,
                        title: '',
                        time: '',
                        day: 'Monday',
                        amount: mondayExpense,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 2,
                        title: '',
                        time: '',
                        day: 'Tuesday',
                        amount: tuesdayExpense,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 3,
                        title: '',
                        time: '',
                        day: 'Wednesday',
                        amount: wednesdayExpense,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 4,
                        title: '',
                        time: '',
                        day: 'Thursday',
                        amount: thursdayExpense,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 5,
                        title: '',
                        time: '',
                        day: 'Friday',
                        amount: fridayExpense,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 6,
                        title: '',
                        time: '',
                        day: 'Saturday',
                        amount: saturdayExpense,
                        isRecent: false,
                      ),
                      Expenses(
                        id: 7,
                        title: '',
                        time: '',
                        day: 'Sunday',
                        amount: sundayExpense,
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
                  DisplayListOfExpenses(
                    expenses: expenses.where((e) => e.isRecent).toList(),
                    isRecent: true,
                  ),
                  const Gap(20),
                  ElevatedButton(
                    onPressed: () => context.push(RoutesLocation.addExpenses),
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
