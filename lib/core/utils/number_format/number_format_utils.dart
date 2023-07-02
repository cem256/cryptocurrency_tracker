import 'package:intl/intl.dart';

abstract final class NumberFormatUtils {
  /// If [isLargeNumber] is set to true, decimal digits of the currency will be omitted
  /// Returns the formatted currency string.
  static String getCurrency({required double value, bool isLargeNumber = false}) {
    return NumberFormat.currency(symbol: r'$', decimalDigits: isLargeNumber ? 0 : null).format(value);
  }
}
