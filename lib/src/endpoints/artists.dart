part of statsfm;

class Artists extends EndpointBase {
  @override
  String get _path => 'v1/artists';

  Artists(StatsfmApiBase api) : super(api);

  Future<Artist> get(String artistId) async {
    var jsonString = await _api._get('$_path/$artistId');
    var map = json.decode(jsonString);

    return Artist.fromJson(map['item']);
  }

  Future<Iterable<Track>> topTracks(int artistId) async {
    var jsonString = await _api._get('$_path/$artistId/top/tracks');
    var map = json.decode(jsonString);

    var topTracks = map['items'] as Iterable<dynamic>;
    return topTracks.map((m) => Track.fromJson(m));
  }

  Future<Iterable<Track>> topAlbums(int artistId) async {
    var jsonString = await _api._get('$_path/$artistId/top/tracks');
    var map = json.decode(jsonString);

    var topTracks = map['items'] as Iterable<dynamic>;
    return topTracks.map((m) => Track.fromJson(m));
  }

  Future<Iterable<Artist>> related(int artistId) async {
    var jsonString = await _api._get('$_path/$artistId/related');
    var map = json.decode(jsonString);

    var relatedArtists = map['items'] as Iterable<dynamic>;
    return relatedArtists.map((m) => Artist.fromJson(m));
  }

  Future<Iterable<Artist>> list(Iterable<int> artistIds) async {
    var jsonString = await _api._get('$_path/list?ids=${artistIds.join(',')}');
    var map = json.decode(jsonString);

    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Artist.fromJson(m));
  }

  Future<Iterable<Album>> albums(String artistId) async {
    var jsonString = await _api._get('$_path/$artistId/albums');
    var map = json.decode(jsonString);

    var artistsMap = map['items'] as Iterable<dynamic>;
    return artistsMap.map((m) => Album.fromJson(m));
  }
}
