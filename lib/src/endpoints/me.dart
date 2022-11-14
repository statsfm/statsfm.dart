part of statsfm;

class Me extends EndpointBase {
  @override
  String get _path => 'v1/me';

  Me(StatsfmApiBase api) : super(api);

  Future<UserPrivate> get() async {
    final map = (await dio.get(_path)).data;

    return UserPrivate.fromJson(map['item']);
  }

  Future<UserPrivate> updateMe(UserPrivate me) async {
    final Map map = (await dio.put(
      '$_path',
      data: me.toJson(),
    ))
        .data;

    return UserPrivate.fromJson(map['item']);
  }

  Future<void> deleteAccount() async {
    // TODO: implement
    throw UnimplementedError();
  }

  Future<List<UserProfileSocialMediaConnection>> socialMediaConnections() async {
    final Map map = (await dio.get('$_path/connections')).data;

    var connectionsMap = map['items'] as Iterable<dynamic>;
    return connectionsMap.map((m) => UserProfileSocialMediaConnection.fromJson(m)).toList();
  }

  Future<UserPrivacySettings> privacySettings() async {
    final Map map = (await dio.get('$_path/privacy')).data;

    return UserPrivacySettings.fromJson(map['item']);
  }

  Future<UserPrivacySettings> updatePrivacySettings(
      UserPrivacySettings privacySettings) async {
    final Map map = (await dio.put(
      '$_path/privacy',
      data: privacySettings.toJson(),
    ))
        .data;

    return UserPrivacySettings.fromJson(map['item']);
  }

  Future<bool> customIdAvailable(String customId) async {
    final Map map = (await dio.put(
      '$_path/customid-available',
      data: {'customId': customId},
    ))
        .data;

    return map['item'] as bool;
  }

  Future<UserProfile> profile() async {
    final Map map = (await dio.get('$_path/profile')).data;

    return UserProfile.fromJson(map['item']);
  }

  Future<UserProfile> updateProfile(UserProfile profile) async {
    final Map map = (await dio.put(
      '$_path/profile',
      data: profile.toJson(),
    ))
        .data;

    return UserProfile.fromJson(map['item']);
  }

  Future<List<UserImport>> imports() async {
    final Map map = (await dio.get('$_path/imports')).data;

    var importsMap = map['items'] as Iterable<dynamic>;
    return importsMap.map((m) => UserImport.fromJson(m)).toList();
  }

  Future<UserImport> import() async {
    // TODO: implement
    throw UnimplementedError();
  }

  Future<void> removeImport(int id) async {
    await dio.delete('$_path/imports/$id');
  }

  Future<List<UserSpotifyPlaylist>> spotifyPlaylists() async {
    final Map map = (await dio.get('$_path/playlists/spotify')).data;

    var importsMap = map['items'] as Iterable<dynamic>;
    return importsMap.map((m) => UserSpotifyPlaylist.fromJson(m)).toList();
  }

  Future<UserSpotifyPlaylist?> createSpotifyPlaylist(
    int size,
    OrderBySetting orderBy,
    bool syncEnabled,
    Range? range,
    int? rangeInDays,
    DateTime? before,
    DateTime? after,
  ) async {
    final Map map = (await dio.post(
      '$_path/playlists/spotify',
      data: {
        'size': size,
        'orderBy':
            orderBy.toString().substring(orderBy.toString().indexOf('.') + 1),
        'syncEnabled': syncEnabled,
        'range': range?.toString().substring(range.toString().indexOf('.') + 1),
        'rangeInDays': rangeInDays,
        'before': before?.millisecondsSinceEpoch,
        'after': after?.millisecondsSinceEpoch,
      },
    ))
        .data;

    return UserSpotifyPlaylist.fromJson(map['item']);
  }

  Future<UserSpotifyPlaylist> updateSpotifyPlaylist(
    UserSpotifyPlaylist playlist,
  ) async {
    final Map map = (await dio.put(
      '$_path/playlists/spotify/${playlist.id}',
      data: playlist.toJson(),
    ))
        .data;

    return UserSpotifyPlaylist.fromJson(map['item']);
  }

  Future<void> deleteSpotifyPlaylist(
    int id,
  ) async {
    await dio.delete('$_path/playlists/spotify/${id}');
  }

  Future<List<UserDevice>> devices() async {
    final Map map = (await dio.get('$_path/devices')).data;

    var devicesMap = map['items'] as Iterable<dynamic>;
    return devicesMap.map((m) => UserDevice.fromJson(m)).toList();
  }

  Future<UserDevice> addDevice(UserDevice device) async {
    final Map map =
        (await dio.post('$_path/devices', data: device.toJson())).data;

    return UserDevice.fromJson(map['item']);
  }

  Future<UserDevice> updateDevice(UserDevice device) async {
    final Map map =
        (await dio.put('$_path/devices/${device.id}', data: device.toJson()))
            .data;

    return UserDevice.fromJson(map['item']);
  }

  Future<List<Soulmate>> soulmates(
      {bool forceRefresh = false, bool? plusOnly, String? country}) async {
    Map<String, dynamic> queryParams = {};
    //Refreshes soulmates matches
    if (forceRefresh) {
      queryParams.addAll({'force': forceRefresh});
    }
    //Filters to only plus users
    if (plusOnly == true) {
      queryParams.addAll({'plus': plusOnly});
    }
    //Filters to matches by country iso code. Leave null for global results
    if (country != null) {
      queryParams.addAll({'country': country});
    }

    final Map map = (await dio.get(
      '$_path/soulmates',
      queryParameters: queryParams,
    ))
        .data;

    var soulmatesMap = map['items'] as Iterable<dynamic>;
    return soulmatesMap.map((m) => Soulmate.fromJson(m)).toList();
  }

  Future<List<ChatMessage>> chats({
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/chats',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var messagesMap = map['items'] as Iterable<dynamic>;
    return messagesMap.map((m) => ChatMessage.fromJson(m)).toList();
  }

  Future<List<ChatMessage>> chatMessages(
    String userId, {
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/chats/private/${Uri.encodeComponent(userId)}/messages',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var messagesMap = map['items'] as Iterable<dynamic>;
    return messagesMap.map((m) => ChatMessage.fromJson(m)).toList();
  }

  Future<bool> sendChatMessage(String userId, String content) async {
    return (await dio.post(
          '$_path/chats/private/${Uri.encodeComponent(userId)}/messages',
          data: {
            "content": content,
          },
        ))
            .statusCode ==
        201;
  }
}
