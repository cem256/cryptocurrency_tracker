import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DateFormatUtils {
  DateFormatUtils._();

  /// Returns the date time as the following format: Nov 10, 2021
  static String getMonthDayYear(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('MMM dd, yyyy').format(parsedDate);
    } catch (e) {
      debugPrint('Error parsing date: $date error: $e');
      return '-';
    }
  }
}
