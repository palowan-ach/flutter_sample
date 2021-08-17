import 'package:dartz/dartz.dart';
import 'package:flutter_sample/core/error/failure.dart';
import 'package:flutter_sample/core/use_case/use_case.dart';
import 'package:flutter_sample/feature/todo/domain/entity/todo.dart';
import 'package:flutter_sample/feature/todo/domain/repository/todo_repository.dart';

class GetTodoListUseCase extends UseCase<List<Todo>, NoParams> {
  GetTodoListUseCase(this._repository);

  final TodoRepository _repository;

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) {
    return _repository.getTodoList();
  }
}
