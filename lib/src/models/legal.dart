part of statsfm.models;

@JsonSerializable(createToJson: false)
class LegalItems extends Object {
  LegalItems();

  factory LegalItems.fromJson(Map<String, dynamic> json) =>
      _$LegalItemsFromJson(json);

  @JsonKey(name: 'privacy', required: true)
  late LegalItem privacy;

  @JsonKey(name: 'terms', required: true)
  late LegalItem terms;
}

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class LegalItem extends Object {
  LegalItem();

  factory LegalItem.fromJson(Map<String, dynamic> json) =>
      _$LegalItemFromJson(json);

  @JsonKey(name: 'version', required: true)
  late int version;

  @JsonKey(name: 'url', required: true)
  late String url;

  @JsonKey(name: 'date', required: true)
  late DateTime date;

  @JsonKey(name: 'requiredAfter', required: true)
  late DateTime requiredAfter;
}
