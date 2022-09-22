import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:race/localization/app_localization.dart';
import 'package:race/routing/routes.dart';
import 'package:race/views/home_view/widgets/results_tab.dart';
import 'package:race/views/home_view/widgets/standings_tab.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Expanded(
        //   child: TextButton(
        //     onPressed: () {
        //       Navigator.of(context).pushNamed(Routes.tester);
        //     },
        //     child: Text(
        //       "tester",
        //       style: TextStyle(
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text(context.l10n.app_title),
                elevation: 5,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.nextRacesPage);
                    },
                    icon: const Icon(
                      Icons.abc,
                    ),
                  ),
                ],
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: const Icon(Icons.list),
                      text: context.l10n.results,
                    ),
                    Tab(
                      icon: const Icon(Icons.group),
                      text: context.l10n.standings,
                    ),
                  ],
                ),
              ),
              body: const TabBarView(
                children: <Widget>[
                  ResultsTab(),
                  // Text("K"),
                  // Text("2"),
                  // Text("What")
                  StandingsTab(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
