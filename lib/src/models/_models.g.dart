// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RangeAdapter extends TypeAdapter<Range> {
  @override
  final int typeId = 1;

  @override
  Range read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Range.TODAY;
      case 1:
        return Range.DAYS;
      case 2:
        return Range.WEEKS;
      case 3:
        return Range.MONTHS;
      case 4:
        return Range.LIFETIME;
      default:
        return Range.TODAY;
    }
  }

  @override
  void write(BinaryWriter writer, Range obj) {
    switch (obj) {
      case Range.TODAY:
        writer.writeByte(0);
        break;
      case Range.DAYS:
        writer.writeByte(1);
        break;
      case Range.WEEKS:
        writer.writeByte(2);
        break;
      case Range.MONTHS:
        writer.writeByte(3);
        break;
      case Range.LIFETIME:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RangeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'type', 'artists'],
  );
  return Album()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..image = json['image'] as String?
    ..label = json['label'] as String?
    ..spotifyPopularity = json['spotifyPopularity'] as int? ?? 0
    ..totalTracks = json['totalTracks'] as int? ?? 0
    ..type = json['type'] as String
    ..releaseDate = dateTimeFromTimestamp(json['releaseDate'] as int)
    ..genres =
        (json['genres'] as List<dynamic>).map((e) => e as String).toList()
    ..artists = (json['artists'] as List<dynamic>)
        .map((e) => ArtistSimple.fromJson(e as Map<String, dynamic>))
        .toList()
    ..externalIds = json['externalIds'] == null
        ? null
        : ExternalIds.fromJson(json['externalIds'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'label': instance.label,
      'spotifyPopularity': instance.spotifyPopularity,
      'totalTracks': instance.totalTracks,
      'type': instance.type,
      'releaseDate': dateTimeToTimestamp(instance.releaseDate),
      'genres': instance.genres,
      'artists': instance.artists.map((e) => e.toJson()).toList(),
      'externalIds': instance.externalIds?.toJson(),
    };

AlbumSimple _$AlbumSimpleFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name'],
  );
  return AlbumSimple()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..image = json['image'] as String?;
}

Map<String, dynamic> _$AlbumSimpleToJson(AlbumSimple instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

TopAlbum _$TopAlbumFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['position', 'album'],
  );
  return TopAlbum()
    ..position = json['position'] as int
    ..streams = json['streams'] as int?
    ..playedMs = json['playedMs'] as int?
    ..indicator = $enumDecodeNullable(_$IndicatorEnumMap, json['indicator'])
    ..album = Album.fromJson(json['album'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TopAlbumToJson(TopAlbum instance) => <String, dynamic>{
      'position': instance.position,
      'streams': instance.streams,
      'playedMs': instance.playedMs,
      'indicator': _$IndicatorEnumMap[instance.indicator],
      'album': instance.album.toJson(),
    };

const _$IndicatorEnumMap = {
  Indicator.UP: 'UP',
  Indicator.DOWN: 'DOWN',
  Indicator.NEW: 'NEW',
  Indicator.SAME: 'SAME',
  Indicator.NONE: 'NONE',
};

SwipeTopAlbum _$SwipeTopAlbumFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['position', 'swipes', 'album'],
  );
  return SwipeTopAlbum()
    ..position = json['position'] as int
    ..swipes = json['swipes'] as int
    ..decision =
        SwipeDecision.fromJson(json['decision'] as Map<String, dynamic>)
    ..decisionMs =
        SwipeDecisionMs.fromJson(json['decisionMs'] as Map<String, dynamic>)
    ..album = Album.fromJson(json['album'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SwipeTopAlbumToJson(SwipeTopAlbum instance) =>
    <String, dynamic>{
      'position': instance.position,
      'swipes': instance.swipes,
      'decision': instance.decision.toJson(),
      'decisionMs': instance.decisionMs.toJson(),
      'album': instance.album.toJson(),
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name'],
  );
  return Artist()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..followers = json['followers'] as int? ?? 0
    ..image = json['image'] as String?
    ..spotifyPopularity = json['spotifyPopularity'] as int? ?? 0
    ..genres =
        (json['genres'] as List<dynamic>).map((e) => e as String).toList()
    ..externalIds = json['externalIds'] == null
        ? null
        : ExternalIds.fromJson(json['externalIds'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'followers': instance.followers,
      'image': instance.image,
      'spotifyPopularity': instance.spotifyPopularity,
      'genres': instance.genres,
      'externalIds': instance.externalIds?.toJson(),
    };

ArtistSimple _$ArtistSimpleFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name'],
  );
  return ArtistSimple()
    ..id = json['id'] as int
    ..name = json['name'] as String;
}

Map<String, dynamic> _$ArtistSimpleToJson(ArtistSimple instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TopArtist _$TopArtistFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['position', 'artist'],
  );
  return TopArtist()
    ..position = json['position'] as int
    ..streams = json['streams'] as int?
    ..playedMs = json['playedMs'] as int?
    ..indicator = $enumDecodeNullable(_$IndicatorEnumMap, json['indicator'])
    ..artist = Artist.fromJson(json['artist'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TopArtistToJson(TopArtist instance) => <String, dynamic>{
      'position': instance.position,
      'streams': instance.streams,
      'playedMs': instance.playedMs,
      'indicator': _$IndicatorEnumMap[instance.indicator],
      'artist': instance.artist.toJson(),
    };

SwipeTopArtist _$SwipeTopArtistFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['position', 'swipes', 'artist'],
  );
  return SwipeTopArtist()
    ..position = json['position'] as int
    ..swipes = json['swipes'] as int
    ..decision =
        SwipeDecision.fromJson(json['decision'] as Map<String, dynamic>)
    ..decisionMs =
        SwipeDecisionMs.fromJson(json['decisionMs'] as Map<String, dynamic>)
    ..artist = Artist.fromJson(json['artist'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SwipeTopArtistToJson(SwipeTopArtist instance) =>
    <String, dynamic>{
      'position': instance.position,
      'swipes': instance.swipes,
      'decision': instance.decision.toJson(),
      'decisionMs': instance.decisionMs.toJson(),
      'artist': instance.artist.toJson(),
    };

AudioFeature _$AudioFeatureFromJson(Map<String, dynamic> json) => AudioFeature()
  ..acousticness = (json['acousticness'] as num?)?.toDouble()
  ..analysisUrl = json['analysis_url'] as String?
  ..danceability = (json['danceability'] as num?)?.toDouble()
  ..durationMs = json['duration_ms'] as int?
  ..energy = (json['energy'] as num?)?.toDouble()
  ..id = json['id'] as String?
  ..instrumentalness = (json['instrumentalness'] as num?)?.toDouble()
  ..key = json['key'] as int?
  ..liveness = (json['liveness'] as num?)?.toDouble()
  ..loudness = (json['loudness'] as num?)?.toDouble()
  ..mode = json['mode'] as int?
  ..speechiness = (json['speechiness'] as num?)?.toDouble()
  ..tempo = (json['tempo'] as num?)?.toDouble()
  ..timeSignature = json['time_signature'] as int?
  ..valence = (json['valence'] as num?)?.toDouble();

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage()
  ..id = json['id'] as int
  ..chatId = json['chatId'] as String?
  ..content = json['content'] as String
  ..sentAt = const LocalDateTimeConverter().fromJson(json['sentAt'] as String)
  ..readAt = _$JsonConverterFromJson<String, DateTime>(
      json['readAt'], const LocalDateTimeConverter().fromJson)
  ..fromId = json['fromId'] as String
  ..from = json['from'] == null
      ? null
      : UserPublic.fromJson(json['from'] as Map<String, dynamic>)
  ..toId = json['toId'] as String
  ..to = json['to'] == null
      ? null
      : UserPublic.fromJson(json['to'] as Map<String, dynamic>);

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

ArtistRecord _$ArtistRecordFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'type', 'userId', 'createdAt', 'artistId'],
  );
  return ArtistRecord()
    ..id = json['id'] as int
    ..type = $enumDecode(_$RecordTypeEnumMap, json['type'])
    ..active = json['active'] as bool? ?? false
    ..userId = json['userId'] as String
    ..createdAt =
        const LocalDateTimeConverter().fromJson(json['createdAt'] as String)
    ..artistId = json['artistId'] as int;
}

const _$RecordTypeEnumMap = {
  RecordType.PLATINUM: 'PLATINUM',
  RecordType.GOLD: 'GOLD',
  RecordType.SILVER: 'SILVER',
  RecordType.BRONZE: 'BRONZE',
};

Record _$RecordFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'type', 'userId', 'createdAt'],
  );
  return Record()
    ..id = json['id'] as int
    ..type = $enumDecode(_$RecordTypeEnumMap, json['type'])
    ..active = json['active'] as bool? ?? false
    ..userId = json['userId'] as String
    ..createdAt =
        const LocalDateTimeConverter().fromJson(json['createdAt'] as String);
}

