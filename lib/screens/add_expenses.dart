import 'package:citilink_app/data/data.dart';
import 'package:citilink_app/provider/state_notifier_provider.dart';
import 'package:citilink_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart'; 
import 'dart:math';

class AddExpenses extends ConsumerStatefulWidget {
  static AddExpenses builder(BuildContext context, GoRouterState state) =>
      const AddExpenses();
  const AddExpenses({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddExpensesState();
}

class _AddExpensesState extends ConsumerState<AddExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

int generateRandomInteger(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  void _createNewExpense() {
    final  title = _titleController.text;
    final  amount = _amountController.text;

    // Get the current date and time
    final DateTime now = DateTime.now();
    final formattedDay = DateFormat.EEEE().format(now); // Get the day of the week
    final formattedTime = DateFormat.jm().format(now);

  if(title.isNotEmpty){
    final expenses = Expenses(
      id: generateRandomInteger(10, 99),
      title: title,
      day: formattedDay,
      time: formattedTime,
      amount: int.parse(amount),
      isRecent: true,
    );
     showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Expense Details'),
        content: Text('Title: $title\nAmount: $amount\nDay: $formattedDay\nTime: $formattedTime'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
    ref.read(expenseProvider.notifier).addExpense(expenses);

  }else{
    showDialog(context: context, builder: (ctx)=> AlertDialog(
      title: const Text('Error'),
      content: const Text('Please enter a title'),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(ctx).pop();
        }, child: const Text('OK'))
      ],
    ),
    );
  }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(
          text: 'Add Expenses',
          size: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ], // Ensures only digits can be entered
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createNewExpense,
              child: const Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
