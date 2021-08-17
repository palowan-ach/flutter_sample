import 'package:dartz/dartz.dart';
import 'package:flutter_sample/core/error/failure.dart';
import 'package:flutter_sample/core/network/network_info.dart';
import 'package:flutter_sample/feature/todo/data/datasource/todo_remote_datasource.dart';
import 'package:flutter_sample/feature/todo/data/model/todo_model.dart';
import 'package:flutter_sample/feature/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  TodoRepositoryImpl({
    required TodoRemoteDataSource remoteDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, List<TodoModel>>> getTodoList() async {
    if (await _networkInfo.isConnected) {
      final todoList = await _remoteDataSource.getTodoList();
      return Right(todoList);
    } else {
      return Left(ConnectionFailure());
    }
  }
}
