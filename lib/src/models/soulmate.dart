part of statsfm.models;

@JsonSerializable(createToJson: true)
class Soulmate extends Object {
  Soulmate();

  Map<String, dynamic> toJson() => _$SoulmateToJson(this);

  factory Soulmate.fromJson(Map<String, dynamic> json) =>
      _$SoulmateFromJson(json);

  @JsonKey(name: 'recommendationId', required: true)
  late String recommendationId;

  @JsonKey(name: 'user', required: true)
  late UserPublic user;

  @JsonKey(name: 'artists', required: true)
  late List<TopArtist> artists;
}

@JsonSerializable(createToJson: true)
class SoulmateSwipe extends Object {
  SoulmateSwipe();

  Map<String, dynamic> toJson() => _$SoulmateSwipeToJson(this);

  factory SoulmateSwipe.fromJson(Map<String, dynamic> json) =>
      _$SoulmateSwipeFromJson(json);

  @JsonKey(name: 'recommendationId', required: true)
  late String recommendationId;

  @JsonKey(name: 'decision', required: true)
  late String decision;

  @JsonKey(name: 'decisionMs', defaultValue: -1)
  late int decisionMs;
}

enum SoulmateMatchStatus {
  @JsonValue("LIKE_SENT")
  LIKE_SENT,

  @JsonValue("DISLIKE_SENT")
  DISLIKE_SENT,

  @JsonValue("MATCH")
  MATCH,

  @JsonValue("NO_MATCH")
  NO_MATCH
}