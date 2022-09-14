import 'package:counter/counter_app/widgets/app_title.dart';
import 'package:counter/counter_app/widgets/history.dart';
import 'package:flutter/material.dart';

class CounterAppBody extends StatefulWidget {
  const CounterAppBody({Key? key}) : super(key: key);

  @override
  State<CounterAppBody> createState() => _CounterAppBodyState();
}

class _CounterAppBodyState extends State<CounterAppBody> {
  /// The current status of the counter.
  int counter = 0;
  List<int> increasesHistory = [];

  /// Increases the counter by 1.
  void increase() {
    setState(() {
      counter++;
      increasesHistory = List<int>.from(increasesHistory)..add(counter);
    });
  }

  /// Decreases the counter by 1.
  void decrease() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const AppTitle(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: decrease,
                  child: const Text("-"),
                ),
                Text(
                  counter.toString(),
                ),
                ElevatedButton(
                  onPressed: increase,
                  child: const Text("+"),
                ),
              ],
            ),
            // title widget
            // counter widget
            History(increasesHistory: increasesHistory),
          ],
        ),
      ),
    );
  }
}
