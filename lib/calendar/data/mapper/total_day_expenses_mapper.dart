import 'package:wallet_app/calendar/data/mapper/expense_mapper.dart';
import 'package:wallet_app/calendar/data/source/remote/model/total_day_expenses_response.dart';
import 'package:wallet_app/calendar/domain/model/total_day_expenses.dart';
import 'package:wallet_app/core/mappers/mapper.dart';

class TotalDayExpensesMapper
    extends Mapper<TotalDayExpenses, TotalDayExpensesResponse> {
  final ExpenseMapper _expenseMapper;

  TotalDayExpensesMapper(this._expenseMapper);

  @override
  TotalDayExpenses mapFromBean(TotalDayExpensesResponse src) {
    return TotalDayExpenses(
      expenses: src.expenses
          .map((expense) => _expenseMapper.mapFromBean(expense))
          .toList(),
      totalDayAmount: src.totalDayAmount ?? 0.0,
    );
  }

  @override
  TotalDayExpensesResponse mapToBean(TotalDayExpenses src) {
    // TODO: implement mapToBean
    throw UnimplementedError();
  }
}
