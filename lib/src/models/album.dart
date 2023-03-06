part of statsfm.models;

@JsonSerializable(explicitToJson: true)
@LocalDateTimeConverter()
class Album extends AlbumSimple {
  Album();

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);

  @JsonKey(name: 'label')
  late String? label;

  @JsonKey(name: 'spotifyPopularity')
  late int spotifyPopularity;

  @JsonKey(name: 'totalTracks')
  late int totalTracks;

  @JsonKey(name: 'type')
  late String type;

  @JsonKey(name: 'releaseDate', fromJson: dateTimeFromTimestamp, toJson: dateTimeToTimestamp)
  late DateTime releaseDate;

  @JsonKey(name: 'genres')
  late List<String> genres;

  @JsonKey(name: 'artists')
  late List<ArtistSimple> artists;

  @JsonKey(name: 'externalIds')
  late ExternalIds? externalIds;
}

@JsonSerializable(createToJson: true)
class AlbumSimple extends Object {
  AlbumSimple();

  factory AlbumSimple.fromJson(Map<String, dynamic> json) =>
      _$AlbumSimpleFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumSimpleToJson(this);

  /// The Statsfm id for the album.
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'image')
  late String? image;
}

@JsonSerializable(explicitToJson: true)
class TopAlbum extends TopObject {
  TopAlbum();

  factory TopAlbum.fromJson(Map<String, dynamic> json) =>
      _$TopAlbumFromJson(json);
  Map<String, dynamic> toJson() => _$TopAlbumToJson(this);

  @JsonKey(name: 'album')
  late Album album;
}
