import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrimaryRegion extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  const PrimaryRegion({
    Key? key,
    required this.child,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: child,
          ),
          // this part is the arrow that will animate
          AnimatedBuilder(
            animation: animation,
            // this builder needs to return a widget
            builder: (context, child) => Transform.rotate(
              // this will then redraw the widget on each animation value chnage
              angle: animation.value,
              child: child,
            ),
            child: const Icon(Icons.arrow_downward),
          ),
        ],
      ),
    );
  }
}
