part of statsfm;

class Me extends EndpointBase {
  @override
  String get _path => 'v1/me';

  Me(StatsfmApiBase api) : super(api);

  Future<UserPrivate> get() async {
    Response response = await dio.get(_path);

    if (response.statusCode != 200 && response.statusCode != 304) {
      throw StatsfmException(response.statusCode ?? 400,
          response.statusMessage ?? 'No status message');
    }

    return UserPrivate.fromJson(response.data['item']);
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

  Future<List<UserProfileSocialMediaConnection>>
      socialMediaConnections() async {
    final Map map = (await dio.get('$_path/connections')).data;

    var connectionsMap = map['items'] as Iterable<dynamic>;
    return connectionsMap
        .map((m) => UserProfileSocialMediaConnection.fromJson(m))
        .toList();
  }

  Future<void> removeSocialMediaConnection(int id) async {
    await dio.delete('$_path/connections/$id');
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

  Future<UserSpotifyPlaylist> createSpotifyPlaylist(
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

  Future<UserDevice> updateSwipefyDevice(UserDevice device) async {
    final Map map = (await dio.put('$_path/swipefy/devices/${device.id}',
            data: device.toJson()))
        .data;

    return UserDevice.fromJson(map['item']);
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

  /// Removes the current users profile image
  Future<bool> deleteProfileImage() async {
    return (await dio.delete('$_path/image')).statusCode == 200;
  }

  ///Update a services sync and import settings
  Future<bool> updateServiceSettings(String service,
      {bool? syncStreams, bool? hasImported, DateTime? requestedGdpr}) async {
    Map temp = {};
    //Sync Streams option
    if (syncStreams != null) {
      temp.addAll({'sync': syncStreams});
    }
    //Has imported option
    if (hasImported != null) {
      temp.addAll({'hasImported': hasImported});
    }
    //requestedGdpr option
    if (requestedGdpr != null) {
      temp.addAll({'requestedGdpr': requestedGdpr.toString()});
    }
    //Make sure there is options
    if (temp.isEmpty) {
      throw StatsfmException(400, 'updateServiceSettings has no options set.');
    }

    final Response response = await dio.post(
      '$_path/service/$service/settings',
      data: temp,
    );
    return response.statusCode == 201;
  }

  ///Gets the Swipes for the current users friends of the item
  Future<List<FriendSwipe>> getFriendsSwipes(int id, dynamic type) async {
    //Get item type
    String? typeString;
    switch (type.runtimeType) {
      case Track:
        typeString = 'tracks';
        break;
      case Artist:
        typeString = 'artists';
        break;
      case Album:
        typeString = 'albums';
        break;
      default:
        throw Exception('Not a valid type');
    }
    final Map map =
        (await dio.get('$_path/swipefy/friends/$typeString/$id/swipes')).data;

    var devicesMap = map['items'] as Iterable<dynamic>;
    return devicesMap.map((m) => FriendSwipe.fromJson(m)).toList();
  }

  //--------- Soulmates ---------

  /// [soulmates]
  /// Soulmates
  Future<List<Soulmate>> soulmates({
    bool? plusOnly,
    String? country,
  }) async {
    Map<String, dynamic> queryParams = {};
    //Filters to only plus users
    if (plusOnly == true) {
      queryParams.addAll({'plus': plusOnly});
    }
    //Filters to matches by country iso code. Leave null for global results
    if (country != null) {
      queryParams.addAll({'country': country});
    }

    final Map map = (await dio.get(
      '$_path/soulmates/v2',
      queryParameters: queryParams,
    ))
        .data;

    var soulmatesMap = map['items'] as Iterable<dynamic>;
    return soulmatesMap.map((m) => Soulmate.fromJson(m)).toList();
  }

  /// [soulmatesFriends]
  /// Soulmates friends
  Future<List<Soulmate>> soulmatesFriends({
    bool? plusOnly,
    String? country,
  }) async {
    Map<String, dynamic> queryParams = {};
    //Filters to only plus users
    if (plusOnly == true) {
      queryParams.addAll({'plus': plusOnly});
    }
    //Filters to matches by country iso code. Leave null for global results
    if (country != null) {
      queryParams.addAll({'country': country});
    }

    final Map map = (await dio.get(
      '$_path/soulmates/friends',
      queryParameters: queryParams,
    ))
        .data;

    var soulmatesMap = map['items'] as Iterable<dynamic>;
    return soulmatesMap.map((m) => Soulmate.fromJson(m)).toList();
  }

  /// [soulmatesFriendsSwipe]
  /// Send out a soulmates swipe
  Future<SoulmateMatchStatus> soulmatesFriendsSwipe(SoulmateSwipe swipe) async {
    Response response = await dio.post(
      '$_path/soulmates/friends/matches',
      data: jsonEncode(
        {
          'recommendationId': swipe.recommendationId,
          'decision': swipe.decision,
          'decisionMs': swipe.decisionMs,
        },
      ),
    );

    if (response.data['item']['status'] == 'LIKE_SENT') {
      return SoulmateMatchStatus.LIKE_SENT;
    } else if (response.data['item']['status'] == 'DISLIKE_SENT') {
      return SoulmateMatchStatus.DISLIKE_SENT;
    } else if (response.data['item']['status'] == 'MATCH') {
      return SoulmateMatchStatus.MATCH;
    }

    return SoulmateMatchStatus.NO_MATCH;
  }

  /// [soulmatesMatches]
  /// Get the users soulmate matches
  Future<List<SoulmateMatch>> soulmatesMatches({
    QueryOptions options = const QueryOptions(),
  }) async {
    final Map<String, dynamic> query = options.toQuery();
    final Map map = (await dio.get(
      '$_path/soulmates/friends/matches',
      queryParameters: {
        ...query,
      },
    ))
        .data;

    var soulmatesMatchesMap = map['items'] as Iterable<dynamic>;
    return soulmatesMatchesMap.map((m) => SoulmateMatch.fromJson(m)).toList();
  }

  /// [soulmateRemoveMatch]
  /// Remove a match in soulmates
  Future<bool> soulmateRemoveMatch({required String id}) async {
    return (await dio.delete(
                '$_path/soulmates/friends/matches/${Uri.encodeComponent(id)}'))
            .statusCode ==
        200;
  }

  //--------- Friends ------------

  /// [friends]
  /// Get current users friends
  Future<List<UserPublic>> friends() async {
    final Map map = (await dio.get('$_path/friends')).data;

    var itemsMap = map['items'] as Iterable<dynamic>;
    return itemsMap.map((m) => UserPublic.fromJson(m)).toList();
  }

  /// [blocks]
  /// Get the list of the current users blocks
  Future<List<UserPublic>> blocks() async {
    final Map map = (await dio.get('$_path/friends/blocked')).data;

    var itemsMap = map['items'] as Iterable<dynamic>;
    return itemsMap.map((m) => UserPublic.fromJson(m)).toList();
  }

  /// [userStatus]
  /// Check if the current user has blocked the other user
  Future<UserStatus> userStatus(UserPublic user) async {
    Response temp =
        await dio.get('$_path/friends/${Uri.encodeComponent(user.id)}');
    return UserStatus.fromJson(temp.data['item']);
  }

  /// [blockUser]
  /// Block a user
  Future<bool> blockUser(UserPublic user) async {
    return (await dio
                .post('$_path/friends/${Uri.encodeComponent(user.id)}/block'))
            .statusCode ==
        200;
  }

  /// [unblockUser]
  /// Unblock a user
  Future<bool> unblockUser(UserPublic user) async {
    return (await dio
                .delete('$_path/friends/${Uri.encodeComponent(user.id)}/block'))
            .statusCode ==
        200;
  }

  /// [addFriend]
  /// Add friend from current users friends list
  /// This also accepts a incoming friend request
  Future<bool> addFriend(UserPublic user) async {
    return (await dio.post('$_path/friends/${Uri.encodeComponent(user.id)}'))
            .statusCode ==
        200;
  }

  /// [removeFriend]
  /// Remove a friend from current users friends list
  /// This also denys or cancels a friend request
  Future<bool> removeFriend(UserPublic user) async {
    return (await dio.delete('$_path/friends/${Uri.encodeComponent(user.id)}'))
            .statusCode ==
        200;
  }

  /// [requests]
  /// Get the users incoming and outgoing requests
  Future<FriendRequests> requests() async {
    Response temp = await dio.get('$_path/friends/requests');
    return FriendRequests.fromJson(temp.data['items']);
  }

  /// [acceptLegalVersion]
  /// Accept the legal version using the current users account
  Future<bool> acceptLegalVersion(String legalType, int version) async {
    return (await dio.put(
          '$_path/legal/$legalType',
          data: {
            "version": version,
          },
        ))
            .statusCode ==
        204;
  }
}
