part of statsfm.models;

@JsonSerializable(createToJson: true)
class UserPrivate extends UserPublic {
  UserPrivate();

  Map<String, dynamic> toJson() => _$UserPrivateToJson(this);

  factory UserPrivate.fromJson(Map<String, dynamic> json) =>
      _$UserPrivateFromJson(json);

  ///Sometimes there is no email provided by Apple's Sign in
  @JsonKey(name: 'email')
  late String? email;

  @JsonKey(name: 'country')
  late String country;

  @JsonKey(name: 'disabled', defaultValue: false)
  late bool disabled;
}

@JsonSerializable(createToJson: true)
class UserPublic extends Object {
  UserPublic();

  Map<String, dynamic> toJson() => _$UserPublicToJson(this);

  factory UserPublic.fromJson(Map<String, dynamic> json) =>
      _$UserPublicFromJson(json);

  @JsonKey(name: 'id', required: true)
  late String id;

  @JsonKey(name: 'customId', required: true)
  late String customId;

  @JsonKey(name: 'displayName', required: true)
  late String displayName;

  ///Creation date of the account
  ///If the date is 2022-09-03T16:49:16.405Z, the account was created before we started tracking join dates.
  @JsonKey(name: 'createdAt', required: true)
  late DateTime createdAt;

  @JsonKey(name: 'image', required: true)
  late String? image;

  @JsonKey(name: 'isPlus', defaultValue: false, required: true)
  late bool isPlus;

  @JsonKey(name: 'isPro', defaultValue: false, required: true)
  late bool isPro;

  @JsonKey(name: 'hasSwipefy', defaultValue: false)
  late bool hasSwipefy;

  ///If firstSwipe is null the user hasn't swipped anything on Swipefy
  @JsonKey(name: 'firstSwipe')
  late DateTime? firstSwipe;

  ///If lastSwipe is null the user hasn't swipped anything on Swipefy
  @JsonKey(name: 'lastSwipe')
  late DateTime? lastSwipe;

  ///NOTE: Will be deprecated after the Apple Music update.
  @JsonKey(name: 'hasImported', defaultValue: false)
  late bool hasImported;

  ///NOTE: Will be deprecated after the Apple Music update.
  @JsonKey(name: 'syncEnabled', defaultValue: false)
  late bool syncEnabled;

  @JsonKey(name: 'timezone')
  late String? timezone;

  @JsonKey(name: 'orderBy', defaultValue: OrderBySetting.PLATFORM)
  late OrderBySetting orderBy;

  @JsonKey(name: 'privacySettings')
  late UserPrivacySettings? privacySettings;

  @JsonKey(name: 'profile')
  late UserProfile? profile;

  @JsonKey(name: 'socialMediaConnections')
  late List<UserProfileSocialMediaConnection> socialMediaConnections;

  ///This is only here if a user has been banned from stats.fm
  @JsonKey(name: 'userBan')
  late UserBan? userBan;

  ///Users streams are stored in a different database (Normally happens if they sleep stream)
  @JsonKey(name: 'quarantined', defaultValue: false)
  late bool quarantined;

  ///User was active in the last 72h
  @JsonKey(name: 'recentlyActive', defaultValue: false)
  late bool recentlyActive;

  ///Only available on the new multi service api beta
  @JsonKey(name: 'spotifyAuth')
  late SpotifyAuth? spotifyAuth;

  ///Only available on the new multi service api beta
  @JsonKey(name: 'appleMusicAuth')
  late AppleMusicAuth? appleMusicAuth;
}

enum OrderBySetting {
  ///This is also Spotify, will be switching to SPOTIFY sort
  @JsonValue("PLATFORM")
  PLATFORM,

  @JsonValue("COUNT")
  COUNT,

  @JsonValue("TIME")
  TIME,

  @JsonValue("SPOTIFY")
  SPOTIFY,

