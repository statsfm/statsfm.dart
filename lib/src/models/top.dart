part of statsfm.models;

enum Indicator {
  @JsonValue("UP")
  UP,

  @JsonValue("DOWN")
  DOWN,

  @JsonValue("NEW")
  NEW,

  @JsonValue("SAME")
  SAME,

  @JsonValue("NONE")
  NONE,
}

@JsonSerializable(createToJson: false)
class TopObject extends Object {
  TopObject();

  factory TopObject.fromJson(Map<String, dynamic> json) =>
      _$TopObjectFromJson(json);

  @JsonKey(name: 'position')
  late int position;

  @JsonKey(name: 'streams')
  late int? streams;

  @JsonKey(name: 'playedMs')
  int? playedMs;

  @JsonKey(name: 'indicator')
  Indicator? indicator;
}

@JsonSerializable(explicitToJson: true)
class TopSwipeObject extends Object {
  TopSwipeObject();

  factory TopSwipeObject.fromJson(Map<String, dynamic> json) =>
      _$TopSwipeObjectFromJson(json);
  Map<String, dynamic> toJson() => _$TopSwipeObjectToJson(this);

  @JsonKey(name: 'position')
  late int position;

  @JsonKey(name: 'swipes')
  late int swipes;

  @JsonKey(name: 'decision')
  late SwipeDecision decision;

  @JsonKey(name: 'decisionMs')
  late SwipeDecisionMs decisionMs;
}