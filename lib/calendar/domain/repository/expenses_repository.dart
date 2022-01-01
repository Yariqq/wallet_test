
import 'package:wallet_app/calendar/domain/model/expense.dart';

abstract class ExpensesRepository {
  Future<List<Expense>> getOneDayExpenses();
}