
import 'package:intl/intl.dart';

class DateConverter{

  /// change dt to our dateFormat ---Jun 23--- for Example
  static String changeDtToDateTime(dt){
    final formatter = DateFormat.MMMd();
    var result = formatter.format(DateTime.fromMillisecondsSinceEpoch(
        dt * 1000,
        isUtc: true));

    return result;
  }

  /// change dt to our dateFormat ---5:55 AM/PM--- for Example
  static String changeDtToDateTimeHour(dt, timeZone){
    final formatter = DateFormat.jm();
    return formatter.format(
        DateTime.fromMillisecondsSinceEpoch(
            (dt * 1000) +
                timeZone * 1000,
            isUtc: true));;
  }


}