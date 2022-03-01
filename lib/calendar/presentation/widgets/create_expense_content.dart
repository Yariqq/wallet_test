import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/calendar/presentation/bloc/expenses_bloc.dart';

class CreateExpenseContent extends StatefulWidget {
  final ExpensesBloc bloc;
  final DateTime date;

  const CreateExpenseContent(this.bloc, this.date, {Key? key})
      : super(key: key);

  @override
  _CreateExpenseContentState createState() => _CreateExpenseContentState();
}

class _CreateExpenseContentState extends State<CreateExpenseContent> {
  final appContainer = CherryPick.openRootScope().openSubScope('appScope');
  final TextEditingController _newExpenseController = TextEditingController();

  @override
  void dispose() {
    _newExpenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesBloc, ExpensesState>(
      bloc: widget.bloc,
      builder: (context, state) {
        if (state.eventState is! LoadingEventState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Create expense',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                const SizedBox(height: 10),
                _buildDropDownCategoriesField(state.data),
                const SizedBox(height: 10),
                _buildNewExpenseTextField(),
                const SizedBox(height: 20),
                _buildCreateButton(context),
              ],
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildDropDownCategoriesField(DayExpensesModel data) {
    return DropdownButton<String>(
      isExpanded: true,
      value: data.chosenCategory.name,
      onChanged: (String? newValue) {},
      items: data.categories
          .map((e) => e.name)
          .toList()
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Center(
            child: Text(value),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNewExpenseTextField() {
    return TextFormField(
      controller: _newExpenseController,
      decoration: const InputDecoration(
        labelText: 'Amount',
        labelStyle: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildCreateButton(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          widget.bloc.add(
                AddExpenseEvent(
                  amount: double.parse(_newExpenseController.text),
                  date: widget.date.toIso8601String().split('T')[0],
                  categoryId:
                      widget.bloc.state.data.chosenCategory.id,
                ),
              );
        },
        child: const Center(
          child: Text(
            'Create',
          ),
        ),
      ),
    );
  }
}
