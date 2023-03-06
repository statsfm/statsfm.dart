part of statsfm;

extension StringExtension on String {
  String capitalize({bool recursive = false}) {
    if (recursive) return this.split(' ').map((x) => x.capitalize()).join(' ');
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

DateTime dateTimeFromTimestamp(int timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp).toLocal();
}

int dateTimeToTimestamp(DateTime timestamp) {
  return timestamp.millisecondsSinceEpoch;
}
