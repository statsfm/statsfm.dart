part of statsfm;

class Genres extends EndpointBase {
  @override
  String get _path => 'v1/genres';

  Genres(StatsfmApiBase api) : super(api);

  Future<Genre> get(String tag) async {
    var jsonString = await _get('$_path/$tag');
    var map = json.decode(jsonString);

    return Genre.fromJson(map['item']);
  }

  Future<List<Genre>> list(Iterable<String> tags) async {
    var jsonString = await _get('$_path?ids=${tags.join(',')}');
    var map = json.decode(jsonString);

    var genresMap = map['items'] as Iterable<dynamic>;
    return genresMap.map((m) => Genre.fromJson(m)).toList();
  }

  Future<List<Artist>> artists(String tag) async {
    var jsonString = await _get('$_path/$tag/artists');
    var map = json.decode(jsonString);

    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Artist.fromJson(m)).toList();
  }
}
