import 'package:flutter/material.dart';

import '../../../settings/presentation/screens/settings_page.dart';
import 'current_day_data_screen.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsPage())),
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: CalendarDatePicker(
        firstDate: DateTime(2000, 1, 1),
        onDateChanged: (DateTime chosenDate) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CurrentDayDataScreen(chosenDate: chosenDate)));
        },
        initialDate: DateTime.now(),
        lastDate: DateTime(2100, 1, 1),
      ),
    );
  }
}
