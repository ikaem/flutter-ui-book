import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const <Widget>[
        Icon(
          Icons.remove,
          color: Colors.redAccent,
        ),
        Text("Counter app"),
        Icon(
          Icons.remove,
          color: Colors.redAccent,
        ),
      ],
    );
  }
}

// dont do this - const cant be used, so this will never be cached, and it will always be evaluated 
// Widget appTitle() {
//   return Row(
//     mainAxisSize: MainAxisSize.min,
//     children: const [
//       Icon(Icons.remove),
//       Text('Enhanced Counter app!'),
//       Icon(Icons.add),
//     ],
//   );
// }
