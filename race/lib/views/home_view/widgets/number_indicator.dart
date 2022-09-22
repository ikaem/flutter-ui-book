import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NumberIndicator extends StatelessWidget {
  final int number;

  const NumberIndicator({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueAccent,
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Center(
        child: Text("$number",
            style: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}
