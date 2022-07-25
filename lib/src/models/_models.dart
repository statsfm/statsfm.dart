library statsfm.models;

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:statsfm/statsfm.dart';

part '_models.g.dart';
part 'album.dart';
part 'artist.dart';
part 'audio_feature.dart';
part 'chat.dart';
part 'crown.dart';
part 'database_size.dart';
part 'error.dart';
part 'external_ids.dart';
part 'genre.dart';
part 'query.dart';
part 'range.dart';
part 'search.dart';
part 'stream.dart';
part 'stream_stats.dart';
part 'top.dart';
part 'track.dart';
part 'user.dart';

class LocalDateTimeConverter implements JsonConverter<DateTime, String> {
  const LocalDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json).toLocal();
  }

  @override
  String toJson(DateTime json) => json.toIso8601String();
}
