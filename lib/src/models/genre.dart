part of statsfm.models;

@JsonSerializable(createToJson: false)
class Genre extends GenreSimple {
  Genre();

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  @JsonKey(name: 'artists')
  late List<Artist> artists;

  @JsonKey(name: 'related')
  late List<GenreSimple> related;

  @JsonKey(name: 'sub')
  late List<GenreSimple> sub;
}

@JsonSerializable(createToJson: false)
class GenreSimple extends Object {
  GenreSimple();

  factory GenreSimple.fromJson(Map<String, dynamic> json) =>
      _$GenreSimpleFromJson(json);

  @JsonKey(name: 'tag')
  late String tag;
}
