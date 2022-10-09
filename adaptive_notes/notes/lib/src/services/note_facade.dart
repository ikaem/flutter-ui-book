import 'package:dio/dio.dart';
import 'package:notes_common/notes_common.dart';

class NoteFacade {
  NoteFacade(this.dio);

  final Dio dio;

  Future<List<Note>> getAll() async {
    // return _notes;
    // return [];

    // final response = await dio.get("/notes");

    // final data = response.data;

    // final List<dynamic> json = jsonDecode(data);

    // final notes = json.map((e) {
    //   return Note.fromMap(e);
    // }).toList();

    // b the book
    final response = await dio.get<List<dynamic>>("notes");

    final data = response.data;
    // this is cool, because we dont necessarily have the data - we should probably try await this
    // note here that we cast i guess each element?
    // this is cool - we do cast this each element inside -. all other elements added to it have to be of this type
    final notes = data?.cast<Map<String, dynamic>>().map((e) {
          return Note.fromMap(e);
        }).toList() ??
        [];

    return notes;
  }

  Future<void> create({required String title, required String content}) async {
    await dio.post("/notes", data: {
      "title": title,
      "content": content,
    });
  }

  Future<void> update(
      {required String id,
      required String title,
      required String content}) async {
    // ok, note that we will never bother ui with creating a note
    // we just need it to delever note pieces here - the service will create and update the note
    // also, note that there is no notifying anyhitng
    // final note = Note(
    //   id: id,
    //   title: title,
    //   content: content,
    // );

// here we can use == because we use equatabloe
    // _notes = _notes.map((e) => e == note ? note : e).toList();

    await dio.put("/notes/$id", data: {
      "title": title,
      "content": content,
    });
  }

  Future<void> delete({required String id}) async {
    // _notes = _notes.where((element) => element.id != id).toList();

    await dio.delete("/notes/$id");
  }
}
