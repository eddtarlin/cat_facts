import 'package:intl/intl.dart';

class DateFormatter {
  static String format(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat.yMMMd().format(dateTime);
    return formattedDate;
  }
}
