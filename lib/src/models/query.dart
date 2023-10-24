part of statsfm.models;

class QueryOptions {
  final int? limit;
  final int? offset;
  final DateTimeRange? range;
  
  ///Use Range object for Spotify today, 4 weeks, 6 months, and lifetime
  ///For Apple music use a valid int year for the user.
  final dynamic rangeString;
  final OrderBySetting? orderBy;
  final Order? order;

  const QueryOptions({
    this.limit,
    this.offset,
    this.range,
    this.rangeString,
    this.orderBy,
    this.order,
  });

  Map<String, dynamic> toQuery() {
    Map<String, dynamic> query = {};
    if (limit is int && limit! > 0) {
      query['limit'] = limit;
    }
    if (offset is int && offset! > 0) {
      query['offset'] = offset;
    }

    if (range is DateTimeRange) {
      query['before'] = range!.end.millisecondsSinceEpoch;
      query['after'] = range!.start.millisecondsSinceEpoch;
    }
    if (rangeString is Range) {
      query['range'] = rangeString.toString().substring(6).toLowerCase();
    }
    if (rangeString is int && orderBy == OrderBySetting.APPLEMUSIC) {
      query['range'] = rangeString.toString();
    }

    if (orderBy is OrderBySetting) {
      query['orderBy'] =
          orderBy.toString().substring(orderBy.toString().indexOf('.') + 1);
    }

    if (order is Order) {
      query['order'] = order == Order.ASC ? 'asc' : 'desc';
    }

    return query;
  }
}

enum Order {
  @JsonValue("asc")
  ASC,

  @JsonValue("desc")
  DESC,
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
