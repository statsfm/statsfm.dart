part of statsfm.models;

@JsonSerializable(explicitToJson: true)
class Track extends Object {
  Track();

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
  Map<String, dynamic> toJson() => _$TrackToJson(this);

  /// The Statsfm id for the track.
  @JsonKey(name: 'id', required: true)
  late int id;

  @JsonKey(name: 'name', required: true)
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
  
  ///Preview mp3 url provided by Spotify (Not all tracks have a preview url)
  @JsonKey(name: 'spotifyPreview')
  late String? spotifyPreview;

  @JsonKey(name: 'artists', required: true)
  late List<ArtistSimple> artists;

  @JsonKey(name: 'albums', required: true)
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

  @JsonKey(name: 'endTime', required: true)
  late DateTime endTime;

  @JsonKey(name: 'track', required: true)
  late Track track;
}

@JsonSerializable(explicitToJson: true)
class TopTrack extends TopObject {
  TopTrack();

  factory TopTrack.fromJson(Map<String, dynamic> json) =>
      _$TopTrackFromJson(json);
  Map<String, dynamic> toJson() => _$TopTrackToJson(this);

  @JsonKey(name: 'track', required: true)
  late Track track;
}

@JsonSerializable(explicitToJson: true)
class SwipeTopTrack extends SwipeTopObject {
  SwipeTopTrack();

  factory SwipeTopTrack.fromJson(Map<String, dynamic> json) =>
      _$SwipeTopTrackFromJson(json);
  Map<String, dynamic> toJson() => _$SwipeTopTrackToJson(this);

  @JsonKey(name: 'track', required: true)
  late Track track;
}