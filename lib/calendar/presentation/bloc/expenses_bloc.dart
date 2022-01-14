import 'package:bloc/bloc.dart';
import 'package:wallet_app/calendar/domain/model/total_day_expenses.dart';
import 'package:wallet_app/calendar/domain/usecase/get_one_day_expenses_usecase.dart';
import 'package:wallet_app/core/blocs/bloc_utils.dart';

class ExpensesBloc extends Bloc<BaseEvent, ExpensesState> {
  final GetOneDayExpensesUseCase _getOneDayExpensesUseCase;

  ExpensesBloc(this._getOneDayExpensesUseCase)
      : super(ExpensesState(
            data: TotalDayExpenses.empty(), eventState: UnknownEventState()));

  @override
  Stream<ExpensesState> mapEventToState(BaseEvent event) async* {
    if (event is FetchDataEvent) {
      try {
        yield ExpensesState(
          data: TotalDayExpenses.empty(),
          eventState: LoadingEventState(),
        );

        final data = await _getOneDayExpensesUseCase.execute(null);

        yield ExpensesState(data: data, eventState: SuccessEventState());
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

class ExpensesState extends BaseState<TotalDayExpenses> {
  ExpensesState(
      {required TotalDayExpenses data, required BaseEventState eventState})
      : super(data, eventState);
}
