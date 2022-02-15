part of statsfm;

class Users extends EndpointBase {
  @override
  String get _path => 'v1/users';

  Users(StatsfmApiBase api) : super(api);

  Future<UserPublic> get(String userId) async {
    var jsonString = await _api._get('$_path/$userId');
    var map = json.decode(jsonString);

    return UserPublic.fromJson(map['item']);
  }

  Future<UserPrivacySettings> privacySettings(String userId) async {
    final String jsonString = await _api._get('$_path/$userId/privacy');
    var map = json.decode(jsonString);

    return UserPrivacySettings.fromJson(map['item']);
  }

  Future<UserProfile> profile(String userId) async {
    final String jsonString = await _api._get('$_path/$userId/profile');
    var map = json.decode(jsonString);

    return UserProfile.fromJson(map['item']);
  }

  Future<Iterable<Stream>> streams(
    String userId, {
    int limit = 100,
    int offset = 0,
    int? before,
    int? after,
  }) async {
    final String query = _buildQuery({
      'limit': limit,
      'offset': offset,
      'before': before,
      'after': after,
    });
    final String jsonString = await _api._get(
      '$_path/$userId/streams?$query',
    );
    var map = json.decode(jsonString);

    var streamsMap = map['items'] as Iterable<dynamic>;
    return streamsMap.map((m) => Stream.fromJson(m));
  }
}
