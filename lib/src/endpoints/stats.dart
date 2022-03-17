part of statsfm;

class Stats extends EndpointBase {
  @override
  String get _path => 'v1/stats';

  Stats(StatsfmApiBase api) : super(api);

  Future<DatabaseSize> databaseSize() async {
    final Map map = (await dio.get('$_path/database/size')).data;

    return DatabaseSize.fromJson(map['item']);
  }
}
