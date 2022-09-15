import 'package:counter/counter_app/models/counter.dart';
import 'package:counter/counter_app/state/counter_state.dart';
import 'package:counter/counter_app/widgets/app_title.dart';
import 'package:counter/counter_app/widgets/counter_buttons.dart';
import 'package:counter/counter_app/widgets/history.dart';
import 'package:flutter/material.dart';

class CounterAppBody extends StatelessWidget {
  const CounterAppBody({Key? key}) : super(key: key);

//   @override
//   State<CounterAppBody> createState() => _CounterAppBodyState();
// }

// class _CounterAppBodyState extends State<CounterAppBody> {
//   /// The current status of the counter.
//   int counter = 0;
//   List<int> increasesHistory = [];

  /// Increases the counter by 1.
  // void increase() {
  //   setState(() {
  //     counter++;
  //     increasesHistory = List<int>.from(increasesHistory)..add(counter);
  //   });
  // }

  // /// Decreases the counter by 1.
  // void decrease() {
  //   setState(() {
  //     counter--;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return CounterState(
      model: Counter(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              AppTitle(),
              CounterButtons(),
              // title widget
              // counter widget
              // History(increasesHistory: increasesHistory),
              History(),
            ],
          ),
        ),
      ),
    );
  }
}
