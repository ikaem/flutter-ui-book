import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:race/localization/app_localization.dart';
import 'package:race/routing/routes.dart';

void main() {
  // registering font licence
  LicenseRegistry.addLicense(() async* {
    // i guess this will be generated from assets folder that se wspcecified in the pubspec for fonts? or in general?
    final license = await rootBundle.loadString("google_fonts/OFL.txt");

// oh, ok, so we generate text in license here
    yield LicenseEntryWithLineBreaks(["google_fonts"], license);
  });

  runApp(
    const RaceStandingsApp(),
  );
}

class RaceStandingsApp extends StatelessWidget {
  const RaceStandingsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => context.l10n.app_title,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
    );
  }
}
