import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResourceNotFoundFailure extends Failure {}

class RequestFailure extends Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class ConnectionFailure extends Failure {}

class InvalidFormatFailure extends Failure {}
