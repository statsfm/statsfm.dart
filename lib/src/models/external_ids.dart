part of statsfm.models;

@JsonSerializable(createToJson: true)
class ExternalIds extends Object {
  ExternalIds();

  factory ExternalIds.fromJson(Map<String, dynamic> json) =>
      _$ExternalIdsFromJson(json);
  Map<String, dynamic> toJson() => _$ExternalIdsToJson(this);

  /// International Standard Recording Code
  @JsonKey(name: 'isrc')
  String? isrc;

  /// International Article Number
  @JsonKey(name: 'ean')
  String? ean;

  /// Universal Product Code
  @JsonKey(name: 'upc')
  String? upc;

  /// Spotify id
  @JsonKey(name: 'spotify')
  List<String>? spotify;

  /// Amazon Music id
  @JsonKey(name: 'amazonMusic')
  List<String>? amazonMusic;

  /// Deezer id
  @JsonKey(name: 'deezer')
  List<String>? deezer;

  /// Napster id
  @JsonKey(name: 'napster')
  List<String>? napster;

  /// Pandora id
  @JsonKey(name: 'pandora')
  List<String>? pandora;

  /// Soundcloud id
  @JsonKey(name: 'soundcloud')
  List<String>? soundcloud;

  /// Tidal id
  @JsonKey(name: 'tidal')
  List<String>? tidal;

  /// Youtube Music id
  @JsonKey(name: 'youtubeMusic')
  List<String>? youtubeMusic;

  /// Apple Music id
  @JsonKey(name: 'appleMusic')
  List<String>? appleMusic;
}
