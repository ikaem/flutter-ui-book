import 'package:animate/src/models/excuse.dart';
import 'package:animate/src/presentation/widgets/excuse_card.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExcusePageView extends StatelessWidget {
  const ExcusePageView({
    super.key,
    this.excuses = const [],
    this.currentExcuse = 0,
  });

  final List<Excuse> excuses;
  final int currentExcuse;

  @override
  Widget build(BuildContext context) {
    // this could be null, or it could throw error becuase out of bounds if emtpy excuse
    // final selectedExcuse = excuses[currentExcuse];
    final selectedExcuse = excuses.isNotEmpty ? excuses[currentExcuse] : null;

    return ExcuseCard(
        key: ValueKey(selectedExcuse!.id), excuse: selectedExcuse);
  }
}
