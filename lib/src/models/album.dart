part of statsfm.models;

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class Album extends AlbumSimple {
  Album();

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  @JsonKey(name: 'label')
  late String? label;

  @JsonKey(name: 'spotifyPopularity')
  late int spotifyPopularity;

  @JsonKey(name: 'totalTracks')
  late int totalTracks;

  @JsonKey(name: 'type')
  late String type;

  @JsonKey(name: 'releaseDate', fromJson: dateTimeFromTimestamp)
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
  AlbumSimple();

  factory AlbumSimple.fromJson(Map<String, dynamic> json) =>
      _$AlbumSimpleFromJson(json);

  /// The Statsfm id for the album.
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'image')
  late String? image;
}

@JsonSerializable(createToJson: false)
class TopAlbum extends TopObject {
  TopAlbum();

  factory TopAlbum.fromJson(Map<String, dynamic> json) =>
      _$TopAlbumFromJson(json);

  @JsonKey(name: 'album')
  late Album album;
}
