import 'package:wallet_app/core/mappers/mapper.dart';

import '../../domain/model/expense.dart';
import '../source/remote/model/expense_response.dart';

class ExpenseMapper extends Mapper<Expense, ExpenseResponse> {
  @override
  Expense mapFromBean(ExpenseResponse src) {
    return Expense(
      categoryName: src.categoryName ?? '',
      amount: src.amount ?? 0.0,
    );
  }

  @override
  ExpenseResponse mapToBean(Expense src) {
    // TODO: implement mapToBean
    throw UnimplementedError();
  }
}
