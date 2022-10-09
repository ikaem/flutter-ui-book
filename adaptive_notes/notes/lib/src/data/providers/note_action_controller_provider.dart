import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/controllers/note_action_controller.dart';

final noteActionControllerProvider = Provider<NoteActionController>((Ref ref) {
  return NoteActionController(ref);
});
