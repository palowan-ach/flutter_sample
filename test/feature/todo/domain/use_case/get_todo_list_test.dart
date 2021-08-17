import 'package:dartz/dartz.dart';
import 'package:flutter_sample/core/use_case/use_case.dart';
import 'package:flutter_sample/feature/todo/domain/entity/todo.dart';
import 'package:flutter_sample/feature/todo/domain/repository/todo_repository.dart';
import 'package:flutter_sample/feature/todo/domain/use_case/get_todo_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_todo_list_test.mocks.dart';

@GenerateMocks([TodoRepository])
void main() {
  late MockTodoRepository mockTodoRepository;
  late GetTodoListUseCase useCase;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    useCase = GetTodoListUseCase(mockTodoRepository);
  });

  const tTodoList = [Todo(label: 'SomeLabel', description: 'SomeDescription')];
  test('should forward the call to the repository', () async {
    // arrange
    when(
      mockTodoRepository.getTodoList(),
    ).thenAnswer((_) async => Right(tTodoList));
    // act
    await useCase(NoParams());
    // assert
    verify(mockTodoRepository.getTodoList());
  });
}
