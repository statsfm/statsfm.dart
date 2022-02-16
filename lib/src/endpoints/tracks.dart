part of statsfm;

class Tracks extends EndpointBase {
  @override
  String get _path => 'v1/tracks';

  Tracks(StatsfmApiBase api) : super(api);

  Future<Track> get(int trackId) async {
    var jsonString = await _api._get('$_path/$trackId');
    var map = json.decode(jsonString);

    return Track.fromJson(map['item']);
  }

  Future<List<Track>> list(Iterable<int> trackIds) async {
    var jsonString = await _api._get('$_path/list?ids=${trackIds.join(',')}');
    var map = json.decode(jsonString);
    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Track.fromJson(m)).toList();
  }

  Future<Map> audioAnalysis(String spotifyTrackId) async {
    var jsonString =
        await _api._get('v1/spotify/audio-analysis/$spotifyTrackId');
    var map = json.decode(jsonString);

    return map;
  }

  Future<AudioFeature> audioFeature(String spotifyTrackId) async {
    var jsonString =
        await _api._get('v1/spotify/audio-features/$spotifyTrackId');
    var map = json.decode(jsonString);

    return AudioFeature.fromJson(map['item']);
  }

  Future<List<AudioFeature>> audioFeatures(
      Iterable<String> spotifyTrackIds) async {
    var jsonString = await _api
        ._get('v1/spotify/audio-features?ids=${spotifyTrackIds.join(',')}');
    var map = json.decode(jsonString);

    var audioFeaturesMap = map['items'] as Iterable<dynamic>;
    return audioFeaturesMap.map((m) => AudioFeature.fromJson(m)).toList();
  }
}
