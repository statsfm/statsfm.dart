part of statsfm.models;

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class ArtistCrown extends Crown {
  ArtistCrown();

  factory ArtistCrown.fromJson(Map<String, dynamic> json) =>
      _$ArtistCrownFromJson(json);

  @JsonKey(name: 'artistId')
  late int artistId;
}

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class Crown extends Object {
  Crown();

  factory Crown.fromJson(Map<String, dynamic> json) => _$CrownFromJson(json);

  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'type')
  late CrownType type;

  @JsonKey(name: 'active')
  late bool active;

  @JsonKey(name: 'userId')
  late String userId;

  @JsonKey(name: 'createdAt')
  late DateTime createdAt;
}

enum CrownType {
  @JsonValue("PLATINUM")
  PLATINUM,

  @JsonValue("GOLD")
  GOLD,

  @JsonValue("SILVER")
  SILVER,

  @JsonValue("BRONZE")
  BRONZE
}

extension on CrownType {
  int compareTo(CrownType other) => this.index.compareTo(other.index);
}
