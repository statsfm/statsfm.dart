part of statsfm.models;

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class Stream extends Object {
  Stream();

  factory Stream.fromJson(Map<String, dynamic> json) => _$StreamFromJson(json);

  @JsonKey(name: 'id', required: true)
  late String id;

  @JsonKey(name: 'userId', required: true)
  late String userId;

  @JsonKey(name: 'endTime')
  late DateTime endTime;

  @JsonKey(name: 'playedMs')
  late int playedMs;

  @JsonKey(includeFromJson: false)
  Duration? get played => Duration(milliseconds: this.playedMs);

  @JsonKey(name: 'trackId', required: true)
  late int trackId;

  @JsonKey(name: 'trackName', required: true)
  late String trackName;

  @JsonKey(name: 'artistIds', required: true)
  late List<int> artists;

  @JsonKey(name: 'albumId')
  late int? albumId;

  @JsonKey(name: 'importId')
  late int? importId;
}
