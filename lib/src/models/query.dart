part of statsfm.models;

class QueryOptions {
  final int? limit;
  final DateTimeRange? range;
  final Range? rangeString;

  const QueryOptions({
    this.limit,
    this.range,
    this.rangeString,
  });

  String toQuery() {
    String query = '';
    if (limit is int && limit! > 0) {
      query += 'limit=$limit&';
    }

    if (range is DateTimeRange &&
        range!.start is DateTime &&
        range!.end is DateTime) {
      query +=
          'before=${range!.end.millisecondsSinceEpoch}&after=${range!.start.millisecondsSinceEpoch}&';
    }
    if (rangeString is Range) {
      query += 'range=${rangeString.toString().substring(6).toLowerCase()}&';
    }

    return query;
  }
}

String dateTimeToString(DateTime date) {
  date = date.toUtc();
  return '${date.year}${date.month < 10 ? '0' : ''}${date.month}${date.day < 10 ? '0' : ''}${date.day}';
}

String rangeToString(Range range) {
  return range.toString().substring(6).toLowerCase();
}

class DateTimeRange {
  /// Creates a date range for the given start and end [DateTime].
  DateTimeRange({
    required this.start,
    required this.end,
  }) : assert(!start.isAfter(end));

  /// The start of the range of dates.
  final DateTime start;

  /// The end of the range of dates.
  final DateTime end;

  /// Returns a [Duration] of the time between [start] and [end].
  ///
  /// See [DateTime.difference] for more details.
  Duration get duration => end.difference(start);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is DateTimeRange && other.start == start && other.end == end;
  }

  @override
  String toString() => '$start - $end';
}


// class QueryOptionsWithRange extends QueryOptions {
//   final DateTimeRange? range;

//   const QueryOptionsWithRange(
//       {this.before, this.after, limit = 100, offset = 0})
//       : super(limit: limit, offset: offset);

//   String toQuery() {
//     String base = super.toQuery();

//     if (before is DateTime && after is DateTime) {
//       return '${base}before=${dateTimeToString(before!)}&after=${dateTimeToString(after!)}&';
//     } else if (before is DateTime) {
//       return '${base}before=${dateTimeToString(before!)}&';
//     } else if (after is DateTime) {
//       return '${base}after=${dateTimeToString(after!)}&';
//     } else {
//       return base;
//     }
//   }
// }

// class QueryOptionsWithDate extends QueryOptions {
//   final DateTime? before;
//   final DateTime? after;

//   const QueryOptionsWithDate({this.before, this.after, limit})
//       : super(
//           limit: limit,
//         );

//   String toQuery() {
//     String base = super.toQuery();

//     if (before is DateTime && after is DateTime) {
//       return '${base}before=${dateTimeToString(before!)}&after=${dateTimeToString(after!)}&';
//     } else if (before is DateTime) {
//       return '${base}before=${dateTimeToString(before!)}&';
//     } else if (after is DateTime) {
//       return '${base}after=${dateTimeToString(after!)}&';
//     } else {
//       return base;
//     }
//   }
// }
