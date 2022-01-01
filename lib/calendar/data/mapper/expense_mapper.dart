
import 'package:wallet_app/calendar/data/source/remote/model/expense_response.dart';
import 'package:wallet_app/calendar/domain/model/expense.dart';
import 'package:wallet_app/core/mappers/mapper.dart';

class ExpenseMapper extends Mapper<Expense, ExpenseResponse> {

  @override
  Expense mapFromBean(ExpenseResponse src) {
    return Expense(
      categoryName: src.category ?? '',
      amount: src.amount ?? 0.0,
    );
  }

  @override
  ExpenseResponse mapToBean(Expense src) {
    // TODO: implement mapToBean
    throw UnimplementedError();
  }

}