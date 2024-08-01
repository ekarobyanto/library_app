import 'package:intl/intl.dart';
import 'package:library_app/src/core/internal/logger.dart';

String parseDateTime(String dateTime, {bool? withTime, bool? isUtc}) {
  try {
    DateTime date;
    if (!(isUtc ?? false)) {
      // Convert Unix timestamp to DateTime
      date = DateTime.fromMillisecondsSinceEpoch(int.parse(dateTime) * 1000);
    } else {
      date = DateTime.parse(dateTime);
    }

    if ((withTime ?? false)) {
      return DateFormat.yMMMd().add_jm().format(date);
    } else {
      return DateFormat.yMMMd().format(date);
    }
  } catch (err) {
    logger.e('$err returning original dateTime');
    return dateTime;
  }
}
