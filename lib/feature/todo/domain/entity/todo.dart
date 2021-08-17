import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo extends Equatable {
  const Todo({required this.label, required this.description});

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  final String label;
  final String description;

  @override
  List<Object?> get props => [label, description];

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
