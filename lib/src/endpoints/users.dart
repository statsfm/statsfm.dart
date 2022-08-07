part of statsfm;

class Users extends EndpointBase {
  @override
  String get _path => 'v1/users';

  Users(StatsfmApiBase api) : super(api);

  Future<UserPublic> get(String userId) async {
    final Map map =
        (await dio.get('$_path/${Uri.encodeComponent(userId)}')).data;

    return UserPublic.fromJson(map['item']);
  }

  Future<UserPrivacySettings> privacySettings(String userId) async {
    final Map map =
        (await dio.get('$_path/${Uri.encodeComponent(userId)}/privacy')).data;

    return UserPrivacySettings.fromJson(map['item']);
  }

  Future<UserProfile> profile(String userId) async {
    final Map map =
        (await dio.get('$_path/${Uri.encodeComponent(userId)}/profile')).data;

    return UserProfile.fromJson(map['item']);
  }

  Future<List<Stream>> streams(
    String userId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/streams',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var streamsMap = map['items'] as Iterable<dynamic>;
    return streamsMap.map((m) => Stream.fromJson(m)).toList();
  }

  Future<ExtendedStreamStats> stats(
    String userId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/streams/stats',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    return ExtendedStreamStats.fromJson(map['items']);
  }

  Future<DateStats> dateStats(
    String userId,
    int timeZoneOffset, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/streams/stats/dates',
      queryParameters: {
        'timeZoneOffset': timeZoneOffset,
        ...query,
      },
    ))
        .data;

    return DateStats.fromJson(map['items']);
  }

  Future<PerDayStats> perDayStats(
    String userId,
    int timeZoneOffset, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/streams/stats/per-day',
      queryParameters: {
        'timeZoneOffset': timeZoneOffset,
        ...query,
      },
    ))
        .data;

    return PerDayStats.fromJson(map['items']);
  }

  Future<CurrentlyStreamingTrack?> currentlyStreaming(String userId) async {
    try {
      final Map map = (await dio.get(
        '$_path/${Uri.encodeComponent(userId)}/streams/current',
      ))
          .data;

      return CurrentlyStreamingTrack.fromJson(map['item']);
    } catch (e) {
      return null;
    }
  }

  Future<List<RecentlyStreamedTrack>> recentlyStreamed(String userId) async {
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/streams/recent',
    ))
        .data;

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
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/streams/tracks/$trackId',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var streamsMap = map['items'] as Iterable<dynamic>;
    return streamsMap.map((m) => Stream.fromJson(m)).toList();
  }

  Future<StreamStats> trackStats(
    String userId,
    int trackId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/streams/tracks/$trackId/stats',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    return StreamStats.fromJson(map['items']);
  }

  Future<List<Stream>> trackListStreams(
    String userId,
    Iterable<int> trackIds, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/streams/tracks/list',
      queryParameters: {
        'ids': trackIds.join(','),
        ...query,
      },
    ))
        .data;

    var streamsMap = map['items'] as Iterable<dynamic>;
    return streamsMap.map((m) => Stream.fromJson(m)).toList();
  }

  Future<Map<int, StreamStats>> trackListStats(
    String userId,
    Iterable<int> trackIds, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/streams/tracks/list/stats',
      queryParameters: {
        'ids': trackIds.join(','),
        ...query,
      },
    ))
        .data;
    Map<String, dynamic> list = map['items'];
    Map<int, StreamStats> mapped = {};
    list.keys.forEach((String key) {
      mapped[int.parse(key)] = StreamStats.fromJson(list[key]);
    });

    return mapped;
  }

  Future<List<Stream>> artistStreams(
    String userId,
    int artistId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/streams/artists/$artistId',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var streamsMap = map['items'] as Iterable<dynamic>;
    return streamsMap.map((m) => Stream.fromJson(m)).toList();
  }

  Future<StreamStats> artistStats(
    String userId,
    int artistId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/streams/artists/$artistId/stats',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    return StreamStats.fromJson(map['items']);
  }

  Future<List<Stream>> albumStreams(
    String userId,
    int albumId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/streams/albums/$albumId',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var streamsMap = map['items'] as Iterable<dynamic>;
    return streamsMap.map((m) => Stream.fromJson(m)).toList();
  }

  Future<StreamStats> albumStats(
    String userId,
    int albumId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/streams/albums/$albumId/stats',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    return StreamStats.fromJson(map['item']);
  }

  Future<List<TopTrack>> topTracks(
    String userId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/top/tracks',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var topTracksMap = map['items'] as Iterable<dynamic>;
    return topTracksMap.map((m) => TopTrack.fromJson(m)).toList();
  }

  Future<List<TopArtist>> topArtists(
    String userId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/top/artists',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var topArtistsMap = map['items'] as Iterable<dynamic>;
    return topArtistsMap.map((m) => TopArtist.fromJson(m)).toList();
  }

  Future<List<TopTrack>> topTracksFromArtist(
    String userId,
    int artistId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/top/artists/$artistId/tracks',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var topTracksMap = map['items'] as Iterable<dynamic>;
    return topTracksMap.map((m) => TopTrack.fromJson(m)).toList();
  }

  Future<List<TopAlbum>> topAlbumsFromArtist(
    String userId,
    int artistId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/top/artists/$artistId/albums',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var topAlbumsMap = map['items'] as Iterable<dynamic>;
    return topAlbumsMap.map((m) => TopAlbum.fromJson(m)).toList();
  }

  Future<List<TopAlbum>> topAlbums(
    String userId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/top/albums',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var topAlbumsMap = map['items'] as Iterable<dynamic>;
    return topAlbumsMap.map((m) => TopAlbum.fromJson(m)).toList();
  }

  Future<List<TopTrack>> topTracksFromAlbum(
    String userId,
    int albumId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/top/albums/$albumId/tracks',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var topTracksMap = map['items'] as Iterable<dynamic>;
    return topTracksMap.map((m) => TopTrack.fromJson(m)).toList();
  }

  Future<List<TopGenre>> topGenres(
    String userId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/top/genres',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var topGenresMap = map['items'] as Iterable<dynamic>;
    return topGenresMap.map((m) => TopGenre.fromJson(m)).toList();
  }

  Future<List<ArtistCrown>> artistCrowns(String userId) async {
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/crowns/artists',
      queryParameters: {},
    ))
        .data;

    var crownsMap = map['items'] as Iterable<dynamic>;
    return crownsMap.map((m) => ArtistCrown.fromJson(m)).toList();
  }

  Future<List<UserPublic>> friends(
    String userId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/${Uri.encodeComponent(userId)}/friends',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var friendsMap = map['items'] as Iterable<dynamic>;
    return friendsMap.map((m) => UserPublic.fromJson(m)).toList();
  }

  Future<int> friendCount(String userId) async {
    final Map map =
        (await dio.get('$_path/${Uri.encodeComponent(userId)}/friends/count'))
            .data;

    return map['item'];
  }
}
