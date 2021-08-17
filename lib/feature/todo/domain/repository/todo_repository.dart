import 'package:dartz/dartz.dart';
import 'package:flutter_sample/core/error/failure.dart';
import 'package:flutter_sample/feature/todo/domain/entity/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getTodoList();
}
