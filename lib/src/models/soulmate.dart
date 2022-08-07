part of statsfm.models;

@JsonSerializable(createToJson: true)
class Soulmate extends Object {
  Soulmate();

  Map<String, dynamic> toJson() => _$SoulmateToJson(this);

  factory Soulmate.fromJson(Map<String, dynamic> json) =>
      _$SoulmateFromJson(json);

  @JsonKey(name: 'score')
  late double score;

  @JsonKey(name: 'user')
  late UserPublic user;
}
