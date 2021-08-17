import 'package:dartz/dartz.dart';
import 'package:flutter_sample/core/error/exception.dart';
import 'package:flutter_sample/core/error/failure.dart';
import 'package:flutter_sample/core/network/network_info.dart';
import 'package:flutter_sample/feature/todo/data/datasource/todo_remote_datasource.dart';
import 'package:flutter_sample/feature/todo/data/model/todo_model.dart';
import 'package:flutter_sample/feature/todo/data/repository/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'todo_repository_test.mocks.dart';

@GenerateMocks([TodoRemoteDataSource, NetworkInfo])
void main() {
  late MockTodoRemoteDataSource mockTodoRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late TodoRepositoryImpl repository;

  setUp(() {
    mockTodoRemoteDataSource = MockTodoRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = TodoRepositoryImpl(
      remoteDataSource: mockTodoRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getTodoList', () {
    const tTodoList = [TodoModel(label: 'label', description: 'description')];

    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      // act
      await repository.getTodoList();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    test(
      'should return [ConnectionFailure] when the device is not '
      'connected to internet',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repository.getTodoList();
        // assert
        expect(result, Left(ConnectionFailure()));
      },
    );

    test(
        'should return a list of [TodoModel] objects when the remote '
        'data source call is successful', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        mockTodoRemoteDataSource.getTodoList(),
      ).thenAnswer((_) async => tTodoList);
      // act
      final result = await repository.getTodoList();
      // assert
      expect(result, Right(tTodoList));
    });

    test(
      'should return [ServerFailure] when the remote data source call fails',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          mockTodoRemoteDataSource.getTodoList(),
        ).thenThrow(ServerException());
        // act
        final result = await repository.getTodoList();
        // assert
        expect(result, Left(ServerFailure()));
      },
    );
  });
}
