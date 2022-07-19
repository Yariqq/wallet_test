import 'expense.dart';

class TotalDayExpenses {
  final List<Expense> expenses;
  final double totalDayAmount;

  TotalDayExpenses({required this.expenses, required this.totalDayAmount});

  factory TotalDayExpenses.empty() {
    return TotalDayExpenses(
      expenses: [Expense.empty()],
      totalDayAmount: 0.0,
    );
  }
}
