abstract class Failure {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  String toString() => '$runtimeType(message: $message)';
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.statusCode});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required super.message});
}
