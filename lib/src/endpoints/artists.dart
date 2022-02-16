part of statsfm;

class Artists extends EndpointBase {
  @override
  String get _path => 'v1/artists';

  Artists(StatsfmApiBase api) : super(api);

  Future<Artist> get(int artistId) async {
    var jsonString = await _api._get('$_path/$artistId');
    var map = json.decode(jsonString);

    return Artist.fromJson(map['item']);
  }

  Future<List<Artist>> list(Iterable<int> artistIds) async {
    var jsonString = await _api._get('$_path/list?ids=${artistIds.join(',')}');
    var map = json.decode(jsonString);

    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Artist.fromJson(m)).toList();
  }

  Future<List<Track>> tracks(int artistId) async {
    var jsonString = await _api._get('$_path/$artistId/tracks');
    var map = json.decode(jsonString);

    var topTracks = map['items'] as Iterable<dynamic>;
    return topTracks.map((m) => Track.fromJson(m)).toList();
  }

  Future<List<Track>> topTracks(int artistId) async {
    var jsonString = await _api._get('$_path/$artistId/tracks/top');
    var map = json.decode(jsonString);

    var topTracks = map['items'] as Iterable<dynamic>;
    return topTracks.map((m) => Track.fromJson(m)).toList();
  }

  Future<List<Album>> albums(int artistId) async {
    var jsonString = await _api._get('$_path/$artistId/albums');
    var map = json.decode(jsonString);

    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Album.fromJson(m)).toList();
  }

  Future<List<Track>> topAlbums(int artistId) async {
    var jsonString = await _api._get('$_path/$artistId/albums/top');
    var map = json.decode(jsonString);

    var topTracks = map['items'] as Iterable<dynamic>;
    return topTracks.map((m) => Track.fromJson(m)).toList();
  }

  Future<List<Artist>> related(int artistId) async {
    var jsonString = await _api._get('$_path/$artistId/related');
    var map = json.decode(jsonString);

    var relatedArtists = map['items'] as Iterable<dynamic>;
    return relatedArtists.map((m) => Artist.fromJson(m)).toList();
  }
}
