import 'dart:math';

import 'package:animate/src/models/excuse.dart';
import 'package:animate/src/presentation/widgets/excuse_page_view.dart';
import 'package:animate/src/services/excuse_facade.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExcusesScreen extends StatefulWidget {
  const ExcusesScreen({super.key});

  @override
  State<ExcusesScreen> createState() => _ExcusesScreenState();
}

class _ExcusesScreenState extends State<ExcusesScreen> {
  // this should not rebuild
  late final excuses = context.read<ExcuseFacade>().getExcuses();

  @override
  Widget build(BuildContext context) {
    return FutureProvider.value(
      value: excuses,
      initialData: null,
      child: Consumer<List<Excuse>?>(
        builder: (context, value, child) {
          return _ExcusesScreenContent(excuses: value);
        },
      ),
    );
  }
}

class _ExcusesScreenContent extends StatefulWidget {
  const _ExcusesScreenContent({
    Key? key,
    this.excuses,
  }) : super(key: key);

  final List<Excuse>? excuses;

  @override
  State<_ExcusesScreenContent> createState() => __ExcusesScreenContentState();
}

class __ExcusesScreenContentState extends State<_ExcusesScreenContent> {
  int currentPage = 0;
  final bool _showExcuses = false;

// if no exuses, we will slowly transition from reducing value of excuses animation to increaseing value of loading animation

  @override
  Widget build(BuildContext context) {
    final enableNextButton = widget.excuses != null;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // this is by using the package
          child: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return SharedAxisTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            },
            child: widget.excuses == null
                ? const Center(
                    key: ValueKey("progress"),
                    child: CircularProgressIndicator(),
                  )
                : ExcusePageView(
                    key: const ValueKey("excuses"),
                    excuses: widget.excuses!,
                    currentExcuse: currentPage,
                  ),
          ),
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
