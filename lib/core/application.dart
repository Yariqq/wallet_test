import 'package:flutter/material.dart';
import 'package:wallet_app/hackathon_directory/registration/presentation/registration_page.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Futura',
      ),
      home: RegistrationPage(),
    );
  }
}
