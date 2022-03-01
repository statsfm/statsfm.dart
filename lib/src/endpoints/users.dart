part of statsfm;

class Users extends EndpointBase {
  @override
  String get _path => 'v1/users';

  Users(StatsfmApiBase api) : super(api);

  Future<UserPublic> get(String userId) async {
    var jsonString = await _api._get('$_path/$userId');
    var map = json.decode(jsonString);

    return UserPublic.fromJson(map['item']);
  }

  Future<UserPrivacySettings> privacySettings(String userId) async {
    final String jsonString = await _api._get('$_path/$userId/privacy');
    var map = json.decode(jsonString);

    return UserPrivacySettings.fromJson(map['item']);
  }

  Future<UserProfile> profile(String userId) async {
    final String jsonString = await _api._get('$_path/$userId/profile');
    var map = json.decode(jsonString);

    return UserProfile.fromJson(map['item']);
  }

  Future<List<Stream>> streams(
    String userId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/streams?$query',
    );
    var map = json.decode(jsonString);

    var streamsMap = map['items'] as Iterable<dynamic>;
    return streamsMap.map((m) => Stream.fromJson(m)).toList();
  }

  Future<ExtendedStreamStats> stats(
    String userId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/streams/stats?$query',
    );
    var map = json.decode(jsonString);

    return ExtendedStreamStats.fromJson(map['items']);
  }

  Future<DateStats> dateStats(
    String userId,
    int timeZoneOffset, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/streams/stats/dates?timeZoneOffset=$timeZoneOffset&$query',
    );
    var map = json.decode(jsonString);

    return DateStats.fromJson(map['items']);
  }

  Future<CurrentlyStreamingTrack?> currentlyStreaming(String userId) async {
    try {
      final String jsonString = await _api._get(
        '$_path/$userId/streams/current',
      );
      var map = json.decode(jsonString);

      return CurrentlyStreamingTrack.fromJson(map['item']);
    } catch (e) {
      return null;
    }
  }

  Future<List<RecentlyStreamedTrack>> recentlyStreamed(String userId) async {
    final String jsonString = await _api._get(
      '$_path/$userId/streams/recent',
    );
    var map = json.decode(jsonString);

    var recentTracksMap = map['items'] as Iterable<dynamic>;
    return recentTracksMap
        .map((m) => RecentlyStreamedTrack.fromJson(m))
        .toList();
  }

  Future<List<Stream>> trackStreams(
    String userId,
    int trackId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/streams/tracks/$trackId?$query',
    );
    var map = json.decode(jsonString);

    var streamsMap = map['items'] as Iterable<dynamic>;
    return streamsMap.map((m) => Stream.fromJson(m)).toList();
  }

  Future<StreamStats> trackStats(
    String userId,
    int trackId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/streams/tracks/$trackId/stats?$query',
    );
    var map = json.decode(jsonString);

    return StreamStats.fromJson(map['items']);
  }

  Future<List<Stream>> trackListStreams(
    String userId,
    Iterable<int> trackIds, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/streams/tracks/list?ids=${trackIds.join(',')}&$query',
    );
    var map = json.decode(jsonString);

    var streamsMap = map['items'] as Iterable<dynamic>;
    return streamsMap.map((m) => Stream.fromJson(m)).toList();
  }

  Future<Map<int, StreamStats>> trackListStats(
    String userId,
    Iterable<int> trackIds, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/streams/tracks/list/stats?ids=${trackIds.join(',')}&$query',
    );
    Map<String, dynamic> list = json.decode(jsonString)['items'];
    Map<int, StreamStats> map = {};
    list.keys.forEach((String key) {
      map[int.parse(key)] = StreamStats.fromJson(list[key]);
    });

    return map;
  }

  Future<List<Stream>> artistStreams(
    String userId,
    int artistId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/streams/artists/$artistId?$query',
    );
    var map = json.decode(jsonString);

    var streamsMap = map['items'] as Iterable<dynamic>;
    return streamsMap.map((m) => Stream.fromJson(m)).toList();
  }

  Future<StreamStats> artistStats(
    String userId,
    int artistId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/streams/artists/$artistId/stats?$query',
    );
    var map = json.decode(jsonString);

    return StreamStats.fromJson(map['items']);
  }

  Future<List<Stream>> albumStreams(
    String userId,
    int albumId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/streams/albums/$albumId?$query',
    );
    var map = json.decode(jsonString);

    var streamsMap = map['items'] as Iterable<dynamic>;
    return streamsMap.map((m) => Stream.fromJson(m)).toList();
  }

  Future<StreamStats> albumStats(
    String userId,
    int albumId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/streams/albums/$albumId/stats?$query',
    );
    var map = json.decode(jsonString);

    return StreamStats.fromJson(map['item']);
  }

  Future<List<TopTrack>> topTracks(
    String userId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/top/tracks?$query',
    );
    var map = json.decode(jsonString);

    var topTracksMap = map['items'] as Iterable<dynamic>;
    return topTracksMap.map((m) => TopTrack.fromJson(m)).toList();
  }

  Future<List<TopArtist>> topArtists(
    String userId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/top/artists?$query',
    );
    var map = json.decode(jsonString);

    var topArtistsMap = map['items'] as Iterable<dynamic>;
    return topArtistsMap.map((m) => TopArtist.fromJson(m)).toList();
  }

  Future<List<TopTrack>> topTracksFromArtist(
    String userId,
    int artistId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/top/artists/$artistId/tracks?$query',
    );
    var map = json.decode(jsonString);

    var topTracksMap = map['items'] as Iterable<dynamic>;
    return topTracksMap.map((m) => TopTrack.fromJson(m)).toList();
  }

  Future<List<TopAlbum>> topAlbumsFromArtist(
    String userId,
    int artistId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/top/artists/$artistId/albums?$query',
    );
    var map = json.decode(jsonString);

    var topAlbumsMap = map['items'] as Iterable<dynamic>;
    return topAlbumsMap.map((m) => TopAlbum.fromJson(m)).toList();
  }

  Future<List<TopAlbum>> topAlbums(
    String userId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/top/albums?$query',
    );
    var map = json.decode(jsonString);

    var topAlbumsMap = map['items'] as Iterable<dynamic>;
    return topAlbumsMap.map((m) => TopAlbum.fromJson(m)).toList();
  }

  Future<List<TopTrack>> topTracksFromAlbum(
    String userId,
    int albumId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/top/albums/$albumId/tracks?$query',
    );
    var map = json.decode(jsonString);

    var topTracksMap = map['items'] as Iterable<dynamic>;
    return topTracksMap.map((m) => TopTrack.fromJson(m)).toList();
  }

  Future<List<TopGenre>> topGenres(
    String userId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final String query = options.toQuery();
    final String jsonString = await _api._get(
      '$_path/$userId/top/genres?$query',
    );
    var map = json.decode(jsonString);

    var topGenresMap = map['items'] as Iterable<dynamic>;
    return topGenresMap.map((m) => TopGenre.fromJson(m)).toList();
  }
}
