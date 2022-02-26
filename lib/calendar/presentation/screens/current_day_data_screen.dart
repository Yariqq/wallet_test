import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/calendar/domain/usecase/get_available_categories_usecase.dart';
import 'package:wallet_app/calendar/domain/usecase/get_one_day_expenses_usecase.dart';
import 'package:wallet_app/calendar/presentation/bloc/expenses_bloc.dart';

class CurrentDayDataScreen extends StatelessWidget {
  final String chosenDate;
  final appContainer = CherryPick.openRootScope().openSubScope('appScope');

  CurrentDayDataScreen({required this.chosenDate, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          chosenDate,
        ),
      ),
      body: BlocProvider(
        create: (_) => ExpensesBloc(
          appContainer.resolve<GetOneDayExpensesUseCase>(),
          appContainer.resolve<GetAvailableCategoriesUseCase>(),
        )..add(FetchDataEvent()),
        child: BlocConsumer<ExpensesBloc, ExpensesState>(
          listener: (context, state) {
            if (state.eventState is ErrorEventState) {
              print((state.eventState as ErrorEventState).error.toString());
            }
          },
          builder: (context, state) {
            if (state.eventState is! LoadingEventState) {
              return Column(
                children: [
                  ListView.builder(
                    itemCount: state.data.dayExpenses.expenses.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.category),
                        title: Text(state.data.dayExpenses
                            .expenses[index].categoryName),
                        trailing: Text(state
                            .data.dayExpenses.expenses[index].amount
                            .toString()),
                      );
                    },
                  ),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
