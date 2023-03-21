part of statsfm.models;

@JsonSerializable(createToJson: false)
class SearchResults extends Object {
  SearchResults();

  factory SearchResults.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsFromJson(json);

  @JsonKey(name: 'tracks', defaultValue: [])
  late List<Track> tracks;

  @JsonKey(name: 'artists', defaultValue: [])
  late List<Artist> artists;

  @JsonKey(name: 'albums', defaultValue: [])
  late List<Album> albums;

  @JsonKey(name: 'users', defaultValue: [])
  late List<UserPublic> users;
}

enum SearchType { TRACK, ARTIST, ALBUM, USER }
