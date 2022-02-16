part of statsfm.models;

@JsonSerializable(createToJson: false)
class StreamStats extends Object {
  StreamStats();

  factory StreamStats.fromJson(Map<String, dynamic> json) =>
      _$StreamStatsFromJson(json);

  @JsonKey(name: 'durationMs')
  late int durationMs;

  Duration get duration => Duration(milliseconds: durationMs);

  @JsonKey(name: 'count')
  late int count;
}
