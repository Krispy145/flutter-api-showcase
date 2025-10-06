import 'package:equatable/equatable.dart';

/// Base class for all failures in the application
abstract class Failure extends Equatable {
  const Failure({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

/// Network-related failures
class NetworkFailure extends Failure {
  const NetworkFailure({super.message});
}

/// Server-related failures
class ServerFailure extends Failure {
  const ServerFailure({super.message});
}

/// Cache-related failures
class CacheFailure extends Failure {
  const CacheFailure({super.message});
}

/// General failures
class GeneralFailure extends Failure {
  const GeneralFailure({super.message});
}
