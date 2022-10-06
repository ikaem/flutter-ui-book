import 'package:animate/src/app.dart';
import 'package:animate/src/services/excuse_facade.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'src/presentation/controllers/settings_controller.dart';
import 'src/services/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  final excuseFacade = ExcuseFacade();

  await settingsController.loadSettings();

  runApp(
    Provider(
      create: (context) => excuseFacade,
      child: const MyApp(),
      // child: const Text(""),
    ),
  );
}
