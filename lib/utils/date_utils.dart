import 'package:intl/intl.dart';

class AppDateUtils {
  /// Convert ISO string to DateTime
  static DateTime? parse(String? date) {
    if (date == null || date.isEmpty) return null;
    try {
      return DateTime.parse(date);
    } catch (e) {
      return null;
    }
  }

  /// Format: 19 Mar 2026
  static String formatDate(String? date) {
    final parsed = parse(date);
    if (parsed == null) return "";
    return DateFormat('dd MMM yyyy').format(parsed);
  }

  /// Format: 06:37 AM
  static String formatTime(String? date) {
    final parsed = parse(date);
    if (parsed == null) return "";
    return DateFormat('hh:mm a').format(parsed);
  }

  /// Format: 19 Mar 2026, 06:37 AM
  static String formatDateTime(String? date) {
    final parsed = parse(date);
    if (parsed == null) return "";
    return DateFormat('dd MMM yyyy, hh:mm a').format(parsed);
  }

  static String getTimeFromDateTime(String dateTime) {
    try {
      final DateTime parsed = DateTime.parse(dateTime);
      return DateFormat('hh:mm a').format(parsed);
    } catch (e) {
      return "N/A";
    }
  }

  /// Custom format (pass your own pattern)
  static String format(String? date, String pattern) {
    final parsed = parse(date);
    if (parsed == null) return "";
    return DateFormat(pattern).format(parsed);
  }

  /// Example: 19/03/2026
  static String formatSlashDate(String? date) {
    final parsed = parse(date);
    if (parsed == null) return "";
    return DateFormat('dd/MM/yyyy').format(parsed);
  }
}
