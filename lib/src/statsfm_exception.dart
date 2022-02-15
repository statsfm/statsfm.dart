part of statsfm;

class StatsfmException implements Exception {
  int status;
  String message;

  StatsfmException(this.status, this.message);

  StatsfmException.fromStatsfm(StatsfmError error)
      : status = error.status,
        message = error.message;

  @override
  String toString() => 'Error Code: $status\r\n$message';
}

class ApiRateException extends StatsfmException {
  final num retryAfter;

  ApiRateException.fromStatsfm(StatsfmError error, this.retryAfter)
      : super.fromStatsfm(error);
}
