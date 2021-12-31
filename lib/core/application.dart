
import 'package:flutter/material.dart';
import 'package:wallet_app/calendar/calendar_screen.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Futura',
      ),
      home: const CalendarScreen(),
    );
  }

}