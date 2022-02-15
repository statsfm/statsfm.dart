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
