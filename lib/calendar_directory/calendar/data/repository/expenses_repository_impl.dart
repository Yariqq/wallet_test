import 'package:wallet_app/core/mappers/mapper.dart';

import '../../domain/model/category.dart';
import '../../domain/model/total_day_expenses.dart';
import '../../domain/repository/expenses_repository.dart';
import '../source/expenses_data_source.dart';
import '../source/remote/model/categories_response.dart';
import '../source/remote/model/total_day_expenses_response.dart';

class ExpensesRepositoryImpl extends ExpensesRepository {
  final Mapper<TotalDayExpenses, TotalDayExpensesResponse>
      _totalDayExpensesMapper;
  final Mapper<List<Category>, List<CategoriesResponse>> _categoriesMapper;
  final ExpensesDataSource _expensesDataSource;

  ExpensesRepositoryImpl(this._totalDayExpensesMapper, this._categoriesMapper,
      this._expensesDataSource);

  @override
  Future<TotalDayExpenses> getOneDayExpenses(String date) {
    return _expensesDataSource
        .getExpenses(date)
        .then((response) => _totalDayExpensesMapper.mapFromBean(response));
  }

  @override
  Future<List<Category>> getAvailableCategories() {
    return _expensesDataSource
        .getCategories()
        .then((response) => _categoriesMapper.mapFromBean(response));
  }

  @override
  Future<void> addExpense(String date, double amount, int categoryId) {
    return _expensesDataSource.addExpense(date, amount, categoryId);
  }
}
