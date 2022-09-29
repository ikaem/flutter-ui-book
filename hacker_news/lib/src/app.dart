import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hacker_news/src/localization/localization_extension.dart';
import 'package:hacker_news/src/navigation/app-router.dart';

class HackerNewsApp extends StatelessWidget {
  const HackerNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: "app",
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      // ok, this chooses which of the above two is used
      themeMode: ThemeMode.dark,
      // both of these should be fine
      // supportedLocales: AppLocalizations.supportedLocales,/*  */
      supportedLocales: const [Locale("en", null)],
      onGenerateTitle: (context) => context.loc.appTitle,
      onGenerateRoute: AppRouter.onGenerateRoute,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
    );
  }
}
