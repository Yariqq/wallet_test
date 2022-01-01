
import 'package:flutter/material.dart';
import 'package:wallet_app/calendar/presentation/chosen_date_popup.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: CalendarDatePicker(
        firstDate: DateTime(2000, 1, 1),
        onDateChanged: (DateTime chosenDate) {
          showGeneralDialog(
            context: context,
            pageBuilder: (context, anim1, anim2) {
              return ChosenDatePopup(chosenDate: chosenDate);
            },
          );
        },
        initialDate: DateTime.now(),
        lastDate: DateTime(2100, 1, 1),
      ),
    );
  }

}