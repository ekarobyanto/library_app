import 'package:intl/intl.dart';

String parseDateTime(String dateTime) {
  return DateFormat.yMMMd().format(DateTime.parse(dateTime));
}
