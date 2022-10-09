import 'dart:math';

import 'package:animate/src/models/excuse.dart';
import 'package:animate/src/presentation/widgets/excuse_page_view.dart';
import 'package:animate/src/services/excuse_facade.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExcusesScreenVanilla extends StatefulWidget {
  const ExcusesScreenVanilla({super.key});

  @override
  State<ExcusesScreenVanilla> createState() => _ExcusesScreenVanillaState();
}

class _ExcusesScreenVanillaState extends State<ExcusesScreenVanilla> {
  // this should not rebuild
  late final excuses = context.read<ExcuseFacade>().getExcuses();

  @override
  Widget build(BuildContext context) {
    return FutureProvider.value(
      value: excuses,
      initialData: null,
      child: Consumer<List<Excuse>?>(
        builder: (context, value, child) {
          return _ExcusesScreenVanillaContent(excuses: value);
        },
      ),
    );
  }
}

class _ExcusesScreenVanillaContent extends StatefulWidget {
  const _ExcusesScreenVanillaContent({
    Key? key,
    this.excuses,
  }) : super(key: key);

  final List<Excuse>? excuses;

  @override
  State<_ExcusesScreenVanillaContent> createState() =>
      __ExcusesScreenVanillaContentState();
}

class __ExcusesScreenVanillaContentState
    extends State<_ExcusesScreenVanillaContent> with TickerProviderStateMixin {
  late Animation<double> _loadingAnimation;
  late Animation<double> _excusesAnimation;

  late AnimationController _loadingAnimationController;
  late AnimationController _excusesAnimationController;

  int currentPage = 0;
  bool _showExcuses = false;

  @override
  void initState() {
    _loadingAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _excusesAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      // among others, vsync ensures that the animation runs only while this screen is displayed
      vsync: this,
    );

    _loadingAnimation =
        Tween<double>(begin: 1, end: 0).animate(_loadingAnimationController);
    _excusesAnimation =
        Tween<double>(begin: 0, end: 1).animate(_excusesAnimationController);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _loadingAnimationController.dispose();
    _excusesAnimationController.dispose();
  }

  @override
  void didUpdateWidget(covariant _ExcusesScreenVanillaContent oldWidget) {
    super.didUpdateWidget(oldWidget);

    // so first, if we have excuses, we will start reduceing value of loading animation
    // after that is done we will start increaseing value of exsuses animation

    if (widget.excuses != null) {
      _loadingAnimationController
          .forward()
          .then((value) => _excusesAnimationController.forward());

      return;
    }

// if no exuses, we will slowly transition from reducing value of excuses animation to increaseing value of loading animation

    _excusesAnimationController
        .reverse()
        .then((value) => _loadingAnimationController.reverse());
  }

  @override
  Widget build(BuildContext context) {
    final enableNextButton = widget.excuses != null;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // this is implicit animations, with purpose built widgets

          child: Stack(
            children: [
              // if (widget.excuses == null)
              AnimatedOpacity(
                // so this will define when opacity is what
                opacity: widget.excuses != null ? 0 : 1,
                duration: const Duration(milliseconds: 500),
                // and we set value on end to be able to tell other one when it should start
                onEnd: () {
                  setState(
                    () {
                      // this would never end if we make it conditional loadin of this stuff
                      _showExcuses = true;
                    },
                  );
                },
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              if (widget.excuses != null)
                AnimatedOpacity(
                  // if we are showing excuses, we dont need to hide te excuse view screen
                  opacity: _showExcuses ? 1 : 0,
                  // opacity: widget.excuses != null ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: ExcusePageView(
                    excuses: widget.excuses!,
                    currentExcuse: currentPage,
                  ),
                )
            ],
          ),

          // these are explicit aniamtions with controllers and animation classes
          // child: Stack(
          //   children: [
          //     // note that this never goes away - it always loads
          //     // because of it, i guess it can jsut swithc between opacity directions
          //     AnimatedBuilder(
          //       animation: _loadingAnimation,
          //       builder: (context, child) {
          //         return Opacity(
          //           opacity: _loadingAnimation.value,
          //           child: child,
          //         );
          //       },
          //       child: const Center(
          //         child: CircularProgressIndicator(),
          //       ),
          //     ),
          //     if (widget.excuses != null)
          //       AnimatedBuilder(
          //         animation: _excusesAnimation,
          //         builder: (context, child) {
          //           return Opacity(
          //             opacity: _excusesAnimation.value,
          //             child: child,
          //           );
          //         },
          //         child: ExcusePageView(
          //           excuses: widget.excuses!,
          //           currentExcuse: currentPage,
          //         ),
          //       )
          //   ],
          // ),
          // child: widget.excuses == null
          //     ? const Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     : ExcusePageView(
          //         excuses: widget.excuses!,
          //         currentExcuse: currentPage,
          //       ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: enableNextButton
            ? () {
                setState(() {
                  currentPage = Random().nextInt(widget.excuses!.length);
                });
              }
            : null,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