  @JsonValue("APPLEMUSIC")
  APPLEMUSIC
}

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class UserImport extends Object {
  UserImport();

  factory UserImport.fromJson(Map<String, dynamic> json) =>
      _$UserImportFromJson(json);

  @JsonKey(name: 'hash')
  late String hash;

  @JsonKey(name: 'id', required: true)
  late int id;

  @JsonKey(name: 'userId', required: true)
  late String userId;

  @JsonKey(name: 'path')
  late String? path;

  @JsonKey(name: 'count', defaultValue: 0)
  late int count;

  @JsonKey(name: 'status')
  late int status;

  @JsonKey(name: 'updatedAt')
  late DateTime updatedAt;

  @JsonKey(name: 'createdAt')
  late DateTime createdAt;

  @JsonKey(name: 'serverId')
  late int serverId;

  @JsonKey(name: 'error')
  late String? error;

  @JsonKey(name: 'name')
  late String? name;
}

@JsonSerializable(createToJson: true)
class UserPrivacySettings extends Object {
  UserPrivacySettings();

  Map<String, dynamic> toJson() => _$UserPrivacySettingsToJson(this);

  factory UserPrivacySettings.fromJson(Map<String, dynamic> json) =>
      _$UserPrivacySettingsFromJson(json);

  @JsonKey(name: 'profile', defaultValue: true)
  late bool profile;

  @JsonKey(name: 'message', defaultValue: true)
  late bool message;

  @JsonKey(name: 'currentlyPlaying', defaultValue: true)
  late bool currentlyPlaying;

  @JsonKey(name: 'recentlyPlayed', defaultValue: true)
  late bool recentlyPlayed;

  @JsonKey(name: 'topTracks', defaultValue: true)
  late bool topTracks;

  @JsonKey(name: 'topArtists', defaultValue: true)
  late bool topArtists;

  @JsonKey(name: 'topAlbums', defaultValue: true)
  late bool topAlbums;

  @JsonKey(name: 'topGenres', defaultValue: true)
  late bool topGenres;

  @JsonKey(name: 'streams', defaultValue: true)
  late bool streams;

  @JsonKey(name: 'streamStats', defaultValue: true)
  late bool streamStats;

  @JsonKey(name: 'leaderboards', defaultValue: true)
  late bool leaderboards;

  @JsonKey(name: 'connections', defaultValue: true)
  late bool connections;

  @JsonKey(name: 'friends', defaultValue: true)
  late bool friends;

  ///The user is shown in soulmates
  @JsonKey(name: 'soulmates', defaultValue: true)
  late bool soulmates;
}

@JsonSerializable(createToJson: true)
class UserProfile extends Object {
  UserProfile();

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  @JsonKey(name: 'bio', required: true)
  late String bio;

  @JsonKey(name: 'pronouns')
  late String? pronouns;

  @JsonKey(name: 'theme')
  late String? theme;
}

@JsonSerializable(createToJson: true)
@LocalDateTimeConverter()
class IncomingFriendRequest extends Object {
  IncomingFriendRequest();

  factory IncomingFriendRequest.fromJson(Map<String, dynamic> json) =>
      _$IncomingFriendRequestFromJson(json);

  @JsonKey(name: 'from', required: true)
  late UserPublic friend;

  @JsonKey(name: 'createdAt', required: true)
  late DateTime createdAt;
}

@JsonSerializable(createToJson: true)
@LocalDateTimeConverter()
class OutgoingFriendRequest extends Object {
  OutgoingFriendRequest();

  factory OutgoingFriendRequest.fromJson(Map<String, dynamic> json) =>
      _$OutgoingFriendRequestFromJson(json);

  @JsonKey(name: 'to', required: true)
  late UserPublic friend;

  @JsonKey(name: 'createdAt', required: true)
  late DateTime createdAt;
}

@JsonSerializable(createToJson: true)
class UserStatus extends Object {
  UserStatus();

  factory UserStatus.fromJson(Map<String, dynamic> json) =>
      _$UserStatusFromJson(json);

