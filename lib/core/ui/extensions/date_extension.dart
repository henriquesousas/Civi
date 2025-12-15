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

  //TODO: Formatar
  // String formatDateTime(DateTime datetime) {
  //   final day =
  //       '${datetime.day.toString().padLeft(2, '0')}/${datetime.month.toString().padLeft(2, '0')}/${datetime.year}';
  //   final hour =
  //       '${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}';
  //   return '$day às $hour';
  // }
}
