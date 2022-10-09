import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/data/providers/note_facade_provider.dart';
import 'package:notes_common/notes_common.dart';

final notesProvider = FutureProvider<List<Note>>((ref) async {
  final noteService = ref.read(noteFacadeProvider);

  try {
    final List<Note> notes = await noteService.getAll();

    return notes;
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e.message);
    }

    rethrow;
  }
});