  @JsonKey(name: 'status', defaultValue: FriendStatus.NONE)
  late FriendStatus status;

  @JsonKey(name: 'blocked', defaultValue: false)
  late bool blocked;
}

enum FriendStatus {
  NONE,
  FRIENDS,
  REQUEST_INCOMING,
  REQUEST_OUTGOING,
  ERROR,
}

@JsonSerializable(createToJson: true)
class FriendRequests extends Object {
  FriendRequests();

  factory FriendRequests.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestsFromJson(json);

  @JsonKey(name: 'incoming', required: true)
  late List<IncomingFriendRequest> incoming;

  @JsonKey(name: 'outgoing', required: true)
  late List<OutgoingFriendRequest> outgoing;
}

@JsonSerializable(createToJson: true)
class UserProfileSocialMediaConnection extends Object {
  UserProfileSocialMediaConnection();

  Map<String, dynamic> toJson() =>
      _$UserProfileSocialMediaConnectionToJson(this);

  factory UserProfileSocialMediaConnection.fromJson(
          Map<String, dynamic> json) =>
      _$UserProfileSocialMediaConnectionFromJson(json);

  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'verified')
  late bool verified;

  @JsonKey(name: 'platformUserId')
  late String platformUserId;

  @JsonKey(name: 'platformUsername')
  late String platformUsername;

  @JsonKey(name: 'platformUserImage')
  late String platformUserImage;

  @JsonKey(name: 'platform')
  late SocialMediaPlatform platform;

  @JsonKey(name: 'user')
  late UserPublic? user;
}

@JsonSerializable(createToJson: true)
class SocialMediaPlatform extends Object {
  SocialMediaPlatform();

  Map<String, dynamic> toJson() => _$SocialMediaPlatformToJson(this);

  factory SocialMediaPlatform.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaPlatformFromJson(json);

  @JsonKey(name: 'id')
  late int? id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'icon')
  late String icon;
}

@JsonSerializable(createToJson: false)
class TopUser extends TopObject {
  TopUser();

  factory TopUser.fromJson(Map<String, dynamic> json) =>
      _$TopUserFromJson(json);

  @JsonKey(name: 'user')
  late UserPublic? user;
}

@JsonSerializable(createToJson: true)
@LocalDateTimeConverter()
class UserSpotifyPlaylist extends Object {
  UserSpotifyPlaylist();

  Map<String, dynamic> toJson() => _$UserSpotifyPlaylistToJson(this);

  factory UserSpotifyPlaylist.fromJson(Map<String, dynamic> json) =>
      _$UserSpotifyPlaylistFromJson(json);

  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'userId')
  late String userId;

  @JsonKey(name: 'createdAt')
  late DateTime createdAt;

  @JsonKey(name: 'syncedAt')
  late DateTime syncedAt;

  @JsonKey(name: 'size')
  late int size;

  @JsonKey(name: 'spotifyId')
  late String spotifyId;

  @JsonKey(name: 'range')
  late Range? range;

  @JsonKey(name: 'rangeInDays')
  late int? rangeInDays;

  @JsonKey(name: 'error')
  late String? error;

  @JsonKey(name: 'syncEnabled')
  late bool syncEnabled;

  @JsonKey(name: 'name')
  late String? name;

  @JsonKey(name: 'orderBy')
  late OrderBySetting? orderBy;
}

