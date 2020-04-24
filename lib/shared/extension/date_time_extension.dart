import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatar(String stringFormat) {
    return DateFormat(stringFormat, 'pt_Br').format(this);
  }

  DateTime startDay() {
    return new DateTime(this.year, this.month, this.day);
  }

  DateTime endDay() {
    return new DateTime(this.year, this.month, this.day+1).subtract(Duration(seconds: 1));
  }

}
