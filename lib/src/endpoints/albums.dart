part of statsfm;

class Albums extends EndpointBase {
  @override
  String get _path => 'v1/albums';

  Albums(StatsfmApiBase api) : super(api);

  Future<Album> get(int albumId) async {
    var jsonString = await _get('$_path/$albumId');
    var map = json.decode(jsonString);

    return Album.fromJson(map['item']);
  }

  Future<List<Album>> list(Iterable<int> albumIds) async {
    var jsonString = await _get('$_path?ids=${albumIds.join(',')}');
    var map = json.decode(jsonString);

    var albumsMap = map['items'] as Iterable<dynamic>;
    return albumsMap.map((m) => Album.fromJson(m)).toList();
  }

  Future<List<Track>> tracks(int albumId) async {
    var jsonString = await _get('$_path/$albumId/tracks');
    var map = json.decode(jsonString);

    var tracksMap = map['items'] as Iterable<dynamic>;
    return tracksMap.map((m) => Track.fromJson(m)).toList();
  }
}
