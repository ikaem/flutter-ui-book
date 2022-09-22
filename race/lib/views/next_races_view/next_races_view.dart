import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:race/localization/app_localization.dart';
import 'package:race/styles/utils/breakpoints.dart';
import 'package:race/utils/mixins/random_date_generator.dart';
import 'package:race/views/next_races_view/widgets/circular_progression.dart';

class NextRacesView extends StatelessWidget with RandomDateGenerator {
  const NextRacesView({super.key});

  void _tileCallback(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.l10n.app_title),
          content: const Text("something"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.app_title),
        elevation: 5,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: LayoutBuilder(
              builder: (context, dimensions) {
                final square =
                    min<double>(maxCircularProgress, dimensions.maxWidth);

                return Center(
                  child: CustomPaint(
                    painter: const CircularProgressPainter(
                      progression: 0.65,
                    ),
                    child: SizedBox(
                      width: square,
                      height: square,
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/svg/trophy.svg",
                          width: square / 1.8,
                          height: square / 1.8,
                          placeholderBuilder: (_) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Center(
            child: Text(
              "10 drivers done / 6 drivers left",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Divider(
              height: 80,
              thickness: 2,
            ),
          ),
          Center(
            child: LayoutBuilder(
              builder: (context, dimensions) {
                final width = min<double>(
                  maxNextRacesContents,
                  dimensions.maxWidth,
                );

                return SizedBox(
                  width: width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Upcoming races"),
                      const SizedBox(
                        height: 25,
                      ),
                      ListTile(
                        title: const Text('Place number 1'),
                        subtitle: Text(randomDate),
                        leading: const Icon(Icons.public),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blue,
                          ),
                          onPressed: () => _tileCallback(context),
                        ),
                      ),
                      ListTile(
                        title: const Text('Place number 2'),
                        subtitle: Text(randomDate),
                        leading: const Icon(Icons.public),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blue,
                          ),
                          onPressed: () => _tileCallback(context),
                        ),
                      ),
                      ListTile(
                        title: const Text('Place number 3'),
                        subtitle: Text(randomDate),
                        leading: const Icon(Icons.public),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blue,
                          ),
                          onPressed: () => _tileCallback(context),
                        ),
                      ),
                      ListTile(
                        title: const Text('Place number 4'),
                        subtitle: Text(randomDate),
                        leading: const Icon(Icons.public),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blue,
                          ),
                          onPressed: () => _tileCallback(context),
                        ),
                      ),
                      ListTile(
                        title: const Text('Place number 5'),
                        subtitle: Text(randomDate),
                        leading: const Icon(Icons.public),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blue,
                          ),
                          onPressed: () => _tileCallback(context),
                        ),
                      ),
                      ListTile(
                        title: const Text('Place number 6'),
                        subtitle: Text(randomDate),
                        leading: const Icon(Icons.public),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blue,
                          ),
                          onPressed: () => _tileCallback(context),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
