import 'package:wallet_app/calendar/data/source/expenses_data_source.dart';
import 'package:wallet_app/calendar/data/source/remote/model/expense_response.dart';
import 'package:wallet_app/calendar/domain/model/expense.dart';
import 'package:wallet_app/calendar/domain/repository/expenses_repository.dart';
import 'package:wallet_app/core/mappers/mapper.dart';

class ExpensesRepositoryImpl extends ExpensesRepository {
  final Mapper<Expense, ExpenseResponse> _expensesMapper;
  final ExpensesDataSource _expensesDataSource;

  ExpensesRepositoryImpl(this._expensesMapper, this._expensesDataSource);

  @override
  Future<List<Expense>> getOneDayExpenses() {
    return _expensesDataSource.getExpenses().then(
        (list) => list.map((src) => _expensesMapper.mapFromBean(src)).toList());
  }
}
