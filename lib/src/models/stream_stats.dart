part of statsfm.models;

@JsonSerializable(createToJson: false)
class DateStats extends Object {
  DateStats();

  factory DateStats.fromJson(Map<String, dynamic> json) =>
      _$DateStatsFromJson(json);

  @JsonKey(name: 'hours')
  late Map<int, StreamStats> hours;

  @JsonKey(name: 'weekdays')
  late Map<int, StreamStats> weekDays;

  @JsonKey(name: 'monthdays')
  late Map<int, StreamStats> monthDays;

  @JsonKey(name: 'months')
  late Map<int, StreamStats> months;

  @JsonKey(name: 'years')
  late Map<int, StreamStats> years;
}

@JsonSerializable(createToJson: false)
class ExtendedStreamStats extends StreamStats {
  ExtendedStreamStats();

  factory ExtendedStreamStats.fromJson(Map<String, dynamic> json) =>
      _$ExtendedStreamStatsFromJson(json);

  @JsonKey(name: 'cardinality')
  late ExtendedStreamStatsCardinality cardinality;
}

@JsonSerializable(createToJson: false)
class ExtendedStreamStatsCardinality extends Object {
  ExtendedStreamStatsCardinality();

  factory ExtendedStreamStatsCardinality.fromJson(Map<String, dynamic> json) =>
      _$ExtendedStreamStatsCardinalityFromJson(json);

  @JsonKey(name: 'tracks')
  late int tracks;

  @JsonKey(name: 'artists')
  late int artists;

  @JsonKey(name: 'albums')
  late int albums;
}

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
