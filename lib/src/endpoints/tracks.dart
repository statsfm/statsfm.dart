part of statsfm;

class Tracks extends EndpointBase {
  @override
  String get _path => 'v1/tracks';

  Tracks(StatsfmApiBase api) : super(api);

  Future<Track> get(int trackId) async {
    final Map map = (await dio.get('$_path/$trackId')).data;

    return Track.fromJson(map['item']);
  }

  ///Get tracks linked albums
  Future<List<Album>> albums(int trackId) async {
    final Map map = (await dio.get('$_path/$trackId/albums')).data;
    var albumsMap = map['items'] as Iterable<dynamic>;
    return albumsMap.map((m) => Album.fromJson(m)).toList();
  }

  Future<List<Track>> list(Iterable<int> trackIds) async {
    final Map map = (await dio.get(
      '$_path/list',
      queryParameters: {'ids': trackIds.join(',')},
    ))
        .data;

    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Track.fromJson(m)).toList();
  }

  Future<Track> getSpotify(String trackId) async {
    final Map map = (await dio.get(
      '$_path/$trackId',
      queryParameters: {'type': 'spotify'},
    ))
        .data;

    return Track.fromJson(map['item']);
  }

  Future<List<Track>> listSpotify(Iterable<String> trackIds) async {
    final Map map = (await dio.get('$_path/list', queryParameters: {
      'type': 'spotify',
      'ids': trackIds.join(','),
    }))
        .data;

    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Track.fromJson(m)).toList();
  }

  Future<Map> audioAnalysis(String spotifyTrackId) async {
    final Map map =
        (await dio.get('v1/spotify/audio-analysis/$spotifyTrackId')).data;

    return map;
  }

  Future<AudioFeature> audioFeature(String spotifyTrackId) async {
    final Map map =
        (await dio.get('v1/spotify/audio-features/$spotifyTrackId')).data;

    return AudioFeature.fromJson(map['item']);
  }

  Future<List<AudioFeature>> audioFeatures(
      Iterable<String> spotifyTrackIds) async {
    final Map map = (await dio.get(
      'v1/spotify/audio-features',
      queryParameters: {'ids': spotifyTrackIds.join(',')},
    ))
        .data;

    var audioFeaturesMap = map['items'] as Iterable<dynamic>;
    return audioFeaturesMap.map((m) => AudioFeature.fromJson(m)).toList();
  }

  Future<List<TopUser>> topListeners(int trackId,
      {QueryOptions options = const QueryOptions(),
      bool friends = false}) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/$trackId/top/listeners',
      queryParameters: friends == false
          ? {...query} // for caching
          : {
              'friends': friends,
              ...query,
            },
    ))
        .data;

    var topListeners = map['items'] as Iterable<dynamic>;
    return topListeners.map((m) => TopUser.fromJson(m)).toList();
  }

  ///Gets a tracks Swipefy stats
  Future<SwipeStats> swipefyStats(int trackId) async {
    final Map map = (await dio.get(
      '$_path/$trackId/swipefy/stats',
    ))
        .data;

    return SwipeStats.fromJson(map['items']);
  }
}
