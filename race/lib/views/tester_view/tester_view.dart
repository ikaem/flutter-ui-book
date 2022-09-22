import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:race/localization/app_localization.dart';
import 'package:race/views/home_view/widgets/results_tab.dart';

class TesterView extends StatefulWidget {
  const TesterView({Key? key}) : super(key: key);

  @override
  State<TesterView> createState() => _TesterViewState();
}

class _TesterViewState extends State<TesterView> {
  bool isShown = false;

  void renderModal() {
    if (!isShown) return;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Hello"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
        elevation: 5,
      ),
      body: Column(
        children: [
          // renderModal(),
          TextButton(
            onPressed: () {
              isShown = true;
              setState(() {});
            },
            child: Text("show"),
          ),
        ],
      ),
    );
  }
}
