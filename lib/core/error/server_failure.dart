
import 'failure.dart';

/// General remote failures
class ServerFailure extends Failure {
  String? error, errorCode;
  String? message;

  ServerFailure({
    required super.statusCode,
    this.error,
    this.errorCode,
    this.message,
  });

}
