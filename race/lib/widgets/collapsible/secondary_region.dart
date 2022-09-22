import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondaryRegion extends StatelessWidget {
  final Widget child;
  final double heightBetweenRegions;

  const SecondaryRegion({
    Key? key,
    required this.child,
    required this.heightBetweenRegions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: heightBetweenRegions,
        ),
        Flexible(
          child: child,
        ),
        // Flexible(
        //   child: Text("2"),
        // ),
        // Text("s")
      ],
    );
  }
}
