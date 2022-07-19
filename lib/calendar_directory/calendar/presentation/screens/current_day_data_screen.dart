import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wallet_app/core/utils/empty_container.dart';
import 'package:wallet_app/core/utils/loading_indicator.dart';

import '../../domain/usecase/add_expense_usecase.dart';
import '../../domain/usecase/get_available_categories_usecase.dart';
import '../../domain/usecase/get_one_day_expenses_usecase.dart';
import '../bloc/expenses_bloc.dart';
import '../widgets/create_expense_content.dart';

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
      )..add(FetchExpensesEvent(date: chosenDate.toString())),
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
                if (state.eventState is SuccessEventState)
                  IconButton(
                    onPressed: () {
                      context.read<ExpensesBloc>().add(FetchCategoriesEvent());
                      _showCreateExpenseBottomSheet(context);
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
              ],
            ),
            body: state.eventState is LoadingEventState
                ? const LoadingIndicator()
                : _buildBody(state.data),
          );
        },
      ),
    );
  }

  Widget _buildBody(DayExpensesModel data) {
    if (data.dayExpenses.expenses.isNotEmpty) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: data.dayExpenses.expenses.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0.0,
                      ),
                      leading: _buildCategoryIcon(
                          data.dayExpenses.expenses[index].categoryName),
                      title: Text(
                        data.dayExpenses.expenses[index].categoryName,
                      ),
                      trailing: Text(
                        data.dayExpenses.expenses[index].amount.toString(),
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total day amount:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    data.dayExpenses.totalDayAmount.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return const EmptyContainer(message: 'No expenses yet');
  }

  Widget _buildCategoryIcon(String categoryName) {
    switch (categoryName) {
      case 'Food':
        return const Icon(Icons.fastfood_outlined);
      case 'Transport':
        return const Icon(Icons.directions_bus_outlined);
      case 'Purchases/Products':
        return const Icon(Icons.add_shopping_cart_outlined);
      case 'Entertainment':
        return const Icon(Icons.accessibility_new_outlined);
      default:
        return const Icon(Icons.not_listed_location_outlined);
    }
  }

  void _showCreateExpenseBottomSheet(BuildContext context) {
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
