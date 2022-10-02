import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final homeRoute = GoRoute(
  path: "/",
  builder: (context, state) {
    return Material(
      child: Center(
        child: TextButton(
            onPressed: () {
              appGoRouterExample.push(page2Route.path);
            },
            child: const Text("go to page 2")),
      ),
    );
  },
);

final page2Route = GoRoute(
  path: "/page-2",
  builder: (context, state) {
    return Material(
      child: Center(
        child: TextButton(
            onPressed: () {
              appGoRouterExample.go(homeRoute.path);
            },
            child: const Text("Hello go home")),
      ),
    );
  },
);

final appGoRouterExample = GoRouter(
  routes: [
    homeRoute,
    page2Route
    // GoRoute(
    //   path: "/",
    //   builder: (context, state) {
    //     return const Material(
    //       child: Center(
    //         child: Text("Hello go router"),
    //       ),
    //     );
    //   },
    // ),
  ],
);

// final appGoRouter = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const Material(
//         child: Center(
//           child: Text('Hello GoRouter'),
//         ),
//       ),
//     ),
//   ],
// );
