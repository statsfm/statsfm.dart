part of statsfm.models;

@JsonSerializable(createToJson: false)
class UserPrivate extends UserPublic {
  UserPrivate();

  factory UserPrivate.fromJson(Map<String, dynamic> json) =>
      _$UserPrivateFromJson(json);

  @JsonKey(name: 'email')
  late String email;

  @JsonKey(name: 'country')
  late String country;
}

@JsonSerializable(createToJson: false)
class UserPublic extends Object {
  UserPublic();

  factory UserPublic.fromJson(Map<String, dynamic> json) =>
      _$UserPublicFromJson(json);

  @JsonKey(name: 'id')
  late String id;

  @JsonKey(name: 'customId')
  late String customId;

  @JsonKey(name: 'displayName')
  late String displayName;

  @JsonKey(name: 'image')
  late String image;

  @JsonKey(name: 'isPlus')
  late bool isPlus;

  @JsonKey(name: 'hasImported')
  late bool hasImported;

  @JsonKey(name: 'orderBy')
  late OrderBySetting orderBy;

  @JsonKey(name: 'privacySettings')
  late UserPrivacySettings? privacySettings;

  @JsonKey(name: 'profile')
  late UserProfile? profile;
}

enum OrderBySetting { PLATFORM, COUNT, TIME }

@JsonSerializable(createToJson: false)
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
  late String path;

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

@JsonSerializable(createToJson: false)
class UserPrivacySettings extends Object {
  UserPrivacySettings();

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
}

@JsonSerializable(createToJson: false)
class UserProfile extends Object {
  UserProfile();

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  @JsonKey(name: 'bio')
  late String bio;

  @JsonKey(name: 'pronouns')
  late String pronouns;
}
