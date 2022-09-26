import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo/src/controllers/todo_controller.dart';
import 'package:todo/src/localization/app_localization.dart';
import 'package:todo/src/routing/app_router.dart';

class TodosApp extends StatelessWidget {
  const TodosApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: "app",
      // how does the app know which theme to choose
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        // so this is localized strings for material compinents libary
        // and rest of them too
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      // i guess we could od both here
      // supportedLocales: const [Locale("en", null)],
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => context.loc.appTitle,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      // onGenerateRoute: AppRouter.onGenerateRouteVanilla(todosController),
      onGenerateRoute: AppRouter.onGenerateRouteInherited,
    );
  }
}
