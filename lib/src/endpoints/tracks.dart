part of statsfm;

class Tracks extends EndpointBase {
  @override
  String get _path => 'v1/tracks';

  Tracks(StatsfmApiBase api) : super(api);

  Future<Track> get(String trackId) async {
    var jsonString = await _api._get('$_path/$trackId');
    var map = json.decode(jsonString);

    return Track.fromJson(map['item']);
  }

  Future<Iterable<Track>> list(Iterable<String> trackIds) async {
    var jsonString = await _api._get('$_path/list?ids=${trackIds.join(',')}');
    var map = json.decode(jsonString);
    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Track.fromJson(m));
  }
}
