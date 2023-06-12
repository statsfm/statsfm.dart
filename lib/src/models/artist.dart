part of statsfm.models;

@JsonSerializable(explicitToJson: true)
class Artist extends ArtistSimple {
  Artist();

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistToJson(this);

  @JsonKey(name: 'followers', defaultValue: 0)
  late int followers;

  @JsonKey(name: 'image')
  late String? image;

  @JsonKey(name: 'spotifyPopularity')
  late int spotifyPopularity;

  @JsonKey(name: 'genres')
  late List<String> genres;

  @JsonKey(name: 'externalIds')
  late ExternalIds? externalIds;
}

@JsonSerializable(createToJson: true)
class ArtistSimple extends Object {
  ArtistSimple();

  factory ArtistSimple.fromJson(Map<String, dynamic> json) =>
      _$ArtistSimpleFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistSimpleToJson(this);

  /// The Statsfm id for the artist.
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'name')
  late String name;
}

@JsonSerializable(explicitToJson: true)
class TopArtist extends TopObject {
  TopArtist();

  factory TopArtist.fromJson(Map<String, dynamic> json) =>
      _$TopArtistFromJson(json);
  Map<String, dynamic> toJson() => _$TopArtistToJson(this);

  @JsonKey(name: 'artist')
  late Artist artist;
}

@JsonSerializable(explicitToJson: true)
class SwipeTopArtist extends SwipeTopObject {
  SwipeTopArtist();

  factory SwipeTopArtist.fromJson(Map<String, dynamic> json) =>
      _$SwipeTopArtistFromJson(json);
  Map<String, dynamic> toJson() => _$SwipeTopArtistToJson(this);

  @JsonKey(name: 'artist')
  late Artist artist;
}