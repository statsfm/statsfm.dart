part of statsfm;

class Friends extends EndpointBase {
  @override
  String get _path => 'v1/friends';

  Friends(StatsfmApiBase api) : super(api);

  /// Get current users friends
  Future<List<UserPublic>> get() async {
    final Map map = (await dio.get('$_path')).data;

    var itemsMap = map['data'] as Iterable<dynamic>;
    return itemsMap.map((m) => UserPublic.fromJson(m)).toList();
  }

  /// Get current users incoming friend requests
  Future<List<IncomingFriendRequest>> getIncomingRequests() async {
    final Map map = (await dio.get('$_path/requests/incoming')).data;

    var itemsMap = map['data'] as Iterable<dynamic>;
    return itemsMap.map((m) => IncomingFriendRequest.fromJson(m)).toList();
  }

  /// Get current users outgoing friend requests requests
  Future<List<OutgoingFriendRequest>> getOutgoingRequests() async {
    final Map map = (await dio.get('$_path/requests/outgoing')).data;

    var itemsMap = map['data'] as Iterable<dynamic>;
    return itemsMap.map((m) => OutgoingFriendRequest.fromJson(m)).toList();
  }

  /// Send a friend request to another user
  Future<bool> sendRequest(UserPublic user) async {
    return (await dio
                .post('$_path/requests/send/${Uri.encodeComponent(user.id)}'))
            .statusCode ==
        200;
  }

  /// Cancel a friend request that was sent to another user
  Future<bool> cancelRequest(UserPublic user) async {
    return (await dio
                .post('$_path/requests/cancel/${Uri.encodeComponent(user.id)}'))
            .statusCode ==
        200;
  }

  /// Accept a friend request that was sent from another user
  Future<bool> acceptRequest(UserPublic user) async {
    return (await dio
                .post('$_path/requests/accept/${Uri.encodeComponent(user.id)}'))
            .statusCode ==
        200;
  }

  /// Deny a friend request that was sent from another user
  Future<bool> denyRequest(UserPublic user) async {
    return (await dio
                .post('$_path/requests/deny/${Uri.encodeComponent(user.id)}'))
            .statusCode ==
        200;
  }

  /// Remove a friend from current users friends list
  Future<bool> remove(UserPublic user) async {
    return (await dio.post('$_path/remove/${Uri.encodeComponent(user.id)}'))
            .statusCode ==
        200;
  }

  /// Blocks a user from sending messages or friend request to the current user
  Future<bool> block(UserPublic user) async {
    return (await dio.post('$_path/block/${Uri.encodeComponent(user.id)}'))
            .statusCode ==
        200;
  }

  /// Unblocks a user from sending messages or friend request to the current user
  Future<bool> unblock(UserPublic user) async {
    return (await dio.post('$_path/unblock/${Uri.encodeComponent(user.id)}'))
            .statusCode ==
        200;
  }

  /// Check if the current user has blocked the other user
  Future<bool> blockStatus(UserPublic user) async {
    Response temp = await dio
                .get('$_path/block-status/${Uri.encodeComponent(user.id)}');
    if (temp.statusCode == 200) {
      return temp.data['item'];
    }
    return false;
  }

  /// Check if the current users friend status with another user
  Future<FriendStatus> status(UserPublic user) async {
    final Map map =
        (await dio.get('$_path/status/${Uri.encodeComponent(user.id)}')).data;
    String status = map['data'] as String;

    if (status == "FRIENDS") {
      return FriendStatus.FRIENDS;
    } else if (status == "REQUEST_INCOMING") {
      return FriendStatus.REQUEST_INCOMING;
    } else if (status == "REQUEST_OUTGOING") {
      return FriendStatus.REQUEST_OUTGOING;
    } else {
      return FriendStatus.NONE;
    }
  }
}
