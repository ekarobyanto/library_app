import 'package:intl/intl.dart';

String parseDateTime(String dateTime, {bool? withTime}) {
  if ((withTime ?? false)) {
    return DateFormat.yMMMd().add_jm().format(DateTime.parse(dateTime));
  } else {
    return DateFormat.yMMMd().format(DateTime.parse(dateTime));
  }
}
