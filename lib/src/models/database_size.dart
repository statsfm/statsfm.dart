part of statsfm.models;

@JsonSerializable(createToJson: false)
class DatabaseSize extends Object {
  DatabaseSize();

  factory DatabaseSize.fromJson(Map<String, dynamic> json) =>
      _$DatabaseSizeFromJson(json);

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
class DatabaseSizeItemCount extends Object {
  DatabaseSizeItemCount();

  factory DatabaseSizeItemCount.fromJson(Map<String, dynamic> json) =>
      _$DatabaseSizeItemCountFromJson(json);

  @JsonKey(name: 'count')
  late int count;

  @JsonKey(name: 'date')
  late DateTime date;
}
