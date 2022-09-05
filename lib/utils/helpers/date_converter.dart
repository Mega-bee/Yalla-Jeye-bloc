import 'package:intl/intl.dart';

class DateHelper {
  static String convertDateToString(DateTime dateTime) {
    print(dateTime.timeZoneOffset);
    DateTime neDate =  dateTime.add(dateTime.timeZoneOffset);
    String formateDate =  DateFormat.yMMMd().add_jm().format(neDate);
    return formateDate;
  }

  static DateTime convertDateToLocal(DateTime dateTime) {
    print(dateTime.timeZoneOffset);
    DateTime neDate =  dateTime.add(dateTime.timeZoneOffset);
    return neDate;
  }
}