part of statsfm;

class Genres extends EndpointBase {
  @override
  String get _path => 'v1/genres';

  Genres(StatsfmApiBase api) : super(api);

  Future<Genre> get(String tag) async {
    final Map map = (await dio.get('$_path/$tag')).data;

    return Genre.fromJson(map['item']);
  }

  Future<List<Genre>> list(Iterable<String> tags) async {
    final Map map = (await dio.get(
      '$_path',
      queryParameters: {'ids': tags.join(',')},
    ))
        .data;

    var genresMap = map['items'] as Iterable<dynamic>;
    return genresMap.map((m) => Genre.fromJson(m)).toList();
  }

  Future<List<Artist>> artists(String tag) async {
    final Map map = (await dio.get('$_path/$tag/artists')).data;

    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Artist.fromJson(m)).toList();
  }
}
