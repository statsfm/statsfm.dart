part of statsfm.models;

@JsonSerializable(createToJson: false)
class Track extends Object {
  Track();

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  /// The Statsfm id for the track.
  @JsonKey(name: 'id')
  late int id;

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
  late int? spotifyPopularity;

  @JsonKey(name: 'artists')
  late List<ArtistSimple> artists;

  @JsonKey(name: 'albums')
  late List<AlbumSimple> albums;

  @JsonKey(name: 'externalIds')
  late ExternalIds? externalIds;
}

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class CurrentlyStreamingTrack extends Object {
  CurrentlyStreamingTrack();

  factory CurrentlyStreamingTrack.fromJson(Map<String, dynamic> json) =>
      _$CurrentlyStreamingTrackFromJson(json);

  @JsonKey(name: 'date')
  late DateTime date;

  @JsonKey(name: 'isPlaying', defaultValue: false)
  late bool isPlaying;

  @JsonKey(name: 'progressMs')
  late int progressMs;

  @JsonKey(name: 'deviceName')
  late String? deviceName;

  ///Valid streaming platforms 'spotify' or 'appleMusic'
  @JsonKey(name: 'platform')
  late String platform;

  @JsonKey(name: 'track')
  late Track track;
}

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class RecentlyStreamedTrack extends Object {
  RecentlyStreamedTrack();

  factory RecentlyStreamedTrack.fromJson(Map<String, dynamic> json) =>
      _$RecentlyStreamedTrackFromJson(json);

  @JsonKey(name: 'endTime')
  late DateTime endTime;

  @JsonKey(name: 'track')
  late Track track;
}

@JsonSerializable(createToJson: false)
class TopTrack extends TopObject {
  TopTrack();

  factory TopTrack.fromJson(Map<String, dynamic> json) =>
      _$TopTrackFromJson(json);

  @JsonKey(name: 'track')
  late Track track;
}
