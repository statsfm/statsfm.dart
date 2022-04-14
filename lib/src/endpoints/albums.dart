part of statsfm;

class Albums extends EndpointBase {
  @override
  String get _path => 'v1/albums';

  Albums(StatsfmApiBase api) : super(api);

  Future<Album> get(int albumId) async {
    final Map map = (await dio.get('$_path/$albumId')).data;

    return Album.fromJson(map['item']);
  }

  Future<List<Album>> list(Iterable<int> albumIds) async {
    final Map map = (await dio.get('$_path/list', queryParameters: {
      'ids': albumIds.join(','),
    }))
        .data;

    var albumsMap = map['items'] as Iterable<dynamic>;
    return albumsMap.map((m) => Album.fromJson(m)).toList();
  }

  Future<Album> getSpotify(String albumId) async {
    final Map map =
        (await dio.get('$_path/$albumId', queryParameters: {'type': 'spotify'}))
            .data;

    return Album.fromJson(map['item']);
  }

  Future<List<Album>> listSpotify(Iterable<String> albumIds) async {
    final Map map = (await dio.get('$_path/list',
            queryParameters: {'type': 'spotify', 'ids': albumIds.join(',')}))
        .data;

    var albumsMap = map['items'] as Iterable<dynamic>;
    return albumsMap.map((m) => Album.fromJson(m)).toList();
  }

  Future<List<Track>> tracks(int albumId) async {
    final Map map = (await dio.get('$_path/$albumId/tracks')).data;

    var tracksMap = map['items'] as Iterable<dynamic>;
    return tracksMap.map((m) => Track.fromJson(m)).toList();
  }

  Future<List<TopUser>> topListeners(
    int albumId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/$albumId/top/listeners',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var topListeners = map['items'] as Iterable<dynamic>;
    return topListeners.map((m) => TopUser.fromJson(m)).toList();
  }
}
