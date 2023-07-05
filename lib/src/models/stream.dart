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

  @JsonKey(ignore: true)
  Duration? get played => Duration(milliseconds: this.playedMs);

  @JsonKey(name: 'trackId')
  late int trackId;

  @JsonKey(name: 'trackName')
  late String trackName;

  @JsonKey(name: 'artistIds')
  late List<int> artists;

  @JsonKey(name: 'albumId')
  late int? albumId;

  @JsonKey(name: 'importId')
  late int? importId;
}
