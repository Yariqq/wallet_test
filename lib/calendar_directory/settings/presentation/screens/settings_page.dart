import 'package:flutter/material.dart';

import 'environment_page.dart';

const _requiredEnvironmentTapCounter = 5;

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  int _openEnvironmentTapCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            setState(() => _openEnvironmentTapCounter++);
            if (_openEnvironmentTapCounter == _requiredEnvironmentTapCounter) {
              _openEnvironmentTapCounter = 0;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EnvironmentPage()));
            }
          },
          child: const Text('Settings'),
        ),
      ),
      body: Container(),
    );
  }
}
