part of statsfm.models;

@JsonSerializable(createToJson: false)
class Album extends AlbumSimple {
  Album(); // also tried Album._();

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  @JsonKey(name: 'label')
  late String label;

  @JsonKey(name: 'spotifyPopularity')
  late int spotifyPopularity;

  @JsonKey(name: 'totalTracks')
  late int totalTracks;

  @JsonKey(name: 'releaseDate')
  late DateTime releaseDate;

  @JsonKey(name: 'genres')
  late List<String> genres;

  @JsonKey(name: 'artists')
  late List<ArtistSimple> artists;

  @JsonKey(name: 'externalIds')
  late ExternalIds? externalIds;
}

@JsonSerializable(createToJson: false)
class AlbumSimple extends Object {
  AlbumSimple(); // also tried AlbumSimple._();

  factory AlbumSimple.fromJson(Map<String, dynamic> json) =>
      _$AlbumSimpleFromJson(json);

  /// The Statsfm id for the album.
  @JsonKey(name: 'id')
  late String id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'image')
  late String image;
}
