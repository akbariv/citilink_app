import 'package:citilink_app/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a StateNotifier to manage a list of expenses
class ExpenseNotifier extends StateNotifier<List<Expenses>> {
  ExpenseNotifier() : super([]);

  void addExpense(Expenses expense) {
    state = [...state, expense];
  }

  void removeExpense(int id) {
    state = state.where((expense) => expense.id != id).toList();
  }

  // Provider for ExpenseNotifier
final expenseProvider = StateNotifierProvider<ExpenseNotifier, List<Expenses>>((ref) {
  return ExpenseNotifier();
});
}