DatabaseSizeStatsfm _$DatabaseSizeStatsfmFromJson(Map<String, dynamic> json) =>
    DatabaseSizeStatsfm()
      ..users = DatabaseSizeItem.fromJson(json['users'] as Map<String, dynamic>)
      ..plusUsers =
          DatabaseSizeItem.fromJson(json['plusUsers'] as Map<String, dynamic>)
      ..streams =
          DatabaseSizeItem.fromJson(json['streams'] as Map<String, dynamic>)
      ..tracks =
          DatabaseSizeItem.fromJson(json['tracks'] as Map<String, dynamic>)
      ..artists =
          DatabaseSizeItem.fromJson(json['artists'] as Map<String, dynamic>)
      ..albums =
          DatabaseSizeItem.fromJson(json['albums'] as Map<String, dynamic>);

DatabaseSizeSwipefy _$DatabaseSizeSwipefyFromJson(Map<String, dynamic> json) =>
    DatabaseSizeSwipefy()
      ..users = DatabaseSizeItem.fromJson(json['users'] as Map<String, dynamic>)
      ..proUsers =
          DatabaseSizeItem.fromJson(json['proUsers'] as Map<String, dynamic>)
      ..swipes =
          DatabaseSizeItem.fromJson(json['swipes'] as Map<String, dynamic>)
      ..tracks =
          DatabaseSizeItem.fromJson(json['tracks'] as Map<String, dynamic>)
      ..artists =
          DatabaseSizeItem.fromJson(json['artists'] as Map<String, dynamic>)
      ..albums =
          DatabaseSizeItem.fromJson(json['albums'] as Map<String, dynamic>);

DatabaseSizeItem _$DatabaseSizeItemFromJson(Map<String, dynamic> json) =>
    DatabaseSizeItem()
      ..current = DatabaseSizeItemCount.fromJson(
          json['current'] as Map<String, dynamic>)
      ..previous = DatabaseSizeItemCount.fromJson(
          json['previous'] as Map<String, dynamic>);

DatabaseSizeItemCount _$DatabaseSizeItemCountFromJson(
        Map<String, dynamic> json) =>
    DatabaseSizeItemCount()
      ..count = json['count'] as int
      ..date = const LocalDateTimeConverter().fromJson(json['date'] as String);

StatsfmError _$StatsfmErrorFromJson(Map<String, dynamic> json) => StatsfmError()
  ..status = json['status'] as int
  ..path = json['path'] as String
  ..message = json['message'] as String;

