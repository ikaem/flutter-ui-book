import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  // how can this always be a constant - i guess it could always be a constant if we pass it constant data
  // so in a widget maybe we can be passing constant data too
  const Todo({
    required this.id,
    required this.task,
    this.complete = false,
  });

  final int id;
  final String task;
  final bool complete;

// this is equatable part, to make sure we can make sure objects are equal by values, and not by reference
  @override
  List<Object> get props => [complete, id, task];

  Todo copyWith({
    int? id,
    String? task,
    bool? complete,
  }) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      complete: complete ?? this.complete,
    );
  }
}
