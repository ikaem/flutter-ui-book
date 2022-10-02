import 'package:flutter/material.dart';
import 'package:hacker_news/src/ui/screens/story_list_screen.dart';
import 'package:hacker_news/src/utils/enums.dart';
import 'package:hacker_news/src/utils/extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.storyType,
  });

// thiys is not used anywhere
  final StoryType storyType;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  // what is this used for?
  late final List<GlobalKey<NavigatorState>> _navigatorKeys =
      List.generate(StoryType.values.length, (index) => GlobalKey());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: StoryType.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hacker News"),
        bottom: TabBar(
          onTap: (index) => _onTap(context, index),
          controller: _tabController,
          tabs: <Widget>[
            for (final storiesType in StoryType.values)
              Tab(text: storiesType.displayName)
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          for (final storiesType in StoryType.values)
            StoryListScreen(
              storiesType: storiesType,
            )
        ],
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    final navigator = _navigatorKeys[index];

    if (index != _tabController.index) return;

    navigator.currentState?.maybePop();
  }
}