ExternalIds _$ExternalIdsFromJson(Map<String, dynamic> json) => ExternalIds()
  ..isrc = json['isrc'] as String?
  ..ean = json['ean'] as String?
  ..upc = json['upc'] as String?
  ..spotify =
      (json['spotify'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..amazonMusic =
      (json['amazonMusic'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..deezer =
      (json['deezer'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..napster =
      (json['napster'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..pandora =
      (json['pandora'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..soundcloud =
      (json['soundcloud'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..tidal = (json['tidal'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..youtubeMusic =
      (json['youtubeMusic'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..appleMusic =
      (json['appleMusic'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$ExternalIdsToJson(ExternalIds instance) =>
    <String, dynamic>{
      'isrc': instance.isrc,
      'ean': instance.ean,
      'upc': instance.upc,
      'spotify': instance.spotify,
      'amazonMusic': instance.amazonMusic,
      'deezer': instance.deezer,
      'napster': instance.napster,
      'pandora': instance.pandora,
      'soundcloud': instance.soundcloud,
      'tidal': instance.tidal,
      'youtubeMusic': instance.youtubeMusic,
      'appleMusic': instance.appleMusic,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre()
  ..tag = json['tag'] as String?
  ..artists = (json['artists'] as List<dynamic>)
      .map((e) => Artist.fromJson(e as Map<String, dynamic>))
      .toList()
  ..related = (json['related'] as List<dynamic>)
      .map((e) => GenreSimple.fromJson(e as Map<String, dynamic>))
      .toList()
  ..sub = (json['sub'] as List<dynamic>)
      .map((e) => GenreSimple.fromJson(e as Map<String, dynamic>))
      .toList();

GenreSimple _$GenreSimpleFromJson(Map<String, dynamic> json) =>
    GenreSimple()..tag = json['tag'] as String?;

TopGenre _$TopGenreFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['position'],
  );
  return TopGenre()
    ..position = json['position'] as int
    ..streams = json['streams'] as int?
    ..playedMs = json['playedMs'] as int?
    ..indicator = $enumDecodeNullable(_$IndicatorEnumMap, json['indicator'])
    ..genre = GenreSimple.fromJson(json['genre'] as Map<String, dynamic>)
    ..artistCount = json['artistCount'] as int?;
}

SearchResults _$SearchResultsFromJson(Map<String, dynamic> json) =>
    SearchResults()
      ..tracks = (json['tracks'] as List<dynamic>?)
              ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..artists = (json['artists'] as List<dynamic>?)
              ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..albums = (json['albums'] as List<dynamic>?)
              ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..users = (json['users'] as List<dynamic>?)
              ?.map((e) => UserPublic.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Soulmate _$SoulmateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['user', 'artists'],
  );
  return Soulmate()
    ..recommendationId = json['recommendationId'] as String?
    ..user = UserPublic.fromJson(json['user'] as Map<String, dynamic>)
    ..artists = (json['artists'] as List<dynamic>)
        .map((e) => TopArtist.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$SoulmateToJson(Soulmate instance) => <String, dynamic>{
      'recommendationId': instance.recommendationId,
      'user': instance.user,
      'artists': instance.artists,
    };

SoulmateSwipe _$SoulmateSwipeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['recommendationId', 'decision'],
  );
  return SoulmateSwipe()
    ..recommendationId = json['recommendationId'] as String
    ..decision = json['decision'] as String
    ..decisionMs = json['decisionMs'] as int? ?? -1;
}

Map<String, dynamic> _$SoulmateSwipeToJson(SoulmateSwipe instance) =>
    <String, dynamic>{
      'recommendationId': instance.recommendationId,
      'decision': instance.decision,
      'decisionMs': instance.decisionMs,
    };

SoulmateMatch _$SoulmateMatchFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['createdAt', 'user', 'recommendationId'],
  );
  return SoulmateMatch()
    ..createdAt =
        const LocalDateTimeConverter().fromJson(json['createdAt'] as String)
    ..user = UserPublic.fromJson(json['user'] as Map<String, dynamic>)
    ..recommendationId = json['recommendationId'] as String;
}

Map<String, dynamic> _$SoulmateMatchToJson(SoulmateMatch instance) =>
    <String, dynamic>{
      'createdAt': const LocalDateTimeConverter().toJson(instance.createdAt),
      'user': instance.user,
      'recommendationId': instance.recommendationId,
    };

Stream _$StreamFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'userId', 'trackId', 'trackName', 'artistIds'],
  );
  return Stream()
    ..id = json['id'] as String
    ..userId = json['userId'] as String
    ..endTime =
        const LocalDateTimeConverter().fromJson(json['endTime'] as String)
    ..playedMs = json['playedMs'] as int
    ..trackId = json['trackId'] as int
    ..trackName = json['trackName'] as String
    ..artists =
        (json['artistIds'] as List<dynamic>).map((e) => e as int).toList()
    ..albumId = json['albumId'] as int?
    ..importId = json['importId'] as int?;
}

Swipe _$SwipeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'createdAt', 'decision', 'track'],
  );
  return Swipe()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..decision = json['decision'] as String
    ..decisionMs = json['decisionMs'] as int? ?? 0
    ..algorithmId = json['algorithmId'] as int
    ..track = Track.fromJson(json['track'] as Map<String, dynamic>)
    ..collections = (json['collections'] as List<dynamic>?)
            ?.map((e) =>
                SwipeCollectionSimple.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
}

SwipeStats _$SwipeStatsFromJson(Map<String, dynamic> json) => SwipeStats()
  ..decision = SwipeDecision.fromJson(json['decision'] as Map<String, dynamic>)
  ..decisionMs =
      SwipeDecisionMs.fromJson(json['decisionMs'] as Map<String, dynamic>)
  ..count = json['count'] as int
  ..cardinality =
      SwipeCardinality.fromJson(json['cardinality'] as Map<String, dynamic>);

Map<String, dynamic> _$SwipeStatsToJson(SwipeStats instance) =>
    <String, dynamic>{
      'decision': instance.decision.toJson(),
      'decisionMs': instance.decisionMs.toJson(),
      'count': instance.count,
      'cardinality': instance.cardinality.toJson(),
    };

SwipeDecision _$SwipeDecisionFromJson(Map<String, dynamic> json) =>
    SwipeDecision()
      ..liked = json['liked'] as int? ?? 0
      ..disliked = json['disliked'] as int? ?? 0
      ..skips = json['skips'] as int? ?? 0;

Map<String, dynamic> _$SwipeDecisionToJson(SwipeDecision instance) =>
    <String, dynamic>{
      'liked': instance.liked,
      'disliked': instance.disliked,
      'skips': instance.skips,
    };

SwipeDecisionMs _$SwipeDecisionMsFromJson(Map<String, dynamic> json) =>
    SwipeDecisionMs()
      ..min = json['min'] as int?
      ..max = json['max'] as int?
      ..avg = (json['avg'] as num?)?.toDouble()
      ..sum = json['sum'] as int;

Map<String, dynamic> _$SwipeDecisionMsToJson(SwipeDecisionMs instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'avg': instance.avg,
      'sum': instance.sum,
    };

SwipeCardinality _$SwipeCardinalityFromJson(Map<String, dynamic> json) =>
    SwipeCardinality()
      ..tracks = json['tracks'] as int?
      ..artists = json['artists'] as int?
      ..albums = json['albums'] as int?
      ..users = json['users'] as int?;

Map<String, dynamic> _$SwipeCardinalityToJson(SwipeCardinality instance) =>
    <String, dynamic>{
      'tracks': instance.tracks,
      'artists': instance.artists,
      'albums': instance.albums,
      'users': instance.users,
    };

SwipeCollection _$SwipeCollectionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'swipeCount', 'createdAt', 'userId'],
  );
  return SwipeCollection()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..description = json['description'] as String?
    ..image = json['image'] as String?
    ..swipeCount = json['swipeCount'] as int
    ..public = json['public'] as bool? ?? true
    ..createdAt =
        const LocalDateTimeConverter().fromJson(json['createdAt'] as String)
    ..updatedAt =
        const LocalDateTimeConverter().fromJson(json['updatedAt'] as String)
    ..spotifySync = json['spotifySync'] == null
        ? null
        : SwipeCollectionSpotifySync.fromJson(
            json['spotifySync'] as Map<String, dynamic>)
    ..userId = json['userId'] as String;
}

SwipeCollectionSimple _$SwipeCollectionSimpleFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'addedAt'],
  );
  return SwipeCollectionSimple()
    ..id = json['id'] as int
    ..addedAt =
        const LocalDateTimeConverter().fromJson(json['addedAt'] as String);
}

Map<String, dynamic> _$SwipeCollectionSimpleToJson(
        SwipeCollectionSimple instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addedAt': const LocalDateTimeConverter().toJson(instance.addedAt),
    };

SwipeCollectionSpotifySync _$SwipeCollectionSpotifySyncFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'collectionId',
      'spotifyId',
      'createdAt',
      'syncedAt',
      'userId'
    ],
  );
  return SwipeCollectionSpotifySync()
    ..collectionId = json['collectionId'] as int
    ..spotifyId = json['spotifyId'] as String
    ..syncEnabled = json['syncEnabled'] as bool? ?? false
    ..createdAt =
        const LocalDateTimeConverter().fromJson(json['createdAt'] as String)
    ..syncedAt =
        const LocalDateTimeConverter().fromJson(json['syncedAt'] as String)
    ..userId = json['userId'] as String;
}

