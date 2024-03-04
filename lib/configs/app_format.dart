import 'package:intl/intl.dart';

class AppFormat {
  // Formats a number into a compact, human-readable representation
  static String infoNumber(double number) {
    return NumberFormat.compact().format(number);
  }

  // Formats a date string
  static String fullDateTime(String date) {
    return DateFormat('EEE, d MM yy | HH:mm').format(DateTime.parse(date));
  }

  // Formats a date as "time ago" (e.g., "1 hour ago") or full date/time string depending on its proximity to the current time.
  static String publish(String date) {
    // Parse a string into a DateTime object, get the current time, and calculate yesterday's date.
    DateTime dateTime = DateTime.parse(date);
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));

    // Displays a relative time string based on how long ago the dateTime was.
    if (dateTime.isBefore(yesterday)) {
      return fullDateTime(date);
    } else {
      int hour = now.difference(dateTime).inHours;
      if (hour >= 1) {
        return '$hour hour';
      } else {
        int minute = now.difference(dateTime).inMinutes;
        if (minute >= 1) {
          return '$minute minute';
        } else {
          int second = now.difference(dateTime).inSeconds;
          second = second < 0 ? 1 : second;
          return '$second second';
        }
      }
    }
  }
}
