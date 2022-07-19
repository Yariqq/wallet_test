import 'package:bloc/bloc.dart';
import 'package:wallet_app/core/blocs/bloc_utils.dart';

import '../../domain/model/category.dart';
import '../../domain/model/total_day_expenses.dart';
import '../../domain/usecase/add_expense_usecase.dart';
import '../../domain/usecase/get_available_categories_usecase.dart';
import '../../domain/usecase/get_one_day_expenses_usecase.dart';

class ExpensesBloc extends Bloc<BaseEvent, ExpensesState> {
  final GetOneDayExpensesUseCase _getOneDayExpensesUseCase;
  final GetAvailableCategoriesUseCase _getAvailableCategoriesUseCase;
  final AddExpenseUseCase _addExpenseUseCase;

  ExpensesBloc(this._getOneDayExpensesUseCase,
      this._getAvailableCategoriesUseCase, this._addExpenseUseCase)
      : super(ExpensesState(
            data: DayExpensesModel.initial(), eventState: UnknownEventState()));

  @override
  Stream<ExpensesState> mapEventToState(BaseEvent event) async* {
    if (event is FetchExpensesEvent) {
      try {
        yield ExpensesState(
          data: state.data.copyWith(),
          eventState: LoadingEventState(),
        );

        final expenses = await _getOneDayExpensesUseCase.execute(event.date);

        yield ExpensesState(
          data: state.data.copyWith(dayExpenses: expenses),
          eventState: SuccessEventState(),
        );
      } catch (e) {
        yield ExpensesState(data: state.data, eventState: ErrorEventState(e));
      }
    } else if (event is FetchCategoriesEvent) {
      try {
        yield ExpensesState(
          data: state.data.copyWith(),
          eventState: BottomSheetLoadingEventState(),
        );

        final categories = await _getAvailableCategoriesUseCase.execute(null);

        yield ExpensesState(
          data: state.data.copyWith(
            categories: categories,
            chosenCategory: categories.first.name,
          ),
          eventState: SuccessEventState(),
        );
      } catch (e) {
        yield ExpensesState(data: state.data, eventState: ErrorEventState(e));
      }
    } else if (event is AddExpenseEvent) {
      try {
        yield ExpensesState(
          data: state.data.copyWith(),
          eventState: LoadingEventState(),
        );

        int categoryId = 0;

        for (int i = 0; i < state.data.categories.length; i++) {
          if (state.data.categories[i].name == state.data.chosenCategory) {
            categoryId = state.data.categories[i].id;
          }
        }

        await _addExpenseUseCase.execute(
          AddExpenseUseCaseParams(
            date: event.date,
            amount: event.amount,
            categoryId: categoryId,
          ),
        );

        yield ExpensesState(
          data: state.data.copyWith(),
          eventState: SuccessAddingExpenseEventState(),
        );
      } catch (e) {
        yield ExpensesState(data: state.data, eventState: ErrorEventState(e));
      }
    } else if (event is ChangeCategoryEvent) {
      yield ExpensesState(
        data: state.data.copyWith(chosenCategory: event.categoryName),
        eventState: SuccessEventState(),
      );
    }
  }
}

class FetchExpensesEvent extends BaseEvent {
  final String date;

  FetchExpensesEvent({required this.date});
}

class FetchCategoriesEvent extends BaseEvent {}

class ChangeCategoryEvent extends BaseEvent {
  final String? categoryName;

  ChangeCategoryEvent({required this.categoryName});
}

class AddExpenseEvent extends BaseEvent {
  final double amount;
  final String date;

  AddExpenseEvent({
    required this.amount,
    required this.date,
  });
}

class UnknownEventState extends BaseEventState {}

class LoadingEventState extends BaseEventState {}

class BottomSheetLoadingEventState extends BaseEventState {}

class SuccessEventState extends BaseEventState {}

class SuccessAddingExpenseEventState extends BaseEventState {}

class ErrorEventState extends BaseEventState {
  final Object error;

  ErrorEventState(this.error);
}

class ExpensesState extends BaseState<DayExpensesModel> {
  ExpensesState({
    required DayExpensesModel data,
    required BaseEventState eventState,
  }) : super(data, eventState);
}

class DayExpensesModel {
  final TotalDayExpenses dayExpenses;
  final List<Category> categories;
  final String chosenCategory;

  DayExpensesModel({
    required this.dayExpenses,
    required this.categories,
    required this.chosenCategory,
  });

  factory DayExpensesModel.initial() {
    return DayExpensesModel(
      dayExpenses: TotalDayExpenses.empty(),
      categories: [],
      chosenCategory: '',
    );
  }

  DayExpensesModel copyWith({
    TotalDayExpenses? dayExpenses,
    List<Category>? categories,
    String? chosenCategory,
  }) {
    return DayExpensesModel(
      dayExpenses: dayExpenses ?? this.dayExpenses,
      categories: categories ?? this.categories,
      chosenCategory: chosenCategory ?? this.chosenCategory,
    );
  }
}
