import 'package:intl/intl.dart';
import 'package:library_app/src/core/internal/logger.dart';

String parseDateTime(String dateTime, {bool? withTime}) {
  try {
    if ((withTime ?? false)) {
      return DateFormat.yMMMd().add_jm().format(DateTime.parse(dateTime));
    } else {
      return DateFormat.yMMMd().format(DateTime.parse(dateTime));
    }
  } catch (err) {
    logger.e('$err returning original dateTime');
    return dateTime;
  }
}
