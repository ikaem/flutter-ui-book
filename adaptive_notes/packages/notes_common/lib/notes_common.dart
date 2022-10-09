import 'dart:convert';

import 'package:equatable/equatable.dart';

class Note extends Equatable {
  const Note({
    required this.id,
    required this.title,
    required this.content,
  });

  final String id;
  final String title;
  final String content;

  @override
  List<Object?> get props => [
        id,
        title,
        content,
      ];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "content": content,
    };
  }

  String toJson() {
    // we just need to encode to map - because map will create object
    // event though we use map, it will still accpet the map too
    final map = toMap();
    final json = jsonEncode(map);

    return json;
  }

  // why is this cactor
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map["id"] ?? "",
      title: map["title"] ?? "",
      content: map["content"] ?? "",
    );
  }

  factory Note.fromJson(String source) {
    // ok, so we have to convert string to object
    final Map<String, dynamic> json = jsonDecode(source);

    return Note.fromMap(json);
  }

  Note copyWith({
    String? id,
    String? title,
    String? content,
  }) {
    return Note(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content);
  }
}
