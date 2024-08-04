import 'package:citilink_app/data/data.dart';
import 'package:citilink_app/provider/state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a provider for the ExpenseNotifier
final expenseProvider = StateNotifierProvider<ExpenseNotifier, List<Expenses>>(
  (ref) => ExpenseNotifier(),
);