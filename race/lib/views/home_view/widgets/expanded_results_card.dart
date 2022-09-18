import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:race/localization/app_localization.dart';
import 'package:race/models/results_entry.dart';
import 'package:race/styles/utils/breakpoints.dart';
import 'package:race/views/home_view/widgets/drivers_list.dart';

class ExpandedResultsCard extends StatelessWidget {
  final List<ResultsEntry> results;

  const ExpandedResultsCard({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimensions) {
        double cardWidth = max<double>(
          mobileResultsBreakpoint,
          dimensions.maxWidth,
        );

        if (cardWidth >= maxStretchResultCards - 50) {
          cardWidth = maxStretchResultCards;
        }

        final leftFlex = cardWidth < maxStretchResultCards ? 2 : 3;

        return Center(
          child: SizedBox(
            width: cardWidth - 50,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Card(
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: leftFlex,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(results.first.circuitName),
                          Text(
                            context.l10n.circuit_name,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "${results.first.name} ${results.first.lastName}",
                          ),
                          Text(
                            context.l10n.winner,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: DriversList(
                        results: results,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
