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
