part of statsfm;

class Stats extends EndpointBase {
  @override
  String get _path => 'v1/stats';

  Stats(StatsfmApiBase api) : super(api);

  Future<DatabaseSize> databaseSize() async {
    var jsonString = await _api._get('$_path/database/size');
    var map = json.decode(jsonString);

    return DatabaseSize.fromJson(map['item']);
  }
}
