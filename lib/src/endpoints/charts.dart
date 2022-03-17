part of statsfm;

class Charts extends EndpointBase {
  @override
  String get _path => 'v1/charts';

  Charts(StatsfmApiBase api) : super(api);

  Future<List<TopTrack>> topTracks({
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/top/tracks',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var topTracksMap = map['items'] as Iterable<dynamic>;
    return topTracksMap.map((m) => TopTrack.fromJson(m)).toList();
  }

  Future<List<TopArtist>> topArtists({
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/top/artists',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var topArtistsMap = map['items'] as Iterable<dynamic>;
    return topArtistsMap.map((m) => TopArtist.fromJson(m)).toList();
  }

  Future<List<TopAlbum>> topAlbums({
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/top/albums',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var topAlbumsMap = map['items'] as Iterable<dynamic>;
    return topAlbumsMap.map((m) => TopAlbum.fromJson(m)).toList();
  }
}
