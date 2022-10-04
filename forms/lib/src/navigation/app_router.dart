import 'package:flutter/material.dart';
import 'package:forms/src/navigation/app_route_paths.dart';
import 'package:forms/src/presentation/screens/contact_edit_screen.dart';
import 'package:forms/src/presentation/screens/contact_list_screen,.dart';
import 'package:go_router/go_router.dart';

final homeRoute = GoRoute(
  path: AppRoutePaths.home,
  redirect: (context, state) => AppRoutePaths.contacts,
);

final contactsRoute = GoRoute(
    path: AppRoutePaths.contacts,
    name: AppRoutePaths.contacts,
    builder: (context, state) {
      // return const Text("This should be contaxts list screen");

      return const ContactListScreen();
    },
    routes: [contactDetailsSubroute, contactEditSubroute, contactNewSubroute]);

final contactDetailsSubroute = GoRoute(
  path: AppRoutePaths.contactDetails,
  name: AppRoutePaths.contactDetails,
  builder: (context, state) {
    final id = int.parse(state.params["id"]!);

    // return const Text("this is just temp subreoute");
    return ContactEditScreen(
      id: id,
    );
  },
);

final contactEditSubroute = GoRoute(
  path: AppRoutePaths.contactEdit,
  name: AppRoutePaths.contactEdit,
  builder: (context, state) {
    final id = int.parse(state.params["id"]!);

    // return const Text("this is just temp subreoute");
    return ContactEditScreen(id: id);
  },
);

final contactNewSubroute = GoRoute(
  path: AppRoutePaths.contactNew,
  name: AppRoutePaths.contactNew,
  builder: (context, state) {
    // return const Text("this is just temp subreoute");

    return const ContactEditScreen();
  },
);

final appRouter = GoRouter(
  routes: [
    homeRoute,
    contactsRoute,
  ],
);
