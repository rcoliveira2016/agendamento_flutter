import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatar(String stringFormat) {
    return DateFormat(stringFormat, 'pt_Br').format(this);
  }
}
