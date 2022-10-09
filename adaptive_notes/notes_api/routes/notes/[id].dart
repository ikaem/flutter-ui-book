import 'package:dart_frog/dart_frog.dart';
import 'package:notes_common/notes_common.dart';

import '../../data/notes_data.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  switch (context.request.method) {
    case HttpMethod.put:
      {
        return _handlePut(context, id);
      }

    case HttpMethod.delete:
      {
        return _handleDelete(context, id);
      }
    // ignore: no_default_cases
    default:
      {
        return Response(statusCode: 404);
      }
  }
}

// controllers
Future<Response> _handlePut(RequestContext context, String id) async {
  // again, convert request data into a json map

  final body = await context.request.json();
  final newNote = Note.fromMap(body).copyWith(id: id);

  fakeNotes = fakeNotes.map((note) {
    if (note.id == id) return newNote;
    return note;
  }).toList();

  return Response.json(body: newNote);
}

Response _handleDelete(RequestContext context, String id) {
  fakeNotes = fakeNotes.where((element) => element.id != id).toList();

  return Response(statusCode: 204);
}
