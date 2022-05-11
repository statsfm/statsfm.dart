part of statsfm;

class Crowns extends EndpointBase {
  @override
  String get _path => 'v1/crowns';

  Crowns(StatsfmApiBase api) : super(api);

  Future<Crown> getArtistCrown(int id) async {
    final Map map = (await dio.get('$_path/artists/$id')).data;

    return Crown.fromJson(map['item']);
  }

  Future<List<Crown>> listArtistCrowns(Iterable<String> tags) async {
    final Map map = (await dio.get(
      '$_path/artists',
      queryParameters: {'ids': tags.join(',')},
    ))
        .data;

    var crownsMap = map['items'] as Iterable<dynamic>;
    return crownsMap.map((m) => Crown.fromJson(m)).toList();
  }

  Future<List<Crown>> artistCrownHistory(int id) async {
    final Map map = (await dio.get(
      '$_path/artists/$id/history',
      queryParameters: {},
    ))
        .data;

    var crownsMap = map['items'] as Iterable<dynamic>;
    return crownsMap.map((m) => Crown.fromJson(m)).toList();
  }
}
