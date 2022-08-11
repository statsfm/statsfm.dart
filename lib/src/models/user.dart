part of statsfm.models;

@JsonSerializable(createToJson: true)
class UserPrivate extends UserPublic {
  UserPrivate();

  Map<String, dynamic> toJson() => _$UserPrivateToJson(this);

  factory UserPrivate.fromJson(Map<String, dynamic> json) =>
      _$UserPrivateFromJson(json);

  @JsonKey(name: 'email')
  late String email;

  @JsonKey(name: 'country')
  late String country;

  @JsonKey(name: 'disabled')
  late bool disabled;
}

@JsonSerializable(createToJson: true)
class UserPublic extends Object {
  UserPublic();

  Map<String, dynamic> toJson() => _$UserPublicToJson(this);

  factory UserPublic.fromJson(Map<String, dynamic> json) =>
      _$UserPublicFromJson(json);

  @JsonKey(name: 'id')
  late String id;

  @JsonKey(name: 'customId')
  late String? customId;

  @JsonKey(name: 'displayName')
  late String displayName;

  @JsonKey(name: 'image')
  late String? image;

  @JsonKey(name: 'isPlus')
  late bool isPlus;

  @JsonKey(name: 'hasImported')
  late bool hasImported;

  @JsonKey(name: 'syncEnabled')
  late bool syncEnabled;

  @JsonKey(name: 'orderBy', defaultValue: OrderBySetting.PLATFORM)
  late OrderBySetting orderBy;

  @JsonKey(name: 'privacySettings')
  late UserPrivacySettings? privacySettings;

  @JsonKey(name: 'profile')
  late UserProfile? profile;

  @JsonKey(name: 'socialMediaConnections')
  late List<UserProfileSocialMediaConnection> socialMediaConnections;
}

enum OrderBySetting {
  @JsonValue("PLATFORM")
  PLATFORM,

  @JsonValue("COUNT")
  COUNT,

  @JsonValue("TIME")
  TIME
}

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class UserImport extends Object {
  UserImport();

  factory UserImport.fromJson(Map<String, dynamic> json) =>
      _$UserImportFromJson(json);

  @JsonKey(name: 'hash')
  late String hash;

  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'userId')
  late String userId;

  @JsonKey(name: 'path')
  late String? path;

  @JsonKey(name: 'count')
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

  @JsonKey(name: 'profile')
  late bool profile;

  @JsonKey(name: 'currentlyPlaying')
  late bool currentlyPlaying;

  @JsonKey(name: 'recentlyPlayed')
  late bool recentlyPlayed;

  @JsonKey(name: 'topTracks')
  late bool topTracks;

  @JsonKey(name: 'topArtists')
  late bool topArtists;

  @JsonKey(name: 'topAlbums')
  late bool topAlbums;

  @JsonKey(name: 'topGenres')
  late bool topGenres;

  @JsonKey(name: 'streams')
  late bool streams;

  @JsonKey(name: 'streamStats')
  late bool streamStats;

  @JsonKey(name: 'leaderboards')
  late bool leaderboards;
}

@JsonSerializable(createToJson: true)
class UserProfile extends Object {
  UserProfile();

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  @JsonKey(name: 'bio')
  late String bio;

  @JsonKey(name: 'pronouns')
  late String? pronouns;
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
  late String userId;

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
  late bool imports;

  @JsonKey(name: 'friends')
  late bool friends;

  @JsonKey(name: 'weeklySummary')
  late bool weeklySummary;

  @JsonKey(name: 'monthlySummary')
  late bool monthlySummary;

  @JsonKey(name: 'updates')
  late bool updates;
}
