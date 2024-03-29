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
  late int decisionMs;

  @JsonKey(name: 'algorithmId')
  late int algorithmId;

  @JsonKey(name: 'track')
  late Track track;

  @JsonKey(name: 'collectionIds', defaultValue: [])
  late List<int> collectionIds;
}

@JsonSerializable(explicitToJson: true)
class SwipeStats extends Object {
  SwipeStats();

  factory SwipeStats.fromJson(Map<String, dynamic> json) =>
      _$SwipeStatsFromJson(json);

  @JsonKey(name: 'decision')
  late SwipeDecision decision;

  @JsonKey(name: 'decisionMs')
  late SwipeDecisionMs decisionMs;

  @JsonKey(name: 'count')
  late int count;

  @JsonKey(name: 'cardinality')
  late SwipeCardinality cardinality;
}

@JsonSerializable(createToJson: true)
class SwipeDecision extends Object {
  SwipeDecision();

  factory SwipeDecision.fromJson(Map<String, dynamic> json) =>
      _$SwipeDecisionFromJson(json);
  Map<String, dynamic> toJson() => _$SwipeDecisionToJson(this);

  @JsonKey(name: 'liked', defaultValue: 0)
  late int liked;

  @JsonKey(name: 'disliked', defaultValue: 0)
  late int disliked;

  @JsonKey(name: 'skips', defaultValue: 0)
  late int skips;
}

@JsonSerializable(createToJson: true)
class SwipeDecisionMs extends Object {
  SwipeDecisionMs();

  factory SwipeDecisionMs.fromJson(Map<String, dynamic> json) =>
      _$SwipeDecisionMsFromJson(json);
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

  factory SwipeCardinality.fromJson(Map<String, dynamic> json) =>
      _$SwipeCardinalityFromJson(json);
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

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class SwipeCollection extends Object {
  SwipeCollection();

  factory SwipeCollection.fromJson(Map<String, dynamic> json) =>
      _$SwipeCollectionFromJson(json);

  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'description')
  late String? description;

  @JsonKey(name: 'image')
  late String? image;

  @JsonKey(name: 'swipeCount')
  late int swipeCount;

  @JsonKey(name: 'public')
  late bool public;

  @JsonKey(name: 'createdAt')
  late DateTime createdAt;

  @JsonKey(name: 'updatedAt')
  late DateTime updatedAt;

  @JsonKey(name: 'spotifySync')
  late SwipeCollectionSpotifySync? spotifySync;

  @JsonKey(name: 'userId')
  late String userId;
}

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class SwipeCollectionSpotifySync extends Object {
  SwipeCollectionSpotifySync();

  factory SwipeCollectionSpotifySync.fromJson(Map<String, dynamic> json) =>
      _$SwipeCollectionSpotifySyncFromJson(json);

  @JsonKey(name: 'collectionId')
  late int collectionId;

  @JsonKey(name: 'spotifyId')
  late String spotifyId;

  @JsonKey(name: 'syncEnabled')
  late bool syncEnabled;

  @JsonKey(name: 'createdAt')
  late DateTime createdAt;

  @JsonKey(name: 'syncedAt')
  late DateTime syncedAt;

  @JsonKey(name: 'userId')
  late String userId;
}

@JsonSerializable(createToJson: false)
class RecommendedSwipe extends Object {
  RecommendedSwipe();

  factory RecommendedSwipe.fromJson(Map<String, dynamic> json) => _$RecommendedSwipeFromJson(json);

  @JsonKey(name: 'swipeId')
  late String id;

  @JsonKey(name: 'recommendationId')
  late String recommendationId;

  @JsonKey(name: 'track')
  late Track track;

  @JsonKey(name: 'metadata')
  late SwipeMetadata? metadata;
}

@JsonSerializable(createToJson: false)
class SwipeMetadata extends Object {
  SwipeMetadata();

  factory SwipeMetadata.fromJson(Map<String, dynamic> json) =>
      _$SwipeMetadataFromJson(json);

  @JsonKey(name: 'createdAt')
  late DateTime? createdAt;
}
