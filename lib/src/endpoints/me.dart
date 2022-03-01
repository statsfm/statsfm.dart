part of statsfm;

class Me extends EndpointBase {
  @override
  String get _path => 'v1/me';

  Me(StatsfmApiBase api) : super(api);

  Future<UserPrivate> get() async {
    final String jsonString = await _api._get(_path);
    var map = json.decode(jsonString);

    return UserPrivate.fromJson(map['item']);
  }

  Future<UserPrivate> updateMe(UserPrivate me) async {
    final String jsonString = await _api._put(
      '$_path',
      json.encode(me.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    var map = json.decode(jsonString);

    return UserPrivate.fromJson(map['item']);
  }

  Future<void> deleteAccount() async {
    // TODO: implement
    throw UnimplementedError();
  }

  Future<UserPrivacySettings> privacySettings() async {
    final String jsonString = await _api._get('$_path/privacy');
    var map = json.decode(jsonString);

    return UserPrivacySettings.fromJson(map['item']);
  }

  Future<UserPrivacySettings> updatePrivacySettings(
      UserPrivacySettings privacySettings) async {
    final String jsonString = await _api._put(
      '$_path/privacy',
      json.encode(privacySettings.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    var map = json.decode(jsonString);

    return UserPrivacySettings.fromJson(map['item']);
  }

  Future<bool> customIdAvailable(String customId) async {
    final String jsonString = await _api._put(
      '$_path/customid-available',
      json.encode({'customId': customId}),
      headers: {'Content-Type': 'application/json'},
    );
    var map = json.decode(jsonString);

    return map['item'] as bool;
  }

  Future<UserProfile> profile() async {
    final String jsonString = await _api._get('$_path/profile');
    var map = json.decode(jsonString);

    return UserProfile.fromJson(map['item']);
  }

  Future<UserProfile> updateProfile(UserProfile profile) async {
    final String jsonString = await _api._put(
      '$_path/profile',
      json.encode(profile.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    var map = json.decode(jsonString);

    return UserProfile.fromJson(map['item']);
  }

  Future<List<UserImport>> imports() async {
    final String jsonString = await _api._get('$_path/imports');
    var map = json.decode(jsonString);

    var importsMap = map['items'] as Iterable<dynamic>;
    return importsMap.map((m) => UserImport.fromJson(m)).toList();
  }

  Future<UserImport> import() async {
    // TODO: implement
    throw UnimplementedError();
  }

  Future<void> removeImport(int id) async {
    await _api._delete('$_path/imports/$id', '');
  }

  Future<List<UserSpotifyPlaylist>> spotifyPlaylists() async {
    final String jsonString = await _api._get('$_path/playlists/spotify');
    var map = json.decode(jsonString);

    var importsMap = map['items'] as Iterable<dynamic>;
    return importsMap.map((m) => UserSpotifyPlaylist.fromJson(m)).toList();
  }

  Future<UserSpotifyPlaylist> updateSpotifyPlaylist(
    UserSpotifyPlaylist playlist,
  ) async {
    print('$_path/playlists/spotify/${playlist.id}');
    print(playlist.toJson());
    final String jsonString = await _api._put(
      '$_path/playlists/spotify/${playlist.id}',
      json.encode(playlist.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    print('sjon string: ' + jsonString);
    var map = json.decode(jsonString);

    return UserSpotifyPlaylist.fromJson(map['item']);
  }

  Future<UserSpotifyPlaylist?> createSpotifyPlaylist(
    int size,
    OrderBySetting orderBy,
    bool syncEnabled,
    Range? range,
    int? rangeInDays,
  ) async {
    final String jsonString = await _api._post(
      '$_path/playlists/spotify',
      json.encode({
        'size': size,
        'orderBy':
            orderBy.toString().substring(orderBy.toString().indexOf('.') + 1),
        'syncEnabled': syncEnabled,
        'range': range?.toString().substring(range.toString().indexOf('.') + 1),
        'rangeInDays': rangeInDays,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    var map = json.decode(jsonString);

    return UserSpotifyPlaylist.fromJson(map['item']);
  }
}
