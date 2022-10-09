import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/data/providers/note_facade_provider.dart';
import 'package:notes/src/data/providers/notes_provider.dart';

class NoteActionController {
  NoteActionController(
    this.ref,
  );
  // this ref is by riverpod
  final Ref ref;

  Future<void> createNote({
    required String title,
    required String content,
  }) async {
// and here now we get the service
// how does one do dependecy injection?
    final noteFacadeService = ref.read(noteFacadeProvider);

    try {
      await noteFacadeService.create(title: title, content: content);

// i guess with refresh it will force it to re-evaluate its state now
// it will also return created values
// so all consumers will get the values
// this could be simialr to notifiyListeners
      ref.refresh(notesProvider);
    } catch (e) {
      if (kDebugMode) {
        // this should be printed anyhow in the service
        print(e);
      }

      rethrow;
    }
  }

  Future<void> updateNote(
      {required String id,
      required String title,
      required String content}) async {
    final noteFacadeService = ref.read(noteFacadeProvider);

    try {
      await noteFacadeService.update(id: id, title: title, content: content);

// the notes provider is the one with the future
// we do select from it at one point, though
      ref.refresh(notesProvider);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      rethrow;
    }
  }
}
