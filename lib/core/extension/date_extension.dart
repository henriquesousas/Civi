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

  bool isOlderThanDays(int days) {
    final now = DateTime.now();
    final difference = now.difference(this);

    return difference.inDays >= days;
  }

  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return 'agora mesmo';
    } else if (difference.inMinutes < 60) {
      final minutes = difference.inMinutes;
      return minutes == 1 ? 'há 1 minuto' : 'há $minutes minutos';
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      return hours == 1 ? 'há 1 hora' : 'há $hours horas';
    } else if (difference.inDays < 30) {
      final days = difference.inDays;
      return days == 1 ? 'há 1 dia' : 'há $days dias';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return months == 1 ? 'há 1 mês' : 'há $months meses';
    } else {
      final years = (difference.inDays / 365).floor();
      return years == 1 ? 'há 1 ano' : 'há $years anos';
    }
  }
}
