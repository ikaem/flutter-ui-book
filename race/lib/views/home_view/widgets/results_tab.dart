import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:race/styles/utils/breakpoints.dart'
    show mobileResultsBreakpoint;

class ResultsTab extends StatelessWidget {
  const ResultsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints dimensions) {
        // this is for small devices
        if (dimensions.maxWidth <= mobileResultsBreakpoint) {
          return ListView.builder(
            itemCount: resultsLength.length,
            itemBuilder: (
              context,
              index,
            ) {
              return _CompactResultCard(
                results: resultsList[index],
              );
            },
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListView.builder(
            itemCount: resultsLength.length,
            itemBuilder: (
              context,
              index,
            ) {
              return _ExpandedResultCard(
                results: resultsList[index],
              );
            },
          ),
        );
      },
    );
  }
}
