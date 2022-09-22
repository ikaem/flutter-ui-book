import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:race/states/collapsible/collapsible_state.dart';
import 'package:race/widgets/collapsible/primary_region.dart';
import 'package:race/widgets/collapsible/secondary_region.dart';

class Collapsible extends StatefulWidget {
  final Widget header;
  final Widget content;
  final EdgeInsets edgeInsets;
  final double heightBetweenRegions;
  final bool isInitializedOpened;

  const Collapsible({
    Key? key,
    required this.header,
    required this.content,
    this.edgeInsets = EdgeInsets.zero,
    this.heightBetweenRegions = 0.0,
    this.isInitializedOpened = false,
  }) : super(key: key);

  @override
  State<Collapsible> createState() => _CollapsibleState();
}

class _CollapsibleState extends State<Collapsible>
    with TickerProviderStateMixin {
  // note that there is no init state
  // usually animation controllers and animations are defined and initialized in the init state function
  late final animationController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
    // 1 or zero is to make sure we can reverse if it is initialized open
    value: widget.isInitializedOpened ? 1 : 0,
  );

  late final rotationAnimation = Tween<double>(
    begin: 0.0,
    end: pi,
  ).animate(animationController);

  late final slidingAnimation = CurvedAnimation(
    parent: animationController,
    curve: Curves.ease,
  );

  late List<Widget> regions = _buildRegions();

  void toggleExpansion() {
    final collapsibleState = CollapsibleState.of(context);

// no need to notifiy listeners, because the staste os of value ntoifier bool type
    collapsibleState.state.value = !collapsibleState.state.value;
  }

  // no need it seems for init state because all animation stuff is defiend in the state body? is this good practice? and it wont be changed i guess because it is final?
  // but also, maybe because the state itself never calls set state?

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  // covariant i guess allows for variants of this collapsible class - if, for isntance, another widget extends this one
  void didUpdateWidget(covariant Collapsible oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.header == widget.header &&
        oldWidget.content == widget.content) return;

    regions = _buildRegions();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: CollapsibleState.of(context).state,
      builder: (context, value, child) {
        if (!value) {
          animationController.reverse();
        } else {
          animationController.forward();
        }

// this child is the one we defined below
// this way we have defined child, and we always return same child
        // we could return different stuff from the builder depending on the state - but we dont need that here
        return child!;
      },
      child: Padding(
        padding: widget.edgeInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: regions,
          // children: [Text("2")],
        ),
      ),
    );
  }

  List<Widget> _buildRegions() {
    return <Widget>[
      GestureDetector(
        onTap: toggleExpansion,
        behavior: HitTestBehavior.opaque,
        // child: Text("no"),
        child: PrimaryRegion(
          animation: animationController,
          child: widget.header,
        ),
      ),
      SizeTransition(
        key: const Key("Collapsible-SizeTransition"),
        sizeFactor: animationController,
        axisAlignment: 1,
        // child: Text("no"),
        child: SecondaryRegion(
          heightBetweenRegions: widget.heightBetweenRegions,
          child: widget.content,
        ),
      ),
    ];
  }
}
