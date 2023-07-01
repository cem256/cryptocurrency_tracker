import 'package:intl/intl.dart';

class NumberFormatUtils {
  NumberFormatUtils._();

  static String getCurrency({required double value, bool isLargeNumber = false}) {
    return NumberFormat.currency(symbol: r'$', decimalDigits: isLargeNumber ? 0 : 2).format(value);
  }

  static String getRank({required int rank}) {
    return '#$rank';
  }
}
