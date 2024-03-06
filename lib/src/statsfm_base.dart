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

  late Users _users;
  Users get users => _users;

  late Me _me;
  Me get me => _me;

  late Auth _auth;
  Auth get auth => _auth;

  late CacheOptions _cacheOptions;

  StatsfmApiBase.fromAccessToken(
    String accessToken, {
    String baseUrl = "https://beta.stats.fm/api",
  }) {
    _accessToken = accessToken;
    _baseUrl = baseUrl;
  }

  Future<void> init() async {
    print('SFM: Setting up SDK');
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {
      'Authorization': _accessToken,
    };

    // Global options
    await getApplicationCacheDirectory().then(
      (value) async {
        _cacheOptions = CacheOptions(
          store: IsarCacheStore(value.path, name: 'statsfm_sdk_cache'),
          policy: CachePolicy.request,
          hitCacheOnErrorExcept: [400, 401, 403, 500, 526],
          maxStale: const Duration(hours: 2),
          priority: CachePriority.normal,
          keyBuilder: (RequestOptions request) {
            Map<String, List<String>> queryParams =
                request.uri.queryParametersAll;

            // Sort the query parameters alphabetically
            var sortedParams =
                SplayTreeMap<String, List<String>>.from(queryParams);

            // Reconstruct the URI with sorted query parameters
            Uri sortedUri = request.uri.replace(queryParameters: sortedParams);
            return sortedUri.toString();
          },
          allowPostMethod: false,
        );
      },
    );

    final myStatuses = { 400, 409, 522, 523, 524 , 525, 527, 598, 599};

    dio.interceptors.addAll(
      [
        DioCacheInterceptor(options: _cacheOptions),
        RetryInterceptor(
          dio: dio,
          retries: 3, // retry count
          retryEvaluator: DefaultRetryEvaluator(myStatuses).evaluate,
          retryDelays: const [
            Duration(seconds: 1), // wait 1 sec before first retry
            Duration(seconds: 2), // wait 2 sec before second retry
            Duration(seconds: 3), // wait 3 sec before third retry
          ],
        ),
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.queryParameters = Map<String, dynamic>.from(
                SplayTreeMap.from(options.queryParameters));
            return handler.next(options);
          },
          onResponse: (response, handler) {
            print(
                'SFM: ${response.requestOptions.method} ${response.statusCode} - ${response.requestOptions.uri.toString()}');
            return handler.next(response);
          },
          onError: (err, handler) {
            print(
                "SFM: ERROR (${err.response?.statusCode}), URL: ${err.response?.requestOptions.uri.toString()} ERROR: ${err.response?.data}");
            if (err.response?.data != null) {
              String message = Map.from(err.response?.data)['message'];
              throw Exception(message);
            }
            handler.next(err);
          },
        ),
      ],
    );

    _artists = Artists(this);
    _auth = Auth(this);
    _albums = Albums(this);
    _charts = Charts(this);
    _records = Records(this);
    _genres = Genres(this);
    _search = Search(this);
    _stats = Stats(this);
    _tracks = Tracks(this);
    _me = Me(this);
    _users = Users(this);

    print('SFM: Finished setup');
  }

  ///Dispose needs to be called before statsfm.StatsfmApi.fromAccessToken is set again
  void dispose() {
    try {
      if (_cacheOptions.store != null) {
        _cacheOptions.store!.close();
        print('SFM: disposed SDK');
      }
    } catch (e) {
      print('SFM: nothing to dispose');
    }
  }
}
