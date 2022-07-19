
class Expense {
  final String categoryName;
  final double amount;

  Expense({required this.categoryName, required this.amount});

  factory Expense.empty() {
    return Expense(
      categoryName: '',
      amount: 0.0,
    );
  }
}