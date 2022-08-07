part of statsfm.models;

@JsonSerializable(createToJson: false)
@LocalDateTimeConverter()
class ChatMessage extends Object {
  ChatMessage();

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'chatId')
  late String chatId;

  @JsonKey(name: 'content')
  late String content;

  @JsonKey(name: 'sentAt')
  late DateTime sentAt;

  @JsonKey(name: 'readAt')
  late DateTime? readAt;

  @JsonKey(name: 'fromId')
  late String fromId;

  @JsonKey(name: 'from')
  late UserPublic? from;

  @JsonKey(name: 'toId')
  late String toId;

  @JsonKey(name: 'to')
  late UserPublic? to;
}
