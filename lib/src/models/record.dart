part of statsfm.models;

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class ArtistRecord extends Record {
  ArtistRecord();

  factory ArtistRecord.fromJson(Map<String, dynamic> json) =>
      _$ArtistRecordFromJson(json);

  @JsonKey(name: 'artistId')
  late int artistId;
}

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class Record extends Object {
  Record();

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);

  @JsonKey(name: 'id', required: true)
  late int id;

  @JsonKey(name: 'type')
  late RecordType type;

  @JsonKey(name: 'active', defaultValue: false)
  late bool active;

  @JsonKey(name: 'userId', required: true)
  late String userId;

  @JsonKey(name: 'createdAt', required: true)
  late DateTime createdAt;
}

enum RecordType {
  @JsonValue("PLATINUM")
  PLATINUM,

  @JsonValue("GOLD")
  GOLD,

  @JsonValue("SILVER")
  SILVER,

  @JsonValue("BRONZE")
  BRONZE
}

extension on RecordType {
  int compareTo(RecordType other) => this.index.compareTo(other.index);
}
