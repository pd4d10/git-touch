import 'dart:core';

class TimeAgo {
  static String _ceil(double n) => n.ceil().toString();

  static String _pluralize(double time, String unit) {
    if (time == 1) {
      return '${_ceil(time)} $unit ago';
    }
    return '${_ceil(time)} ${unit}s ago';
  }

  static String format(DateTime time) {
    double diff =
        (DateTime.now().millisecondsSinceEpoch - time.millisecondsSinceEpoch) /
            1000;
    if (diff < 3600) {
      return _pluralize(diff / 60, 'minute');
    } else if (diff < 86400) {
      return _pluralize(diff / 3600, 'hour');
    } else {
      return _pluralize(diff / 86400, 'day');
    }
  }
}
