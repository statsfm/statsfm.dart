part of statsfm.models;

@JsonSerializable(createToJson: false)
class Genre extends GenreSimple {
  Genre();

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  @JsonKey(name: 'tag')
  late String? tag; //TODO: make this non-nullable once added to the production api.

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
  late String? tag;
}

@JsonSerializable(createToJson: false)
class TopGenre extends TopObject {
  TopGenre();

  factory TopGenre.fromJson(Map<String, dynamic> json) =>
      _$TopGenreFromJson(json);

  @JsonKey(name: 'genre')
  late GenreSimple genre;

  @JsonKey(name: 'artistCount')
  late int? artistCount;

  @JsonKey(name: 'previewArtists', defaultValue: <TopArtist> [])
  late List<TopArtist> previewArtists;
}
