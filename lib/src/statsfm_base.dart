part of statsfm;

abstract class StatsfmApiBase {
  static String _baseUrl = "https://api.stats.fm/api";

  late String _accessToken;

  Dio _dio = Dio();

  Dio get dio => _dio;

  late Artists _artists;
  Artists get artists => _artists;

  late Albums _albums;
  Albums get albums => _albums;

  late Charts _charts;
  Charts get charts => _charts;

  late Records _records;
  Records get records => _records;

  late Genres _genres;
  Genres get genres => _genres;

  late Search _search;
  Search get search => _search;

  late Stats _stats;
  Stats get stats => _stats;

  late Tracks _tracks;
  Tracks get tracks => _tracks;

  late Friends _friends;
  Friends get friends => _friends;

  late Users _users;
  Users get users => _users;

  late Me _me;
  Me get me => _me;

  StatsfmApiBase.fromAccessToken(
    String accessToken, {
    String baseUrl = "https://beta.stats.fm/api",
  }) {
    _accessToken = accessToken;
    _baseUrl = baseUrl;

    init();
  }

  void init() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {
      'Authorization': _accessToken,
      'Connection': 'Keep-Alive'
    };
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters = Map<String, dynamic>.from(
            SplayTreeMap.from(options.queryParameters));
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print(
            'DIO: ${response.requestOptions.method} ${response.statusCode} - ${response.requestOptions.uri.toString()}');
        return handler.next(response);
      },
      onError: (err, handler) {
        print(
            "DIO: ERROR (${err.response?.statusCode}), URL: ${err.response?.requestOptions.uri.toString()} ERROR: ${err.response?.data}");
        if (err.response?.data != null) {
          String message = Map.from(err.response?.data)['message'];
          throw Exception(message);
        }
        handler.next(err);
      },
    ));
    //Dio cache
    getTemporaryDirectory().then((dir) {
      dio.interceptors.add(
        DioCacheInterceptor(
          options: CacheOptions(
            store: HiveCacheStore(
              dir.path,
              hiveBoxName: 'statsfm_dio_cache',
            ),
            policy: CachePolicy.request,
            hitCacheOnErrorExcept: [403],
            keyBuilder: CacheOptions.defaultCacheKeyBuilder,
            allowPostMethod: false,
            maxStale: Duration(hours: 1),
          ),
        ),
      );
    });

    _artists = Artists(this);
    _albums = Albums(this);
    _charts = Charts(this);
    _records = Records(this);
    _genres = Genres(this);
    _search = Search(this);
    _stats = Stats(this);
    _tracks = Tracks(this);
    _me = Me(this);
    _friends = Friends(this);
    _users = Users(this);
  }
}
