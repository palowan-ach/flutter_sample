import 'package:flutter_sample/feature/todo/data/model/todo_model.dart';

abstract class TodoRemoteDataSource {
  /// Calls GET /todo-list endpoint
  ///
  /// throws [ServerException] for any error
  Future<List<TodoModel>> getTodoList();
}
