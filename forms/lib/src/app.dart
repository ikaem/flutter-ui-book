import 'package:flutter/material.dart';
import 'package:forms/src/navigation/app_router.dart';
import 'package:forms/src/presentation/controllers/contact_controller.dart';
import 'package:provider/provider.dart';

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final contactProviderController = ContactController();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (contactProviderContext) => contactProviderController,
        )
      ],
      builder: (context, child) => child!,
      child: MaterialApp.router(
        restorationScopeId: "app",
        // stuff should be here
        // localizationsDelegates: const [],
        // supportedLocales: const [],
        onGenerateTitle: (context) => "Title",
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        /*  */
        // here we choose that we will use dark variant
        themeMode: ThemeMode.dark,
        routeInformationParser: appRouter.routeInformationParser,
        routerDelegate: appRouter.routerDelegate,
        routeInformationProvider: appRouter.routeInformationProvider,
      ),
    );
  }
}
