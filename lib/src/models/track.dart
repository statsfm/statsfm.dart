part of statsfm.models;

@JsonSerializable(createToJson: false)
class Track extends Object {
  Track();

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  /// The Statsfm id for the track.
  @JsonKey(name: 'id')
  late String id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'explicit')
  late bool explicit;

  @JsonKey(name: 'durationMs')
  late int durationMs;

  /// The track length
  @JsonKey(ignore: true)
  Duration? get duration => Duration(milliseconds: this.durationMs);

  @JsonKey(name: 'spotifyPopularity')
  late int spotifyPopularity;

  @JsonKey(name: 'artists')
  late List<ArtistSimple> artists;

  @JsonKey(name: 'albums')
  late List<AlbumSimple> albums;

  @JsonKey(name: 'externalIds')
  late ExternalIds? externalIds;
}