RecommendedSwipe _$RecommendedSwipeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['swipeId', 'recommendationId', 'track'],
  );
  return RecommendedSwipe()
    ..id = json['swipeId'] as String
    ..recommendationId = json['recommendationId'] as String
    ..track = Track.fromJson(json['track'] as Map<String, dynamic>)
    ..metadata = json['metadata'] == null
        ? null
        : SwipeMetadata.fromJson(json['metadata'] as Map<String, dynamic>);
}

SwipeMetadata _$SwipeMetadataFromJson(Map<String, dynamic> json) =>
    SwipeMetadata()
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String);

FriendSwipe _$FriendSwipeFromJson(Map<String, dynamic> json) => FriendSwipe()
  ..user = UserPublic.fromJson(json['user'] as Map<String, dynamic>)
  ..swipe = Swipe.fromJson(json['swipe'] as Map<String, dynamic>);

PerDayStats _$PerDayStatsFromJson(Map<String, dynamic> json) => PerDayStats()
  ..average =
      StreamStatsWithPrecision.fromJson(json['average'] as Map<String, dynamic>)
  ..days = (json['days'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(
        DateTime.parse(k), StreamStats.fromJson(e as Map<String, dynamic>)),
  );

DateStats _$DateStatsFromJson(Map<String, dynamic> json) => DateStats()
  ..hours = (json['hours'] as Map<String, dynamic>).map(
    (k, e) =>
        MapEntry(int.parse(k), StreamStats.fromJson(e as Map<String, dynamic>)),
  )
  ..weekDays = (json['weekDays'] as Map<String, dynamic>).map(
    (k, e) =>
        MapEntry(int.parse(k), StreamStats.fromJson(e as Map<String, dynamic>)),
  )
  ..monthDays = (json['monthDays'] as Map<String, dynamic>).map(
    (k, e) =>
        MapEntry(int.parse(k), StreamStats.fromJson(e as Map<String, dynamic>)),
  )
  ..months = (json['months'] as Map<String, dynamic>).map(
    (k, e) =>
        MapEntry(int.parse(k), StreamStats.fromJson(e as Map<String, dynamic>)),
  )
  ..years = (json['years'] as Map<String, dynamic>).map(
    (k, e) =>
        MapEntry(int.parse(k), StreamStats.fromJson(e as Map<String, dynamic>)),
  );

ExtendedStreamStats _$ExtendedStreamStatsFromJson(Map<String, dynamic> json) =>
    ExtendedStreamStats()
      ..durationMs = json['durationMs'] as int? ?? 0
      ..count = json['count'] as int? ?? 0
      ..cumulative = json['cumulative'] == null
          ? null
          : CumulativeStreamStats.fromJson(
              json['cumulative'] as Map<String, dynamic>)
      ..cardinality = ExtendedStreamStatsCardinality.fromJson(
          json['cardinality'] as Map<String, dynamic>);

ExtendedStreamStatsCardinality _$ExtendedStreamStatsCardinalityFromJson(
        Map<String, dynamic> json) =>
    ExtendedStreamStatsCardinality()
      ..tracks = json['tracks'] as int
      ..artists = json['artists'] as int
      ..albums = json['albums'] as int;

StreamStats _$StreamStatsFromJson(Map<String, dynamic> json) => StreamStats()
  ..durationMs = json['durationMs'] as int? ?? 0
  ..count = json['count'] as int? ?? 0
  ..cumulative = json['cumulative'] == null
      ? null
      : CumulativeStreamStats.fromJson(
          json['cumulative'] as Map<String, dynamic>);

CumulativeStreamStats _$CumulativeStreamStatsFromJson(
        Map<String, dynamic> json) =>
    CumulativeStreamStats()
      ..durationMs = json['durationMs'] as int? ?? 0
      ..count = json['count'] as int? ?? 0;

StreamStatsWithPrecision _$StreamStatsWithPrecisionFromJson(
        Map<String, dynamic> json) =>
    StreamStatsWithPrecision()
      ..durationMs = (json['durationMs'] as num?)?.toDouble() ?? 0
      ..count = (json['count'] as num?)?.toDouble() ?? 0;

TopObject _$TopObjectFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['position'],
  );
  return TopObject()
    ..position = json['position'] as int
    ..streams = json['streams'] as int?
    ..playedMs = json['playedMs'] as int?
    ..indicator = $enumDecodeNullable(_$IndicatorEnumMap, json['indicator']);
}

