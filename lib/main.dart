
import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/cupertino.dart';
import 'package:wallet_app/calendar/presentation/di/expenses_di.dart';

import 'core/application.dart';

void main() {
  CherryPick.openRootScope().openSubScope('appScope').installModules([
    ExpensesModule(),
  ]);
  runApp(const Application());
}