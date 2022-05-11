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

  late Crowns _crowns;
  Crowns get crowns => _crowns;

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
    _dio.options.headers = {'Authorization': _accessToken};
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.queryParameters =
          Map<String, dynamic>.from(SplayTreeMap.from(options.queryParameters));
      return handler.next(options);
    }, onResponse: (response, handler) {
      print(
          'DIO: ${response.requestOptions.method} ${response.statusCode} - ${response.requestOptions.uri.toString()}');
      return handler.next(response);
    }, onError: (err, handler) {
      print(
          "DIO: ERROR, URL: ${err.response?.requestOptions.uri.toString()} ERROR: ${err.response?.data}");
      // err = ;
      if (err.response?.data != null) {
        try {
          String message = Map.from(err.response?.data)['message'];
          throw Exception(message);
        } catch (e) {}
      }
      handler.next(err);
      // handler.resolve(
      //   Response(
      //     requestOptions: err.requestOptions,
      //     data: ,
      //     statusCode: err.response!.statusCode,
      //     statusMessage: err.response!.statusMessage,
      //   ),
      // );
    }));
    dio.interceptors.add(
      DioCacheManager(
        CacheConfig(
          baseUrl: "https://api.stats.fm/api/v1",
          skipDiskCache: true,
        ),
      ).interceptor,
    );

    _artists = Artists(this);
    _albums = Albums(this);
    _charts = Charts(this);
    _crowns = Crowns(this);
    _genres = Genres(this);
    _search = Search(this);
    _stats = Stats(this);
    _tracks = Tracks(this);
    _me = Me(this);
    _users = Users(this);
  }
}