SwipeTopObject _$SwipeTopObjectFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['position', 'swipes'],
  );
  return SwipeTopObject()
    ..position = json['position'] as int
    ..swipes = json['swipes'] as int
    ..decision =
        SwipeDecision.fromJson(json['decision'] as Map<String, dynamic>)
    ..decisionMs =
        SwipeDecisionMs.fromJson(json['decisionMs'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SwipeTopObjectToJson(SwipeTopObject instance) =>
    <String, dynamic>{
      'position': instance.position,
      'swipes': instance.swipes,
      'decision': instance.decision.toJson(),
      'decisionMs': instance.decisionMs.toJson(),
    };

Track _$TrackFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'artists', 'albums'],
  );
  return Track()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..explicit = json['explicit'] as bool
    ..durationMs = json['durationMs'] as int
    ..spotifyPopularity = json['spotifyPopularity'] as int?
    ..spotifyPreview = json['spotifyPreview'] as String?
    ..artists = (json['artists'] as List<dynamic>)
        .map((e) => ArtistSimple.fromJson(e as Map<String, dynamic>))
        .toList()
    ..albums = (json['albums'] as List<dynamic>)
        .map((e) => AlbumSimple.fromJson(e as Map<String, dynamic>))
        .toList()
    ..externalIds = json['externalIds'] == null
        ? null
        : ExternalIds.fromJson(json['externalIds'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'explicit': instance.explicit,
      'durationMs': instance.durationMs,
      'spotifyPopularity': instance.spotifyPopularity,
      'spotifyPreview': instance.spotifyPreview,
      'artists': instance.artists.map((e) => e.toJson()).toList(),
      'albums': instance.albums.map((e) => e.toJson()).toList(),
      'externalIds': instance.externalIds?.toJson(),
    };

CurrentlyStreamingTrack _$CurrentlyStreamingTrackFromJson(
        Map<String, dynamic> json) =>
    CurrentlyStreamingTrack()
      ..date = const LocalDateTimeConverter().fromJson(json['date'] as String)
      ..isPlaying = json['isPlaying'] as bool? ?? false
      ..progressMs = json['progressMs'] as int
      ..deviceName = json['deviceName'] as String?
      ..platform = json['platform'] as String
      ..track = Track.fromJson(json['track'] as Map<String, dynamic>);

RecentlyStreamedTrack _$RecentlyStreamedTrackFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['endTime', 'track'],
  );
  return RecentlyStreamedTrack()
    ..endTime =
        const LocalDateTimeConverter().fromJson(json['endTime'] as String)
    ..platform = json['platform'] as String? ?? 'spotify'
    ..track = Track.fromJson(json['track'] as Map<String, dynamic>);
}

