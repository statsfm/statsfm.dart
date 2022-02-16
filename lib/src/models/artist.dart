part of statsfm.models;

@JsonSerializable(createToJson: false)
class Artist extends ArtistSimple {
  Artist();

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

  @JsonKey(name: 'followers')
  late int followers;

  @JsonKey(name: 'image')
  late String image;

  @JsonKey(name: 'spotifyPopularity')
  late int spotifyPopularity;

  @JsonKey(name: 'genres')
  late List<String> genres;

  @JsonKey(name: 'externalIds')
  late ExternalIds? externalIds;
}

@JsonSerializable(createToJson: false)
class ArtistSimple extends Object {
  ArtistSimple();

  factory ArtistSimple.fromJson(Map<String, dynamic> json) =>
      _$ArtistSimpleFromJson(json);

  /// The Statsfm id for the artist.
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'name')
  late String name;
}

@JsonSerializable(createToJson: false)
class TopArtist extends TopObject {
  TopArtist();

  factory TopArtist.fromJson(Map<String, dynamic> json) =>
      _$TopArtistFromJson(json);

  @JsonKey(name: 'artist')
  late Artist artist;
}
