import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String formatPtBr() {
    final DateFormat formatter = DateFormat('dd/MM/yyyy', 'pt_BR');
    return formatter.format(this).toString();
  }

  //TODO: Formatar
  String formatDateTime(DateTime datetime) {
    final day =
        '${datetime.day.toString().padLeft(2, '0')}/${datetime.month.toString().padLeft(2, '0')}/${datetime.year}';
    final hour =
        '${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}';
    return '$day às $hour';
  }
}