TopTrack _$TopTrackFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['position', 'track'],
  );
  return TopTrack()
    ..position = json['position'] as int
    ..streams = json['streams'] as int?
    ..playedMs = json['playedMs'] as int?
    ..indicator = $enumDecodeNullable(_$IndicatorEnumMap, json['indicator'])
    ..track = Track.fromJson(json['track'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TopTrackToJson(TopTrack instance) => <String, dynamic>{
      'position': instance.position,
      'streams': instance.streams,
      'playedMs': instance.playedMs,
      'indicator': _$IndicatorEnumMap[instance.indicator],
      'track': instance.track.toJson(),
    };

SwipeTopTrack _$SwipeTopTrackFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['position', 'swipes', 'track'],
  );
  return SwipeTopTrack()
    ..position = json['position'] as int
    ..swipes = json['swipes'] as int
    ..decision =
        SwipeDecision.fromJson(json['decision'] as Map<String, dynamic>)
    ..decisionMs =
        SwipeDecisionMs.fromJson(json['decisionMs'] as Map<String, dynamic>)
    ..track = Track.fromJson(json['track'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SwipeTopTrackToJson(SwipeTopTrack instance) =>
    <String, dynamic>{
      'position': instance.position,
      'swipes': instance.swipes,
      'decision': instance.decision.toJson(),
      'decisionMs': instance.decisionMs.toJson(),
      'track': instance.track.toJson(),
    };

UserPrivate _$UserPrivateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'customId',
      'displayName',
      'createdAt',
      'image',
      'isPlus',
      'isPro'
    ],
  );
  return UserPrivate()
    ..id = json['id'] as String
    ..customId = json['customId'] as String
    ..displayName = json['displayName'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..image = json['image'] as String?
    ..isPlus = json['isPlus'] as bool? ?? false
    ..isPro = json['isPro'] as bool? ?? false
    ..hasSwipefy = json['hasSwipefy'] as bool? ?? false
    ..firstSwipe = json['firstSwipe'] == null
        ? null
        : DateTime.parse(json['firstSwipe'] as String)
    ..lastSwipe = json['lastSwipe'] == null
        ? null
        : DateTime.parse(json['lastSwipe'] as String)
    ..hasImported = json['hasImported'] as bool? ?? false
    ..syncEnabled = json['syncEnabled'] as bool? ?? false
    ..timezone = json['timezone'] as String?
    ..orderBy = $enumDecodeNullable(_$OrderBySettingEnumMap, json['orderBy']) ??
        OrderBySetting.PLATFORM
    ..privacySettings = json['privacySettings'] == null
        ? null
        : UserPrivacySettings.fromJson(
            json['privacySettings'] as Map<String, dynamic>)
    ..profile = json['profile'] == null
        ? null
        : UserProfile.fromJson(json['profile'] as Map<String, dynamic>)
    ..socialMediaConnections = (json['socialMediaConnections'] as List<dynamic>)
        .map((e) => UserProfileSocialMediaConnection.fromJson(
            e as Map<String, dynamic>))
        .toList()
    ..userBan = json['userBan'] == null
        ? null
        : UserBan.fromJson(json['userBan'] as Map<String, dynamic>)
    ..quarantined = json['quarantined'] as bool? ?? false
    ..recentlyActive = json['recentlyActive'] as bool? ?? false
    ..spotifyAuth = json['spotifyAuth'] == null
        ? null
        : SpotifyAuth.fromJson(json['spotifyAuth'] as Map<String, dynamic>)
    ..appleMusicAuth = json['appleMusicAuth'] == null
        ? null
        : AppleMusicAuth.fromJson(
            json['appleMusicAuth'] as Map<String, dynamic>)
    ..email = json['email'] as String?
    ..country = json['country'] as String
    ..disabled = json['disabled'] as bool? ?? false;
}

Map<String, dynamic> _$UserPrivateToJson(UserPrivate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customId': instance.customId,
      'displayName': instance.displayName,
      'createdAt': instance.createdAt.toIso8601String(),
      'image': instance.image,
      'isPlus': instance.isPlus,
      'isPro': instance.isPro,
      'hasSwipefy': instance.hasSwipefy,
      'firstSwipe': instance.firstSwipe?.toIso8601String(),
      'lastSwipe': instance.lastSwipe?.toIso8601String(),
      'hasImported': instance.hasImported,
      'syncEnabled': instance.syncEnabled,
      'timezone': instance.timezone,
      'orderBy': _$OrderBySettingEnumMap[instance.orderBy]!,
      'privacySettings': instance.privacySettings,
      'profile': instance.profile,
      'socialMediaConnections': instance.socialMediaConnections,
      'userBan': instance.userBan,
      'quarantined': instance.quarantined,
      'recentlyActive': instance.recentlyActive,
      'spotifyAuth': instance.spotifyAuth,
      'appleMusicAuth': instance.appleMusicAuth,
      'email': instance.email,
      'country': instance.country,
      'disabled': instance.disabled,
    };

const _$OrderBySettingEnumMap = {
  OrderBySetting.PLATFORM: 'PLATFORM',
  OrderBySetting.COUNT: 'COUNT',
  OrderBySetting.TIME: 'TIME',
  OrderBySetting.SPOTIFY: 'SPOTIFY',
  OrderBySetting.APPLEMUSIC: 'APPLEMUSIC',
};

UserPublic _$UserPublicFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'customId',
      'displayName',
      'createdAt',
      'image',
      'isPlus',
      'isPro'
    ],
  );
  return UserPublic()
    ..id = json['id'] as String
    ..customId = json['customId'] as String
    ..displayName = json['displayName'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..image = json['image'] as String?
    ..isPlus = json['isPlus'] as bool? ?? false
    ..isPro = json['isPro'] as bool? ?? false
    ..hasSwipefy = json['hasSwipefy'] as bool? ?? false
    ..firstSwipe = json['firstSwipe'] == null
        ? null
        : DateTime.parse(json['firstSwipe'] as String)
    ..lastSwipe = json['lastSwipe'] == null
        ? null
        : DateTime.parse(json['lastSwipe'] as String)
    ..hasImported = json['hasImported'] as bool? ?? false
    ..syncEnabled = json['syncEnabled'] as bool? ?? false
    ..timezone = json['timezone'] as String?
    ..orderBy = $enumDecodeNullable(_$OrderBySettingEnumMap, json['orderBy']) ??
        OrderBySetting.PLATFORM
    ..privacySettings = json['privacySettings'] == null
        ? null
        : UserPrivacySettings.fromJson(
            json['privacySettings'] as Map<String, dynamic>)
    ..profile = json['profile'] == null
        ? null
        : UserProfile.fromJson(json['profile'] as Map<String, dynamic>)
    ..socialMediaConnections = (json['socialMediaConnections'] as List<dynamic>)
        .map((e) => UserProfileSocialMediaConnection.fromJson(
            e as Map<String, dynamic>))
        .toList()
    ..userBan = json['userBan'] == null
        ? null
        : UserBan.fromJson(json['userBan'] as Map<String, dynamic>)
    ..quarantined = json['quarantined'] as bool? ?? false
    ..recentlyActive = json['recentlyActive'] as bool? ?? false
    ..spotifyAuth = json['spotifyAuth'] == null
        ? null
        : SpotifyAuth.fromJson(json['spotifyAuth'] as Map<String, dynamic>)
    ..appleMusicAuth = json['appleMusicAuth'] == null
        ? null
        : AppleMusicAuth.fromJson(
            json['appleMusicAuth'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserPublicToJson(UserPublic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customId': instance.customId,
      'displayName': instance.displayName,
      'createdAt': instance.createdAt.toIso8601String(),
      'image': instance.image,
      'isPlus': instance.isPlus,
      'isPro': instance.isPro,
      'hasSwipefy': instance.hasSwipefy,
      'firstSwipe': instance.firstSwipe?.toIso8601String(),
      'lastSwipe': instance.lastSwipe?.toIso8601String(),
      'hasImported': instance.hasImported,
      'syncEnabled': instance.syncEnabled,
      'timezone': instance.timezone,
      'orderBy': _$OrderBySettingEnumMap[instance.orderBy]!,
      'privacySettings': instance.privacySettings,
      'profile': instance.profile,
      'socialMediaConnections': instance.socialMediaConnections,
      'userBan': instance.userBan,
      'quarantined': instance.quarantined,
      'recentlyActive': instance.recentlyActive,
      'spotifyAuth': instance.spotifyAuth,
      'appleMusicAuth': instance.appleMusicAuth,
    };

UserImport _$UserImportFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'userId'],
  );
  return UserImport()
    ..hash = json['hash'] as String
    ..id = json['id'] as int
    ..userId = json['userId'] as String
    ..path = json['path'] as String?
    ..count = json['count'] as int? ?? 0
    ..status = json['status'] as int
    ..updatedAt =
        const LocalDateTimeConverter().fromJson(json['updatedAt'] as String)
    ..createdAt =
        const LocalDateTimeConverter().fromJson(json['createdAt'] as String)
    ..serverId = json['serverId'] as int
    ..error = json['error'] as String?
    ..name = json['name'] as String?;
}

