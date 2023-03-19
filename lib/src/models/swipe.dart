part of statsfm.models;

@JsonSerializable(createToJson: false)
class Swipe extends Object {
  Swipe();

  factory Swipe.fromJson(Map<String, dynamic> json) => _$SwipeFromJson(json);

  @JsonKey(name: 'id')
  late String id;

  @JsonKey(name: 'createdAt')
  late DateTime createdAt;

  @JsonKey(name: 'decision')
  late String decision;

  @JsonKey(name: 'decisionMs')
  late  int decisionMs;

  @JsonKey(name: 'algorithmId')
  late int algorithmId;

  @JsonKey(name: 'track')
  late Track track;
}

@JsonSerializable(explicitToJson: true)
class SwipeStats extends Object {
  SwipeStats();

  factory SwipeStats.fromJson(Map<String, dynamic> json) => _$SwipeStatsFromJson(json);

  @JsonKey(name: 'decision')
  late SwipeDecision decision;

  @JsonKey(name: 'decisionMs')
  late SwipeDecisionMs decisionMs;

  @JsonKey(name: 'count')
  late int count;
}

@JsonSerializable(createToJson: true)
class SwipeDecision extends Object {
  SwipeDecision();

  factory SwipeDecision.fromJson(Map<String, dynamic> json) => _$SwipeDecisionFromJson(json);
  Map<String, dynamic> toJson() => _$SwipeDecisionToJson(this);

  @JsonKey(name: 'liked')
  late int liked;

  @JsonKey(name: 'disliked')
  late int disliked;
}

@JsonSerializable(createToJson: true)
class SwipeDecisionMs extends Object {
  SwipeDecisionMs();

  factory SwipeDecisionMs.fromJson(Map<String, dynamic> json) => _$SwipeDecisionMsFromJson(json);
  Map<String, dynamic> toJson() => _$SwipeDecisionMsToJson(this);

  @JsonKey(name: 'min')
  late int? min;

  @JsonKey(name: 'max')
  late int? max;

  @JsonKey(name: 'avg')
  late double? avg;

  @JsonKey(name: 'sum')
  late int sum;

  @JsonKey(ignore: true)
  Duration get duration => Duration(milliseconds: this.sum);
}

@JsonSerializable(createToJson: true)
class SwipeCardinality extends Object {
  SwipeCardinality();

  factory SwipeCardinality.fromJson(Map<String, dynamic> json) => _$SwipeCardinalityFromJson(json);
  Map<String, dynamic> toJson() => _$SwipeCardinalityToJson(this);

  @JsonKey(name: 'tracks')
  late int? tracks;

  @JsonKey(name: 'artists')
  late int? artists;

  @JsonKey(name: 'albums')
  late int? albums;

  @JsonKey(name: 'users')
  late int? users;
}