import 'package:flutter_sample/feature/todo/domain/entity/todo.dart';

class TodoModel extends Todo {
  const TodoModel({
    required String label,
    required String description,
  }) : super(label: label, description: description);

  factory TodoModel.fromTodo(Todo todo) {
    return TodoModel(label: todo.label, description: todo.description);
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel.fromTodo(Todo.fromJson(json));
  }

  Map<String, dynamic> toJson() => super.toJson();
}
