import 'package:counter/counter_app/counter_app_body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const EnhancedCounterApp(),
  );
}

class EnhancedCounterApp extends StatelessWidget {
  const EnhancedCounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterAppBody(),
    );
  }
}
