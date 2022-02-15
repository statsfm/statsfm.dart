part of statsfm;

class Albums extends EndpointBase {
  @override
  String get _path => 'v1/albums';

  Albums(StatsfmApiBase api) : super(api);

  Future<Album> get(String albumId) async {
    var jsonString = await _get('$_path/$albumId');
    var map = json.decode(jsonString);

    return Album.fromJson(map['item']);
  }

  Future<Iterable<Album>> list(Iterable<int> albumIds) async {
    var jsonString = await _get('$_path?ids=${albumIds.join(',')}');
    var map = json.decode(jsonString);

    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Album.fromJson(m));
  }

  Future<Iterable<Track>> tracks(int albumId) async {
    var jsonString = await _get('$_path/$albumId/tracks');
    var map = json.decode(jsonString);

    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Track.fromJson(m));
  }
}
