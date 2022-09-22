import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:race/models/results_entry.dart';
import 'package:race/states/collapsible/collapsible_state.dart';
import 'package:race/styles/utils/breakpoints.dart';
import 'package:race/utils/mixins/random_date_generator.dart';
import 'package:race/views/home_view/widgets/drivers_list.dart';
import 'package:race/widgets/collapsible/collapsible.dart';

class CompactResultsCard extends StatelessWidget with RandomDateGenerator {
  final List<ResultsEntry> results;

  const CompactResultsCard({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // this is inherited widget, via which we are providing state to the children of this widget
    return CollapsibleState(
      state: ValueNotifier<bool>(false),
      child: LayoutBuilder(
        builder: ((context, constraints) {
          final width =
              min<double>(mobileResultsBreakpoint, constraints.maxWidth);

          return SizedBox(
            // why wouldnt we just let it expand entire width possible
            width: width,
            // child: Text("what"),
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 15,
              ),
              child: Collapsible(
                edgeInsets: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                header: ListTile(
                  title: Text(results.first.circuitName),
                  subtitle: Text(randomDate),
                ),
                content: DriversList(
                  results: results,
                ),
                // content: Text("no"),
              ),
            ),
          );
        }),
      ),
    );
  }
}
