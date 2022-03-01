part of statsfm;

abstract class StatsfmApiBase {
  static const String _baseUrl = 'https://beta.stats.fm/api';
  // static const String _baseUrl = 'http://10.0.1.63:3000/api';

  bool _shouldWait = false;
  late FutureOr<oauth2.Client> _client;

  late Artists _artists;
  Artists get artists => _artists;

  late Albums _albums;
  Albums get albums => _albums;

  late Charts _charts;
  Charts get charts => _charts;

  late Genres _genres;
  Genres get genres => _genres;

  late Stats _stats;
  Stats get stats => _stats;

  late Tracks _tracks;
  Tracks get tracks => _tracks;

  late Users _users;
  Users get users => _users;

  late Me _me;
  Me get me => _me;

  FutureOr<oauth2.Client> get client => _client;

  StatsfmApiBase.fromClient(FutureOr<http.BaseClient> client) {
    _client = client as FutureOr<oauth2.Client>;

    _artists = Artists(this);
    _albums = Albums(this);
    _charts = Charts(this);
    _genres = Genres(this);
    _stats = Stats(this);
    _tracks = Tracks(this);
    _me = Me(this);
    _users = Users(this);
  }

  StatsfmApiBase.fromAccessToken(String accessToken)
      : this.fromClient(oauth2.Client(oauth2.Credentials(accessToken)));

  Future<String> _get(String path, {Map<String, String> headers = const {}}) {
    return _getImpl('$_baseUrl/$path', headers);
  }

  Future<String> _post(String path, String body,
      {Map<String, String> headers = const {}}) {
    return _postImpl('$_baseUrl/$path', headers, body);
  }

  Future<String> _delete(String path, String body,
      {Map<String, String> headers = const {}}) {
    return _deleteImpl('$_baseUrl/$path', headers, body);
  }

  Future<String> _put(String path, String body,
      {Map<String, String> headers = const {}}) {
    return _putImpl('$_baseUrl/$path', headers, body);
  }

  Future<String> _getImpl(String url, Map<String, String> headers) async {
    return await _requestWrapper(() async =>
        await (await _client).get(Uri.parse(url), headers: headers));
  }

  Future<String> _postImpl(
      String url, Map<String, String> headers, dynamic body) async {
    return await _requestWrapper(() async => await (await _client)
        .post(Uri.parse(url), headers: headers, body: body));
  }

  Future<String> _deleteImpl(
      String url, Map<String, String> headers, body) async {
    return await _requestWrapper(() async {
      final request = http.Request('DELETE', Uri.parse(url));
      request.headers.addAll(headers);
      request.body = body;
      return await http.Response.fromStream(
          await (await _client).send(request));
    });
  }

  Future<String> _putImpl(
      String url, Map<String, String> headers, dynamic body) async {
    return await _requestWrapper(() async => await (await _client)
        .put(Uri.parse(url), headers: headers, body: body));
  }

  Future<String> _requestWrapper(Future<http.Response> Function() request,
      {retryLimit = 5}) async {
    for (var i = 0; i < retryLimit; i++) {
      while (_shouldWait) {
        await Future.delayed(Duration(milliseconds: 500));
      }
      try {
        return handleErrors(await request());
      } on ApiRateException catch (ex) {
        if (i == retryLimit - 1) rethrow;
        print(
            'Statsfm API rate exceeded. waiting for ${ex.retryAfter} seconds');
        _shouldWait = true;
        unawaited(Future.delayed(Duration(seconds: ex.retryAfter.toInt()))
            .then((v) => _shouldWait = false));
      }
    }
    throw StatsfmException(-1, 'Could not complete request');
  }

  String handleErrors(http.Response response) {
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode >= 400) {
      print("-" * 100);
      print(json.decode(responseBody));
      print("-" * 100);
      final jsonMap = json.decode(responseBody);
      final error = StatsfmError.fromJson(jsonMap);
      if (response.statusCode == 429) {
        throw ApiRateException.fromStatsfm(
            error, num.parse(response.headers['retry-after']!));
      }
      throw StatsfmException.fromStatsfm(
        error,
      );
    }
    return responseBody;
  }
}
