class UtilsDate {
  static String format(DateTime data) {
    final now = DateTime.now();
    final difference = now.difference(data);

    if (difference.inHours < 1) {
      return 'Há ${difference.inMinutes} minutos';
    } else if (difference.inHours < 24) {
      return 'Há ${difference.inHours} horas';
    } else if (difference.inDays == 1) {
      return 'Ontem às ${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays < 7) {
      return 'Há ${difference.inDays} dias';
    } else {
      return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
    }
  }
}