@JsonSerializable(createToJson: true)
@LocalDateTimeConverter()
class UserDevice extends Object {
  UserDevice({
    required this.id,
    required this.userId,
    required this.name,
    required this.model,
    required this.type,
    required this.notifications,
    required this.fcmToken,
    required this.lastUsed,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => _$UserDeviceToJson(this);

  factory UserDevice.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceFromJson(json);

  @JsonKey(name: 'id')
  late String id;

  @JsonKey(name: 'userId')
  late String? userId;

  @JsonKey(name: 'createdAt')
  late DateTime? createdAt;

  @JsonKey(name: 'lastUsed')
  late DateTime? lastUsed;

  @JsonKey(name: 'name')
  late String? name;

  @JsonKey(name: 'model')
  late String? model;

  @JsonKey(name: 'type')
  late String? type;

  @JsonKey(name: 'notifications')
  late UserDeviceNotifications notifications;

  @JsonKey(name: 'fcmToken')
  late String? fcmToken;
}

@JsonSerializable(createToJson: true)
class UserDeviceNotifications extends Object {
  UserDeviceNotifications({
    required this.imports,
    required this.friends,
    required this.weeklySummary,
    required this.monthlySummary,
    required this.updates,
  });

  Map<String, dynamic> toJson() => _$UserDeviceNotificationsToJson(this);

  factory UserDeviceNotifications.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceNotificationsFromJson(json);

  @JsonKey(name: 'imports')
  late bool? imports;

  @JsonKey(name: 'friends')
  late bool? friends;

  @JsonKey(name: 'weeklySummary')
  late bool? weeklySummary;

  @JsonKey(name: 'monthlySummary')
  late bool? monthlySummary;

  @JsonKey(name: 'updates')
  late bool? updates;
}

@JsonSerializable(createToJson: true)
class SpotifyAuth extends Object {
  SpotifyAuth();

  Map<String, dynamic> toJson() => _$SpotifyAuthToJson(this);

  factory SpotifyAuth.fromJson(Map<String, dynamic> json) =>
      _$SpotifyAuthFromJson(json);

  ///disabled only available for current user on /me
  @JsonKey(name: 'disabled', defaultValue: false)
  late bool disabled;

  ///Email only available for current user on /me
  @JsonKey(name: 'email')
  late String? email;

  @JsonKey(name: 'displayName', required: true)
  late String displayName;

  ///platformUserId only available for current user on /me or if the user has connections set to public
  @JsonKey(name: 'platformUserId')
  late String? platformUserId;

  @JsonKey(name: 'image')
  late String? image;

  ///Country only available for current user on /me
  @JsonKey(name: 'country')
  late String? country;

  @JsonKey(name: 'sync', defaultValue: false)
  late bool syncStreams;

  @JsonKey(name: 'imported', defaultValue: false)
  late bool imported;

  ///Status only available for current user on /me
  @JsonKey(name: 'status', defaultValue: 0)
  late int status;
}

@JsonSerializable(createToJson: true)
class AppleMusicAuth extends Object {
  AppleMusicAuth();

  Map<String, dynamic> toJson() => _$AppleMusicAuthToJson(this);

  factory AppleMusicAuth.fromJson(Map<String, dynamic> json) =>
      _$AppleMusicAuthFromJson(json);

  ///disabled only available for current user on /me
  @JsonKey(name: 'disabled', defaultValue: false)
  late bool disabled;

  ///Sometimes there is no email provided by Apple's Sign in and only available for current user on /me
  @JsonKey(name: 'email')
  late String? email;

  ///emailVerified only available for current user on /me
  @JsonKey(name: 'emailVerified', defaultValue: false)
  late bool emailVerified;

  ///appleUserId only available for current user on /me
  @JsonKey(name: 'appleUserId')
  late String? appleUserId;

  @JsonKey(name: 'sync', defaultValue: false)
  late bool syncStreams;

  @JsonKey(name: 'imported', defaultValue: false)
  late bool imported;

  ///status only available for current user on /me
  @JsonKey(name: 'status', defaultValue: 0)
  late int status;
}

@JsonSerializable(createToJson: true)
class UserBan extends Object {
  UserBan();

  Map<String, dynamic> toJson() => _$UserBanToJson(this);

  factory UserBan.fromJson(Map<String, dynamic> json) =>
      _$UserBanFromJson(json);

  @JsonKey(name: 'createdAt')
  late DateTime createdAt;

  @JsonKey(name: 'active')
  late bool active;
}