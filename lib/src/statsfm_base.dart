part of statsfm;

abstract class StatsfmApiBase {
  static String _baseUrl = "https://api.stats.fm/api";

  late String _accessToken;

  Dio _dio = Dio(
    BaseOptions(
      receiveTimeout: Duration(seconds: 50),
    ),
  );
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

  late Private _private;
  Private get private => _private;

  late Auth _auth;
  Auth get auth => _auth;

  late Reports _reports;
  Reports get reports => _reports;

  late CacheOptions _cacheOptions;

  Talker? _talker;

  StatsfmApiBase.fromAccessToken(
    String accessToken, {
    String baseUrl = "https://staging-api.stats.fm/api",
    Talker? talker = null,
  }) {
    _accessToken = accessToken;
    _baseUrl = baseUrl;
    _talker = talker;
  }

  Future<void> init() async {
    _printMessage('Setting up stats.fm SDK');
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {
      'Authorization': _accessToken,
    };

    // Global options
    await getApplicationCacheDirectory().then(
      (value) async {
        _cacheOptions = CacheOptions(
          store: DbCacheStore(
            databasePath: value.path,
            databaseName: 'statsfm_sdk_cache',
          ),
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

    final myStatuses = {400, 409, 522, 523, 524, 525, 527, 598, 599};

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
        //Setup talker
        if (_talker != null)
          TalkerDioLogger(
            talker: _talker,
            settings: const TalkerDioLoggerSettings(
              printRequestHeaders: false,
              printResponseHeaders: false,
              printResponseMessage: true,
              printRequestData: false,
              printResponseData: false,
            ),
          ),
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.queryParameters = Map<String, dynamic>.from(
                SplayTreeMap.from(options.queryParameters));
            return handler.next(options);
          },
          onResponse: (response, handler) {
            return handler.next(response);
          },
          onError: (err, handler) {
            if (err.response?.data is Map) {
              throw StatsfmException(
                err.response!.data['status'] ?? 500,
                err.response!.data['message'] ?? err.response!.data.toString(),
              );
            } else if (err.response != null) {
              throw StatsfmException(err.response!.statusCode ?? 400,
                  err.response!.data.toString());
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
    _reports = Reports(this);
    _genres = Genres(this);
    _private = Private(this);
    _search = Search(this);
    _stats = Stats(this);
    _tracks = Tracks(this);
    _me = Me(this);
    _users = Users(this);

    _printMessage('Finished setup of stats.fm SDK');
  }

  ///Dispose needs to be called before StatsfmApi.fromAccessToken is set again
  void dispose() {
    try {
      if (_cacheOptions.store != null) {
        _cacheOptions.store!.close();
        _printMessage('Disposed stats.fm SDK');
      }
    } catch (e) {
      _printMessage('stats.fm SDK startup check ok');
    }
  }

  void _printMessage(String string) {
    if (_talker != null) {
      _talker!.info(
        string
      );
    }
  }
}
