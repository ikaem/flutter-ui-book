import 'package:dio/dio.dart';
import 'package:notes_common/notes_common.dart';

class NoteFacade {
  NoteFacade(this.dio);

  final Dio dio;

  Future<List<Note>> getAll() async {
    // return _notes;
    // return [];
  }

  Future<void> create({required String title, required String content}) async {}
  Future<void> update(
      {required String id,
      required String title,
      required String content}) async {
    // ok, note that we will never bother ui with creating a note
    // we just need it to delever note pieces here - the service will create and update the note
    // also, note that there is no notifying anyhitng
    final note = Note(
      id: id,
      title: title,
      content: content,
    );

// here we can use == because we use equatabloe
    // _notes = _notes.map((e) => e == note ? note : e).toList();
  }

  Future<void> delete({required String id}) async {
    // _notes = _notes.where((element) => element.id != id).toList();
  }
}
