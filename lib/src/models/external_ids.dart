part of statsfm.models;

@JsonSerializable(createToJson: false)
class ExternalIds extends Object {
  ExternalIds();

  factory ExternalIds.fromJson(Map<String, dynamic> json) =>
      _$ExternalIdsFromJson(json);

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
}
