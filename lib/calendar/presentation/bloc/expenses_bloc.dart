import 'package:bloc/bloc.dart';
import 'package:wallet_app/calendar/domain/model/total_day_expenses.dart';
import 'package:wallet_app/calendar/domain/usecase/get_available_categories_usecase.dart';
import 'package:wallet_app/calendar/domain/usecase/get_one_day_expenses_usecase.dart';
import 'package:wallet_app/core/blocs/bloc_utils.dart';

class ExpensesBloc extends Bloc<BaseEvent, ExpensesState> {
  final GetOneDayExpensesUseCase _getOneDayExpensesUseCase;
  final GetAvailableCategoriesUseCase _getAvailableCategoriesUseCase;

  ExpensesBloc(
      this._getOneDayExpensesUseCase, this._getAvailableCategoriesUseCase)
      : super(ExpensesState(
            data: DayExpensesModel.initial(), eventState: UnknownEventState()));

  @override
  Stream<ExpensesState> mapEventToState(BaseEvent event) async* {
    if (event is FetchDataEvent) {
      try {
        yield ExpensesState(
          data: state.data.copyWith(),
          eventState: LoadingEventState(),
        );

        final expenses = await _getOneDayExpensesUseCase.execute(null);
        final categories = await _getAvailableCategoriesUseCase.execute(null);

        yield ExpensesState(
            data: state.data.copyWith(
              dayExpenses: expenses,
              categories: categories,
            ),
            eventState: SuccessEventState());
      } catch (e) {
        yield ExpensesState(data: state.data, eventState: ErrorEventState(e));
      }
    }
  }
}

class FetchDataEvent extends BaseEvent {}

class UnknownEventState extends BaseEventState {}

class LoadingEventState extends BaseEventState {}

class SuccessEventState extends BaseEventState {}

class ErrorEventState extends BaseEventState {
  final Object error;

  ErrorEventState(this.error);
}

class ExpensesState extends BaseState<DayExpensesModel> {
  ExpensesState(
      {required DayExpensesModel data, required BaseEventState eventState})
      : super(data, eventState);
}

class DayExpensesModel {
  final TotalDayExpenses dayExpenses;
  final List<String> categories;

  DayExpensesModel({
    required this.dayExpenses,
    required this.categories,
  });

  factory DayExpensesModel.initial() {
    return DayExpensesModel(
        dayExpenses: TotalDayExpenses.empty(), categories: []);
  }

  DayExpensesModel copyWith({
    TotalDayExpenses? dayExpenses,
    List<String>? categories,
  }) {
    return DayExpensesModel(
      dayExpenses: dayExpenses ?? this.dayExpenses,
      categories: categories ?? this.categories,
    );
  }
}
