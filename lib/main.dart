import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wallet_app/core/di/environment_module.dart';
import 'package:wallet_app/core/di/network_module.dart';
import 'package:wallet_app/hackathon_directory/registration/presentation/di/registration_module.dart';

import 'core/application.dart';
import 'hackathon_directory/soft_skills/presentation/di/soft_skills_module.dart';

const isMock = true;

const baseUrl = 'http://172.104.131.215:8000/';

const connectionTimeout = 60000;

const receiveTimeout = 60000;

const sendTimeout = 60000;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  CherryPick.openRootScope().openSubScope('appScope').installModules([
    EnvironmentModule(
      isMock: isMock,
      baseUrl: baseUrl,
      connectionTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
    ),
    NetworkModule(),
    RegistrationModule(),
    SoftSkillsModule(),
  ]);

  runApp(const Application());
}
