part of statsfm.models;

@JsonSerializable(createToJson: false)
class PerDayStats extends Object {
  PerDayStats();

  factory PerDayStats.fromJson(Map<String, dynamic> json) =>
      _$PerDayStatsFromJson(json);

  @JsonKey(name: 'average')
  late StreamStatsWithPrecision average;

  @JsonKey(name: 'days')
  late Map<DateTime, StreamStats> days;
}

@JsonSerializable(createToJson: false)
class DateStats extends Object {
  DateStats();

  factory DateStats.fromJson(Map<String, dynamic> json) =>
      _$DateStatsFromJson(json);

  @JsonKey(name: 'hours')
  late Map<int, StreamStats> hours;

  @JsonKey(name: 'weekDays')
  late Map<int, StreamStats> weekDays;

  @JsonKey(name: 'monthDays')
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

  @JsonKey(name: 'durationMs', defaultValue: 0)
  late int durationMs;

  Duration get duration => Duration(milliseconds: durationMs);

  @JsonKey(name: 'count', defaultValue: 0)
  late int count;
}

@JsonSerializable(createToJson: false)
class StreamStatsWithPrecision extends Object {
  StreamStatsWithPrecision();

  factory StreamStatsWithPrecision.fromJson(Map<String, dynamic> json) =>
      _$StreamStatsWithPrecisionFromJson(json);

  @JsonKey(name: 'durationMs', defaultValue: 0)
  late double durationMs;

  Duration get duration => Duration(milliseconds: durationMs.toInt());

  @JsonKey(name: 'count', defaultValue: 0)
  late double count;
}
