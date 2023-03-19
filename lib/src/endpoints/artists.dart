part of statsfm;

class Artists extends EndpointBase {
  @override
  String get _path => 'v1/artists';

  Artists(StatsfmApiBase api) : super(api);

  Future<Artist> get(int artistId) async {
    final Map map = (await dio.get('$_path/$artistId')).data;

    return Artist.fromJson(map['item']);
  }

  Future<List<Artist>> list(Iterable<int> artistIds) async {
    final Map map = (await dio.get('$_path/list', queryParameters: {
      'ids': artistIds.join(','),
    }))
        .data;

    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Artist.fromJson(m)).toList();
  }

  Future<Artist> getSpotify(String artistId) async {
    final Map map = (await dio.get('$_path/$artistId', queryParameters: {
      'type': 'spotify',
    }))
        .data;

    return Artist.fromJson(map['item']);
  }

  Future<List<Artist>> listSpotify(Iterable<String> artistIds) async {
    final Map map = (await dio.get('$_path/list', queryParameters: {
      'type': 'spotify',
      'ids': artistIds.join(','),
    }))
        .data;

    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Artist.fromJson(m)).toList();
  }

  Future<List<Track>> tracks(int artistId) async {
    final Map map = (await dio.get('$_path/$artistId/tracks')).data;

    var topTracks = map['items'] as Iterable<dynamic>;
    return topTracks.map((m) => Track.fromJson(m)).toList();
  }

  Future<List<Track>> topTracks(int artistId) async {
    final Map map = (await dio.get('$_path/$artistId/tracks/top')).data;

    var topTracks = map['items'] as Iterable<dynamic>;
    return topTracks.map((m) => Track.fromJson(m)).toList();
  }

  Future<List<SwipeTopTrack>> topSwipedTracks(int artistId) async {
    final Map map = (await dio.get('$_path/$artistId/swipefy/top/tracks')).data;

    var topTracks = map['items'] as Iterable<dynamic>;
    return topTracks.map((m) => SwipeTopTrack.fromJson(m)).toList();
  }

  Future<List<Album>> albums(int artistId) async {
    final Map map = (await dio.get('$_path/$artistId/albums')).data;

    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Album.fromJson(m)).toList();
  }

  Future<List<Track>> topAlbums(int artistId) async {
    final Map map = (await dio.get('$_path/$artistId/albums/top')).data;

    var topTracks = map['items'] as Iterable<dynamic>;
    return topTracks.map((m) => Track.fromJson(m)).toList();
  }

  Future<List<SwipeTopAlbum>> topSwipedAlbums(int artistId) async {
    final Map map = (await dio.get('$_path/$artistId/swipefy/top/albums')).data;

    var topAlbums = map['items'] as Iterable<dynamic>;
    return topAlbums.map((m) => SwipeTopAlbum.fromJson(m)).toList();
  }

  Future<List<Artist>> related(int artistId) async {
    final Map map = (await dio.get('$_path/$artistId/related')).data;

    var relatedArtists = map['items'] as Iterable<dynamic>;
    return relatedArtists.map((m) => Artist.fromJson(m)).toList();
  }

  Future<List<TopUser>> topListeners(
    int artistId, {
    QueryOptions options = const QueryOptions(),
    bool friends = false,
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/$artistId/top/listeners',
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
}
