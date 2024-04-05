part of statsfm.models;

@JsonSerializable(createToJson: false)
class StatsfmError extends Object {
  StatsfmError();

  factory StatsfmError.fromJson(Map<String, dynamic> json) =>
      _$StatsfmErrorFromJson(json);

  /// The HTTP status code (also returned in the response header; see Response
  /// Status Codes for more information).
  @JsonKey(name: 'status')
  late int status;

  /// The path of the request.
  @JsonKey(name: 'path')
  late String path;

  /// A short description of the cause of the error.
  @JsonKey(name: 'message')
  late String message;
}


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
