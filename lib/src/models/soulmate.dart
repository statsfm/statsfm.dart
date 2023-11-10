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
