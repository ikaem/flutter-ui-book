import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:race/models/data_source.dart';
import 'package:race/styles/utils/breakpoints.dart'
    show mobileResultsBreakpoint;
import 'package:race/views/home_view/widgets/expanded_results_card.dart';

import 'compact_results_card.dart';

class ResultsTab extends StatelessWidget {
  const ResultsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints dimensions) {
        // this is for small devices
        if (dimensions.maxWidth <= mobileResultsBreakpoint) {
          return ListView.builder(
            itemCount: resultsList.length,
            itemBuilder: (
              context,
              index,
            ) {
              return CompactResultsCard(
                results: resultsList[index],
              );

              // return Text("what this");
            },
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListView.builder(
            itemCount: resultsList.length,
            itemBuilder: (
              context,
              index,
            ) {
              return ExpandedResultsCard(
                results: resultsList[index],
              );
            },
          ),
        );
      },
    );
  }
}
