part of statsfm.models;

enum SubscriptionFreeTrialStatus {
  @JsonValue('user-not-eligible')
  userNotEligible,
  @JsonValue('trial-already-ended')
  trialAlreadyEnded,
  @JsonValue('trial-already-activated')
  trialAlreadyActivated,
  @JsonValue('trial-successfully-activated')
  trialSuccessfullyActivated,
}

@JsonSerializable(createToJson: true)
@LocalDateTimeConverter()
class FreeTrial extends Object {
  FreeTrial();

  Map<String, dynamic> toJson() => _$FreeTrialToJson(this);

  factory FreeTrial.fromJson(Map<String, dynamic> json) =>
      _$FreeTrialFromJson(json);

  @JsonKey(name: 'status')
  late SubscriptionFreeTrialStatus? status;

  @JsonKey(name: 'trial')
  late FreeTrialDetails? trial;
}

@JsonSerializable(createToJson: true)
@LocalDateTimeConverter()
class FreeTrialDetails extends Object {
  FreeTrialDetails();

  Map<String, dynamic> toJson() => _$FreeTrialDetailsToJson(this);

  factory FreeTrialDetails.fromJson(Map<String, dynamic> json) =>
      _$FreeTrialDetailsFromJson(json);

  @JsonKey(name: 'id')
  late int? id;

  @JsonKey(name: 'userId')
  late String? userId;

  @JsonKey(name: 'createdAt')
  late DateTime? createdAt;

  @JsonKey(name: 'startedAt')
  late DateTime? startedAt;

  @JsonKey(name: 'updatedAt')
  late DateTime? updatedAt;

  @JsonKey(name: 'durationMs')
  late double? durationMs;

  @JsonKey(name: 'endsAt')
  late DateTime? endsAt;

  @JsonKey(name: 'endedAt')
  late DateTime? endedAt;
}
