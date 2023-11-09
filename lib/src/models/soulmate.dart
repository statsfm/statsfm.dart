part of statsfm.models;

@JsonSerializable(createToJson: true)
class Soulmate extends Object {
  Soulmate();

  Map<String, dynamic> toJson() => _$SoulmateToJson(this);

  factory Soulmate.fromJson(Map<String, dynamic> json) =>
      _$SoulmateFromJson(json);

  @JsonKey(name: 'score', required: true)
  late double score;

  @JsonKey(name: 'user', required: true)
  late UserPublic user;

  @JsonKey(name: 'artists')
  late List<TopArtist>? artists;
}
