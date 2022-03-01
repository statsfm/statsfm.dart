part of statsfm.models;

@HiveType(typeId: 1)
enum Range {
  @HiveField(0)
  @JsonValue("TODAY")
  TODAY,

  @HiveField(1)
  @JsonValue("DAYS")
  DAYS,

  @HiveField(2)
  @JsonValue("WEEKS")
  WEEKS,

  @HiveField(3)
  @JsonValue("MONTHS")
  MONTHS,

  @HiveField(4)
  @JsonValue("LIFETIME")
  LIFETIME
}
