import 'package:intl/intl.dart';

class AppDateFormatters {
  static String mdY(DateTime date) => DateFormat('MMM d,yyyy').format(date);
}