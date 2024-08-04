// import 'package:citilink_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:citilink_app/screens/home_screen.dart';
import 'package:citilink_app/config/config.dart';

class MyExpense extends StatelessWidget {
  const MyExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
