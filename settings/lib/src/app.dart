import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:settings/src/features/cupertino/cupertino_settings_app.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    this.platform,
  });

  final TargetPlatform? platform;

  @override
  Widget build(BuildContext context) {
    // return Container();

    // log("this is platform")
    final me = platform?.name;

    log("this is me: $me");
    final platformFromContext = Theme.of(context).platform;

    log("this is from context: ${platformFromContext.name}");

    final finalPlatform = platform ?? Theme.of(context).platform;

    switch (finalPlatform) {
      // case TargetPlatform.android:
      // case TargetPlatform.fuchsia:
      //   return MaterialSettingsApp;
      // case TargetPlatform.iOS:
      // case TargetPlatform.macOS:
      default:
        return const CupertinoSettingsApp();
    }

    // return MaterialApp(
    //   home: Scaffold(
    //       body: SafeArea(
    //     child: Column(
    //       children: [
    //         finalPlatform == TargetPlatform.android
    //             ? const Text("andoid")
    //             : const Text("ios"),
    //       ],
    //     ),
    //   )),
    // );

    // if (platform == TargetPlatform.android) {
    //   return const Text("Here i am android");
    // }

    // return const Text("Here i am everyting else but android");
  }
}
