import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:race/localization/app_localization.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.app_title),
          elevation: 5,
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
            // ResultsTab(),
            // StandingsTab(),
          ],
        ),
      ),
    );
  }
}
