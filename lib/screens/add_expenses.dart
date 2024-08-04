import 'package:citilink_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddExpenses extends StatelessWidget {
   static AddExpenses builder(BuildContext context, GoRouterState state) =>
      const AddExpenses();
  const AddExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: const DisplayWhiteText(
          text: 'Add Expenses',
          size: 20,
          fontWeight: FontWeight.bold,
        ),
      )
    );
  }
}