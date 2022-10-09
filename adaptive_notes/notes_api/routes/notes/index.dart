import 'package:dart_frog/dart_frog.dart';
import 'package:notes_common/notes_common.dart';

import '../../data/notes_data.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      {
        return _handleGet(context);
      }

    case HttpMethod.post:
      {
        return _handlePost(context);
      }

    // ignore: no_default_cases
    default:
      {
        return Response(statusCode: 404);
      }
  }
}

// these are controllers actually
Response _handleGet(RequestContext context) {
  final mappedNotes = fakeNotes.map((note) {
    // note that the data needs to be sent as a map - not directly as an object
    // actually, Response.json will convert maps to json
    return note.toMap();
  }).toList();

  return Response.json(body: mappedNotes);
}

Future<Response> _handlePost(RequestContext context) async {
  // we need to get json decoded data from the body request - this is json too
  // we should probably have some validation here
  final body = await context.request.json();
  // we are creaing a new note
  // note.fromMap does not requeire initialyl id - this is why we can actually create a note - and then we will just copy it to create new one
  final note =
      Note.fromMap(body).copyWith(id: (fakeNotes.length + 1).toString());

  // adding notes
  fakeNotes = [...fakeNotes, note];

  // and again, we wnat to eturn the updated note
  // but we do need to convert it to a map to sebd it
  // and htnen .json will convert it to json
  return Response.json(body: note.toMap());
}
