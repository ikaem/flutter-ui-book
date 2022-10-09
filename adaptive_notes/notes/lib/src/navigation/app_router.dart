import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/src/navigation/app_router_paths.dart';
import 'package:notes/src/ui/screens/note_details_screen.dart';
import 'package:notes/src/ui/screens/notes_list_screen.dart';

final homeRoute = GoRoute(
  path: AppRouterPaths.home,
  redirect: (context, state) => AppRouterPaths.notes,
);

final notesRoute = GoRoute(
    path: AppRouterPaths.notes,
    name: AppRouterPaths.notes,
    builder: (context, state) {
      // return const Text("TODO add proper stuff here");
      return const NotesListScreen();
    },
    routes: [
      noteEditRoute,
      noteNewRoute,
    ]);

final noteEditRoute = GoRoute(
  path: AppRouterPaths.noteEdit,
  name: AppRouterPaths.noteEdit,
  builder: (context, state) {
    final id = state.params["id"];

    // return const Text("TODO add proper stuff here");
    return NoteDetailsScreen(id: id);
  },
);

final noteNewRoute = GoRoute(
  path: AppRouterPaths.noteNew,
  name: AppRouterPaths.noteNew,
  builder: (context, state) {
    // return const Text("more routes here");
    return const NoteDetailsScreen();
  },
);

final appRouter = GoRouter(routes: [
  homeRoute,
  notesRoute,
]);
