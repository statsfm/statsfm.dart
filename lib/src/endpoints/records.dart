part of statsfm;

class Records extends EndpointBase {
  @override
  String get _path => 'v1/records';

  Records(StatsfmApiBase api) : super(api);

  Future<Record> getArtistRecord(int id) async {
    final Map map = (await dio.get('$_path/artists/$id')).data;

    return Record.fromJson(map['item']);
  }

  Future<List<Record>> listArtistRecords(Iterable<String> tags) async {
    final Map map = (await dio.get(
      '$_path/artists',
      queryParameters: {'ids': tags.join(',')},
    ))
        .data;

    var recordsMap = map['items'] as Iterable<dynamic>;
    return recordsMap.map((m) => Record.fromJson(m)).toList();
  }

  Future<List<Record>> artistRecordHistory(int id) async {
    final Map map = (await dio.get(
      '$_path/artists/$id/history',
      queryParameters: {},
    ))
        .data;

    var recordsMap = map['items'] as Iterable<dynamic>;
    return recordsMap.map((m) => Record.fromJson(m)).toList();
  }
}
