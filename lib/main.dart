import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wallet_app/calendar/presentation/di/expenses_di.dart';
import 'package:wallet_app/core/di/environment_module.dart';
import 'package:wallet_app/core/di/network_module.dart';

import 'core/application.dart';

const isMock = false;

const baseUrl = 'https://moneytracker001.herokuapp.com/';

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
    ExpensesModule(),
  ]);
  runApp(const Application());
}
