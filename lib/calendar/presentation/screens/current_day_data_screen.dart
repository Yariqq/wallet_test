import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wallet_app/calendar/domain/usecase/add_expense_usecase.dart';
import 'package:wallet_app/calendar/domain/usecase/get_available_categories_usecase.dart';
import 'package:wallet_app/calendar/domain/usecase/get_one_day_expenses_usecase.dart';
import 'package:wallet_app/calendar/presentation/bloc/expenses_bloc.dart';
import 'package:wallet_app/calendar/presentation/widgets/create_expense_content.dart';

class CurrentDayDataScreen extends StatelessWidget {
  final DateTime chosenDate;
  final appContainer = CherryPick.openRootScope().openSubScope('appScope');

  CurrentDayDataScreen({required this.chosenDate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExpensesBloc(
        appContainer.resolve<GetOneDayExpensesUseCase>(),
        appContainer.resolve<GetAvailableCategoriesUseCase>(),
        appContainer.resolve<AddExpenseUseCase>(),
      )..add(
          FetchExpensesEvent(date: chosenDate.toIso8601String().split('T')[0])),
      child: BlocConsumer<ExpensesBloc, ExpensesState>(
        listener: (context, state) {
          if (state.eventState is ErrorEventState) {
            print((state.eventState as ErrorEventState).error.toString());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                DateFormat("dd.MM.yyyy").format(chosenDate),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    _showCreateExpenseBottomSheet(context);
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
            body: state.eventState is! LoadingEventState
                ? state.data.dayExpenses.expenses.isNotEmpty
                    ? Column(
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
                      )
                    : const Center(
                        child: Text('No expenses yet'),
                      )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }

  void _showCreateExpenseBottomSheet(BuildContext context) {
    context.read<ExpensesBloc>().add(FetchCategoriesEvent());

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (builderContext) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).viewPadding.top,
          ),
          child: SingleChildScrollView(
            child: SafeArea(
              child: CreateExpenseContent(
                context.read<ExpensesBloc>(),
                chosenDate,
              ),
            ),
          ),
        );
      },
    );
  }
}
