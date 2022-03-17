part of statsfm;

abstract class StatsfmApiBase {
  static const String _baseUrl = 'https://beta.stats.fm/api/';

  late String _accessToken;

  Dio _dio = Dio();
  Dio get dio => _dio;

  late Artists _artists;
  Artists get artists => _artists;

  late Albums _albums;
  Albums get albums => _albums;

  late Charts _charts;
  Charts get charts => _charts;

  late Genres _genres;
  Genres get genres => _genres;

  late Search _search;
  Search get search => _search;

  late Stats _stats;
  Stats get stats => _stats;

  late Tracks _tracks;
  Tracks get tracks => _tracks;

  late Users _users;
  Users get users => _users;

  late Me _me;
  Me get me => _me;

  StatsfmApiBase.fromAccessToken(String accessToken) {
    _accessToken = accessToken;

    init();
  }

  void init() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {'Authorization': _accessToken};
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.queryParameters =
          Map<String, dynamic>.from(SplayTreeMap.from(options.queryParameters));
      return handler.next(options);
    }, onResponse: (response, handler) {
      print(
          'DIO: ${response.requestOptions.method} ${response.statusCode} - ${response.requestOptions.uri.toString()}');
      return handler.next(response);
    }));
    _dio.interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(
            maxSize: 52428800,
            maxEntrySize: 5242880,
          ),
          policy: CachePolicy.forceCache,
          maxStale: const Duration(days: 7),
        ),
      ),
    );

    _artists = Artists(this);
    _albums = Albums(this);
    _charts = Charts(this);
    _genres = Genres(this);
    _search = Search(this);
    _stats = Stats(this);
    _tracks = Tracks(this);
    _me = Me(this);
    _users = Users(this);
  }
}
