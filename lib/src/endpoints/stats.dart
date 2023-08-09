part of statsfm;

class Stats extends EndpointBase {
  @override
  String get _path => 'v1/stats';

  Stats(StatsfmApiBase api) : super(api);

  Future<DatabaseSizeStatsfm> databaseSizeStatsfm() async {
    final Map map = (await dio.get('$_path/database/size')).data;

    return DatabaseSizeStatsfm.fromJson(map['item']);
  }

  Future<DatabaseSizeStatsfm> databaseSizeSwipefy() async {
    final Map map = (await dio.get('$_path/swipefy/database/size')).data;

    return DatabaseSizeStatsfm.fromJson(map['item']);
  }
}
