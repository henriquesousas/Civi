import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String toDayMonthYearFormat() {
    final DateFormat formatter = DateFormat('dd/MM/yyyy', 'pt_BR');
    return formatter.format(this).toString();
  }

  String toDateWithFullMonth() {
    final format = DateFormat("d 'de' MMMM 'de' y", 'pt_BR');
    return format.format(this);
  }
}
