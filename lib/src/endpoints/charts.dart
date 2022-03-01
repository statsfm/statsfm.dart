part of statsfm;

class Charts extends EndpointBase {
  @override
  String get _path => 'v1/charts';

  Charts(StatsfmApiBase api) : super(api);

  Future<List<TopTrack>> topTracks({
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/top/tracks?$query',
    );
    var map = json.decode(jsonString);

    var topTracksMap = map['items'] as Iterable<dynamic>;
    return topTracksMap.map((m) => TopTrack.fromJson(m)).toList();
  }

  Future<List<TopArtist>> topArtists({
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/top/artists?$query',
    );
    var map = json.decode(jsonString);

    var topArtistsMap = map['items'] as Iterable<dynamic>;
    return topArtistsMap.map((m) => TopArtist.fromJson(m)).toList();
  }

  Future<List<TopAlbum>> topAlbums({
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/top/albums?$query',
    );
    var map = json.decode(jsonString);

    var topAlbumsMap = map['items'] as Iterable<dynamic>;
    return topAlbumsMap.map((m) => TopAlbum.fromJson(m)).toList();
  }
}
