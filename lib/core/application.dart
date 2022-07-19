import 'package:flutter/material.dart';
import '../hackathon_directory/soft_skills/presentation/pages/soft_skills_page.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Futura',
      ),
      home: const SoftSkillsPage(),
    );
  }
}
