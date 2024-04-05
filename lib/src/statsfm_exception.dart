part of statsfm;

class ApiRateException extends StatsfmException {
  final num retryAfter;

  ApiRateException.fromStatsfm(StatsfmError error, this.retryAfter)
      : super.fromStatsfm(error);
}
