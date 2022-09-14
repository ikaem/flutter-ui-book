import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class History extends StatefulWidget {
  final List<int> increasesHistory;
  const History({
    Key? key,
    required this.increasesHistory,
  }) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
// this is manually caching the list
// and note that htis is late
  // so this will be assigned only later i guess?
  late ListView list = buildList();

  final randomCachedContainerThatShouldNotBeRebuilt = Container(
    height: 30,
    width: 50,
    color: Colors.black12,
    child: const Text("SOme"),
  );

  // this is building the list
  ListView buildList() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        final item = widget.increasesHistory[index];

        return Text(
          item.toString(),
        );
      },
      separatorBuilder: (_, __) {
        return const SizedBox(
          width: 10,
        );
      },
      itemCount: widget.increasesHistory.length,
    );
  }

  @override
  void didUpdateWidget(covariant History oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.increasesHistory.length != oldWidget.increasesHistory.length) {
      list = buildList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text("Increases counter"),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: SizedBox(
              height: 40,
              child: list,
            ),
          ),
        ),
      ],
    );
  }
}
