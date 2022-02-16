part of statsfm.models;

class PagingOptions {
  final int limit;
  final int offset;

  const PagingOptions({this.limit = 100, this.offset = 0});

  String toQuery() {
    if (limit > 0 && offset > 0) {
      return 'limit=${limit}&offset=${offset}&';
    } else if (limit > 0) {
      return 'limit=${limit}&';
    } else if (offset > 0) {
      return 'offset=${offset}&';
    } else {
      return '';
    }
  }
}

class PagingOptionsWithDate extends PagingOptions {
  final DateTime? before;
  final DateTime? after;

  const PagingOptionsWithDate(
      {this.before, this.after, limit = 100, offset = 0})
      : super(limit: limit, offset: offset);

  String toQuery() {
    String base = super.toQuery();

    if (before is DateTime && after is DateTime) {
      return '${base}before=${dateTimeToString(before!)}&after=${dateTimeToString(after!)}&';
    } else if (before is DateTime) {
      return '${base}before=${dateTimeToString(before!)}&';
    } else if (after is DateTime) {
      return '${base}after=${dateTimeToString(after!)}&';
    } else {
      return base;
    }
  }
}

String dateTimeToString(DateTime date) {
  date = date.toUtc();
  return '${date.year}${date.month < 10 ? '0' : ''}${date.month}${date.day < 10 ? '0' : ''}${date.day}';
}
