import 'package:faker/faker.dart';
import 'package:notes_common/notes_common.dart';

final _faker = Faker();

List<Note> fakeNotes = List.generate(
  10,
  (index) => Note(
    id: index.toString(),
    title: _faker.lorem.sentence(),
    // senteces() acuttlly returns a list
    content: _faker.lorem.sentences(5).join(' '),
  ),
);