UserPrivacySettings _$UserPrivacySettingsFromJson(Map<String, dynamic> json) =>
    UserPrivacySettings()
      ..profile = json['profile'] as bool? ?? true
      ..message = json['message'] as bool? ?? true
      ..currentlyPlaying = json['currentlyPlaying'] as bool? ?? true
      ..recentlyPlayed = json['recentlyPlayed'] as bool? ?? true
      ..topTracks = json['topTracks'] as bool? ?? true
      ..topArtists = json['topArtists'] as bool? ?? true
      ..topAlbums = json['topAlbums'] as bool? ?? true
      ..topGenres = json['topGenres'] as bool? ?? true
      ..streams = json['streams'] as bool? ?? true
      ..streamStats = json['streamStats'] as bool? ?? true
      ..leaderboards = json['leaderboards'] as bool? ?? true
      ..connections = json['connections'] as bool? ?? true
      ..friends = json['friends'] as bool? ?? true
      ..soulmates = json['soulmates'] as bool? ?? true;

Map<String, dynamic> _$UserPrivacySettingsToJson(
        UserPrivacySettings instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'message': instance.message,
      'currentlyPlaying': instance.currentlyPlaying,
      'recentlyPlayed': instance.recentlyPlayed,
      'topTracks': instance.topTracks,
      'topArtists': instance.topArtists,
      'topAlbums': instance.topAlbums,
      'topGenres': instance.topGenres,
      'streams': instance.streams,
      'streamStats': instance.streamStats,
      'leaderboards': instance.leaderboards,
      'connections': instance.connections,
      'friends': instance.friends,
      'soulmates': instance.soulmates,
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['bio'],
  );
  return UserProfile()
    ..bio = json['bio'] as String
    ..pronouns = json['pronouns'] as String?
    ..theme = json['theme'] as String?;
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'pronouns': instance.pronouns,
      'theme': instance.theme,
    };

IncomingFriendRequest _$IncomingFriendRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['from', 'createdAt'],
  );
  return IncomingFriendRequest()
    ..friend = UserPublic.fromJson(json['from'] as Map<String, dynamic>)
    ..createdAt =
        const LocalDateTimeConverter().fromJson(json['createdAt'] as String);
}

Map<String, dynamic> _$IncomingFriendRequestToJson(
        IncomingFriendRequest instance) =>
    <String, dynamic>{
      'from': instance.friend,
      'createdAt': const LocalDateTimeConverter().toJson(instance.createdAt),
    };

OutgoingFriendRequest _$OutgoingFriendRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['to', 'createdAt'],
  );
  return OutgoingFriendRequest()
    ..friend = UserPublic.fromJson(json['to'] as Map<String, dynamic>)
    ..createdAt =
        const LocalDateTimeConverter().fromJson(json['createdAt'] as String);
}

Map<String, dynamic> _$OutgoingFriendRequestToJson(
        OutgoingFriendRequest instance) =>
    <String, dynamic>{
      'to': instance.friend,
      'createdAt': const LocalDateTimeConverter().toJson(instance.createdAt),
    };

UserStatus _$UserStatusFromJson(Map<String, dynamic> json) => UserStatus()
  ..status = $enumDecodeNullable(_$FriendStatusEnumMap, json['status']) ??
      FriendStatus.NONE
  ..blocked = json['blocked'] as bool? ?? false;

Map<String, dynamic> _$UserStatusToJson(UserStatus instance) =>
    <String, dynamic>{
      'status': _$FriendStatusEnumMap[instance.status]!,
      'blocked': instance.blocked,
    };

const _$FriendStatusEnumMap = {
  FriendStatus.NONE: 'NONE',
  FriendStatus.FRIENDS: 'FRIENDS',
  FriendStatus.REQUEST_INCOMING: 'REQUEST_INCOMING',
  FriendStatus.REQUEST_OUTGOING: 'REQUEST_OUTGOING',
  FriendStatus.ERROR: 'ERROR',
};

FriendRequests _$FriendRequestsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['incoming', 'outgoing'],
  );
  return FriendRequests()
    ..incoming = (json['incoming'] as List<dynamic>)
        .map((e) => IncomingFriendRequest.fromJson(e as Map<String, dynamic>))
        .toList()
    ..outgoing = (json['outgoing'] as List<dynamic>)
        .map((e) => OutgoingFriendRequest.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$FriendRequestsToJson(FriendRequests instance) =>
    <String, dynamic>{
      'incoming': instance.incoming,
      'outgoing': instance.outgoing,
    };

UserProfileSocialMediaConnection _$UserProfileSocialMediaConnectionFromJson(
        Map<String, dynamic> json) =>
    UserProfileSocialMediaConnection()
      ..id = json['id'] as int
      ..verified = json['verified'] as bool
      ..platformUserId = json['platformUserId'] as String
      ..platformUsername = json['platformUsername'] as String
      ..platformUserImage = json['platformUserImage'] as String
      ..platform =
          SocialMediaPlatform.fromJson(json['platform'] as Map<String, dynamic>)
      ..user = json['user'] == null
          ? null
          : UserPublic.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$UserProfileSocialMediaConnectionToJson(
        UserProfileSocialMediaConnection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'verified': instance.verified,
      'platformUserId': instance.platformUserId,
      'platformUsername': instance.platformUsername,
      'platformUserImage': instance.platformUserImage,
      'platform': instance.platform,
      'user': instance.user,
    };

SocialMediaPlatform _$SocialMediaPlatformFromJson(Map<String, dynamic> json) =>
    SocialMediaPlatform()
      ..id = json['id'] as int?
      ..name = json['name'] as String
      ..icon = json['icon'] as String;

Map<String, dynamic> _$SocialMediaPlatformToJson(
        SocialMediaPlatform instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

TopUser _$TopUserFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['position'],
  );
  return TopUser()
    ..position = json['position'] as int
    ..streams = json['streams'] as int?
    ..playedMs = json['playedMs'] as int?
    ..indicator = $enumDecodeNullable(_$IndicatorEnumMap, json['indicator'])
    ..user = json['user'] == null
        ? null
        : UserPublic.fromJson(json['user'] as Map<String, dynamic>);
}

