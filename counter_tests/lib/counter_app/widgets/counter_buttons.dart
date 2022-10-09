import 'package:counter/counter_app/state/counter_state.dart';
import 'package:flutter/material.dart';

class CounterButtons extends StatelessWidget {
  const CounterButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterState = CounterState.of(context).model;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: CounterState.of(context).model.decrease,
          child: const Text("-"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedBuilder(
            animation: counterState,
            builder: (_, __) {
              return Text(
                counterState.counter.toString(),
              );
            },
          ),
        ),
        ElevatedButton(
          // onPressed: increase,
          onPressed: CounterState.of(context).model.increase,
          child: const Text("+"),
        ),
      ],
    );
  }
}
