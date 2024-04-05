part of statsfm.models;

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class CatalogReport extends Object {
  CatalogReport();

  factory CatalogReport.fromJson(Map<String, dynamic> json) => _$CatalogReportFromJson(json);

  @JsonKey(name: 'id', required: true)
  late int id;

  @JsonKey(name: 'createdAt', required: true)
  late DateTime createdAt;

  @JsonKey(name: 'updatedAt', required: true)
  late DateTime updatedAt;

  @JsonKey(name: 'type', required: true)
  late CatalogType type;

  @JsonKey(name: 'typeId', required: true)
  late int typeId;

  @JsonKey(name: 'reason', required: true)
  late CatalogReportReason reason;

  @JsonKey(name: 'description')
  late String? description;

  @JsonKey(name: 'userId')
  late String? userId;
}

enum CatalogReportReason {
  @JsonValue("MISSING_ARTWORK")
  MISSING_ARTWORK,

  @JsonValue("WRONGLY_MERGED")
  WRONGLY_MERGED,

  @JsonValue("INCOMPLETE")
  INCOMPLETE,

  @JsonValue("DUPLICATE")
  DUPLICATE,

  @JsonValue("OTHER")
  OTHER
}

enum CatalogType {
  @JsonValue("ARTIST")
  ARTIST,

  @JsonValue("ALBUM")
  ALBUM,

  @JsonValue("TRACK")
  TRACK
}