UserSpotifyPlaylist _$UserSpotifyPlaylistFromJson(Map<String, dynamic> json) =>
    UserSpotifyPlaylist()
      ..id = json['id'] as int
      ..userId = json['userId'] as String
      ..createdAt =
          const LocalDateTimeConverter().fromJson(json['createdAt'] as String)
      ..syncedAt =
          const LocalDateTimeConverter().fromJson(json['syncedAt'] as String)
      ..size = json['size'] as int
      ..spotifyId = json['spotifyId'] as String
      ..range = $enumDecodeNullable(_$RangeEnumMap, json['range'])
      ..rangeInDays = json['rangeInDays'] as int?
      ..error = json['error'] as String?
      ..syncEnabled = json['syncEnabled'] as bool
      ..name = json['name'] as String?
      ..orderBy = $enumDecodeNullable(_$OrderBySettingEnumMap, json['orderBy']);

Map<String, dynamic> _$UserSpotifyPlaylistToJson(
        UserSpotifyPlaylist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': const LocalDateTimeConverter().toJson(instance.createdAt),
      'syncedAt': const LocalDateTimeConverter().toJson(instance.syncedAt),
      'size': instance.size,
      'spotifyId': instance.spotifyId,
      'range': _$RangeEnumMap[instance.range],
      'rangeInDays': instance.rangeInDays,
      'error': instance.error,
      'syncEnabled': instance.syncEnabled,
      'name': instance.name,
      'orderBy': _$OrderBySettingEnumMap[instance.orderBy],
    };

const _$RangeEnumMap = {
  Range.TODAY: 'TODAY',
  Range.DAYS: 'DAYS',
  Range.WEEKS: 'WEEKS',
  Range.MONTHS: 'MONTHS',
  Range.LIFETIME: 'LIFETIME',
};

UserDevice _$UserDeviceFromJson(Map<String, dynamic> json) => UserDevice(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      model: json['model'] as String?,
      type: json['type'] as String?,
      notifications: UserDeviceNotifications.fromJson(
          json['notifications'] as Map<String, dynamic>),
      fcmToken: json['fcmToken'] as String?,
      lastUsed: _$JsonConverterFromJson<String, DateTime>(
          json['lastUsed'], const LocalDateTimeConverter().fromJson),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const LocalDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$UserDeviceToJson(UserDevice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const LocalDateTimeConverter().toJson),
      'lastUsed': _$JsonConverterToJson<String, DateTime>(
          instance.lastUsed, const LocalDateTimeConverter().toJson),
      'name': instance.name,
      'model': instance.model,
      'type': instance.type,
      'notifications': instance.notifications,
      'fcmToken': instance.fcmToken,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

UserDeviceNotifications _$UserDeviceNotificationsFromJson(
        Map<String, dynamic> json) =>
    UserDeviceNotifications(
      imports: json['imports'] as bool?,
      friends: json['friends'] as bool?,
      weeklySummary: json['weeklySummary'] as bool?,
      monthlySummary: json['monthlySummary'] as bool?,
      updates: json['updates'] as bool?,
    );

Map<String, dynamic> _$UserDeviceNotificationsToJson(
        UserDeviceNotifications instance) =>
    <String, dynamic>{
      'imports': instance.imports,
      'friends': instance.friends,
      'weeklySummary': instance.weeklySummary,
      'monthlySummary': instance.monthlySummary,
      'updates': instance.updates,
    };

SpotifyAuth _$SpotifyAuthFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['displayName'],
  );
  return SpotifyAuth()
    ..disabled = json['disabled'] as bool? ?? false
    ..email = json['email'] as String?
    ..displayName = json['displayName'] as String
    ..platformUserId = json['platformUserId'] as String?
    ..image = json['image'] as String?
    ..country = json['country'] as String?
    ..syncStreams = json['sync'] as bool? ?? false
    ..imported = json['imported'] as bool? ?? false
    ..status = json['status'] as int? ?? 0;
}

Map<String, dynamic> _$SpotifyAuthToJson(SpotifyAuth instance) =>
    <String, dynamic>{
      'disabled': instance.disabled,
      'email': instance.email,
      'displayName': instance.displayName,
      'platformUserId': instance.platformUserId,
      'image': instance.image,
      'country': instance.country,
      'sync': instance.syncStreams,
      'imported': instance.imported,
      'status': instance.status,
    };

AppleMusicAuth _$AppleMusicAuthFromJson(Map<String, dynamic> json) =>
    AppleMusicAuth()
      ..disabled = json['disabled'] as bool? ?? false
      ..email = json['email'] as String?
      ..emailVerified = json['emailVerified'] as bool? ?? false
      ..appleUserId = json['appleUserId'] as String?
      ..syncStreams = json['sync'] as bool? ?? false
      ..imported = json['imported'] as bool? ?? false
      ..status = json['status'] as int? ?? 0;

Map<String, dynamic> _$AppleMusicAuthToJson(AppleMusicAuth instance) =>
    <String, dynamic>{
      'disabled': instance.disabled,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'appleUserId': instance.appleUserId,
      'sync': instance.syncStreams,
      'imported': instance.imported,
      'status': instance.status,
    };

UserBan _$UserBanFromJson(Map<String, dynamic> json) => UserBan()
  ..createdAt = DateTime.parse(json['createdAt'] as String)
  ..active = json['active'] as bool;

Map<String, dynamic> _$UserBanToJson(UserBan instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'active': instance.active,
    };
