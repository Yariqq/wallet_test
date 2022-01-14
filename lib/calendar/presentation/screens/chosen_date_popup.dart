import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wallet_app/calendar/domain/usecase/get_one_day_expenses_usecase.dart';
import 'package:wallet_app/calendar/presentation/bloc/expenses_bloc.dart';

class ChosenDatePopup extends StatelessWidget {
  final DateTime chosenDate;

  const ChosenDatePopup({required this.chosenDate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appContainer = CherryPick.openRootScope().openSubScope('appScope');

    return BlocProvider(
      create: (_) => ExpensesBloc(
        appContainer.resolve<GetOneDayExpensesUseCase>(),
      )..add(FetchDataEvent()),
      child: BlocBuilder<ExpensesBloc, ExpensesState>(
        builder: (context, state) {
          if (state.eventState is SuccessEventState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  contentPadding: EdgeInsets.zero,
                  insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                  content: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            DateFormat("dd.MM.yyyy").format(chosenDate),
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          trailing: IconButton(
                            padding: const EdgeInsets.only(left: 18),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        ListTile(
                          title: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(12, 8, 8, 8),
                              hintText: 'Amount',
                              hintStyle: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(142, 141, 146, 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(235, 236, 240, 1),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(235, 236, 240, 1),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: const Color.fromRGBO(235, 236, 240, 1),
                                width: 1,
                              ),
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: 'first',
                              underline: Container(),
                              onChanged: (String? newValue) {},
                              items: <String>[
                                'first',
                                'Two',
                                'Free',
                                'Four'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Center(
                                    child: Text(value),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        MaterialButton(
                          height: 45,
                          minWidth: 100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.black26,
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Add',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Divider(
                          indent: 20,
                          endIndent: 20,
                          thickness: 1.5,
                        ),
                        ListView.builder(
                          itemCount: state.data.expenses.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(Icons.category),
                              title:
                                  Text(state.data.expenses[index].categoryName),
                              trailing: Text(
                                  state.data.expenses[index].amount.toString()),
                            );
                          },
                        ),
                        const Divider(
                          indent: 20,
                          endIndent: 20,
                          thickness: 1.5,
                        ),
                        ListTile(
                          title: const Text(
                            'Day limit: 100',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          trailing: Text(
                            'Day spent: ${state.data.totalDayAmount.toString()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
