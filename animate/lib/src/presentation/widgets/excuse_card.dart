import 'package:animate/src/models/excuse.dart';
import 'package:flutter/material.dart';

class ExcuseCard extends StatelessWidget {
  const ExcuseCard({
    super.key,
    this.excuse,
  });

  final Excuse? excuse;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (excuse == null) return const SizedBox.shrink();

    return Center(
      child: Text(
        excuse!.text!,
        style: textTheme.headline2,
      ),
    );
  }
}
