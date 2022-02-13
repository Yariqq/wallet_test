import 'package:wallet_app/calendar/data/source/expenses_data_source.dart';
import 'package:wallet_app/calendar/data/source/remote/model/categories_response.dart';
import 'package:wallet_app/calendar/data/source/remote/model/total_day_expenses_response.dart';
import 'package:wallet_app/calendar/domain/model/category.dart';
import 'package:wallet_app/calendar/domain/model/total_day_expenses.dart';
import 'package:wallet_app/calendar/domain/repository/expenses_repository.dart';
import 'package:wallet_app/core/mappers/mapper.dart';

class ExpensesRepositoryImpl extends ExpensesRepository {
  final Mapper<TotalDayExpenses, TotalDayExpensesResponse>
      _totalDayExpensesMapper;
  final Mapper<List<Category>, List<CategoriesResponse>> _categoriesMapper;
  final ExpensesDataSource _expensesDataSource;

  ExpensesRepositoryImpl(this._totalDayExpensesMapper, this._categoriesMapper,
      this._expensesDataSource);

  @override
  Future<TotalDayExpenses> getOneDayExpenses() {
    return _expensesDataSource
        .getExpenses()
        .then((response) => _totalDayExpensesMapper.mapFromBean(response));
  }

  @override
  Future<List<Category>> getAvailableCategories() {
    return _expensesDataSource
        .getCategories()
        .then((response) => _categoriesMapper.mapFromBean(response));
  }
}
