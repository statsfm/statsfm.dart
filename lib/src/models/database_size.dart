part of statsfm.models;

@JsonSerializable(createToJson: false)
class DatabaseSizeStatsfm extends Object {
  DatabaseSizeStatsfm();

  factory DatabaseSizeStatsfm.fromJson(Map<String, dynamic> json) =>
      _$DatabaseSizeStatsfmFromJson(json);

  @JsonKey(name: 'users')
  late DatabaseSizeItem users;

  @JsonKey(name: 'plusUsers')
  late DatabaseSizeItem plusUsers;

  @JsonKey(name: 'streams')
  late DatabaseSizeItem streams;

  @JsonKey(name: 'tracks')
  late DatabaseSizeItem tracks;

  @JsonKey(name: 'artists')
  late DatabaseSizeItem artists;

  @JsonKey(name: 'albums')
  late DatabaseSizeItem albums;
}

@JsonSerializable(createToJson: false)
class DatabaseSizeSwipefy extends Object {
  DatabaseSizeSwipefy();

  factory DatabaseSizeSwipefy.fromJson(Map<String, dynamic> json) =>
      _$DatabaseSizeSwipefyFromJson(json);

  @JsonKey(name: 'users')
  late DatabaseSizeItem users;

  @JsonKey(name: 'proUsers')
  late DatabaseSizeItem proUsers;

  @JsonKey(name: 'swipes')
  late DatabaseSizeItem swipes;

  @JsonKey(name: 'tracks')
  late DatabaseSizeItem tracks;

  @JsonKey(name: 'artists')
  late DatabaseSizeItem artists;

  @JsonKey(name: 'albums')
  late DatabaseSizeItem albums;
}

@JsonSerializable(createToJson: false)
class DatabaseSizeItem extends Object {
  DatabaseSizeItem();

  factory DatabaseSizeItem.fromJson(Map<String, dynamic> json) =>
      _$DatabaseSizeItemFromJson(json);

  @JsonKey(name: 'current')
  late DatabaseSizeItemCount current;

  @JsonKey(name: 'previous')
  late DatabaseSizeItemCount previous;
}

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class DatabaseSizeItemCount extends Object {
  DatabaseSizeItemCount();

  factory DatabaseSizeItemCount.fromJson(Map<String, dynamic> json) =>
      _$DatabaseSizeItemCountFromJson(json);

  @JsonKey(name: 'count')
  late int count;

  @JsonKey(name: 'date')
  late DateTime date;
}
