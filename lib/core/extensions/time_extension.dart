import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  // Formato 24h padrão Brasil: 14:30
  String to24hFormat() {
    final hourStr = hour.toString().padLeft(2, '0');
    final minuteStr = minute.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr';
  }

  // Formato 12h AM/PM: 02:30 PM
  // String to12hFormat() {
  //   final period = period == DayPeriod.am ? 'AM' : 'PM';
  //   final hourOfPeriod = hourOfPeriod.toString().padLeft(2, '0');
  //   final minuteStr = minute.toString().padLeft(2, '0');
  //   return '$hourOfPeriod:$minuteStr $period';
  // }

  // Formato brasileiro com texto: 14h30
  // String toBrazilianFormat() {
  //   final hourStr = hour.toString().padLeft(2, '0');
  //   final minuteStr = minute.toString().padLeft(2, '0');
  //   return '${hourStr}h$minuteStr';
  // }

  // // Formato com segundos: 14:30:00
  // String toFullTimeFormat() {
  //   final hourStr = hour.toString().padLeft(2, '0');
  //   final minuteStr = minute.toString().padLeft(2, '0');
  //   return '$hourStr:$minuteStr:00';
  // }

  // // Formato por extenso: duas e meia
  // String toPortugueseExtenso() {
  //   final horasPorExtenso = [
  //     'meia-noite',
  //     'uma',
  //     'duas',
  //     'três',
  //     'quatro',
  //     'cinco',
  //     'seis',
  //     'sete',
  //     'oito',
  //     'nove',
  //     'dez',
  //     'onze',
  //     'doze',
  //     'treze',
  //     'catorze',
  //     'quinze',
  //     'dezesseis',
  //     'dezessete',
  //     'dezoito',
  //     'dezenove',
  //     'vinte',
  //     'vinte e uma',
  //     'vinte e duas',
  //     'vinte e três'
  //   ];

  //   final minutosPorExtenso = [
  //     'em ponto',
  //     'um',
  //     'dois',
  //     'três',
  //     'quatro',
  //     'cinco',
  //     'seis',
  //     'sete',
  //     'oito',
  //     'nove',
  //     'dez',
  //     'onze',
  //     'doze',
  //     'treze',
  //     'catorze',
  //     'quinze',
  //     'dezesseis',
  //     'dezessete',
  //     'dezoito',
  //     'dezenove',
  //     'vinte',
  //     'vinte e um',
  //     'vinte e dois',
  //     'vinte e três',
  //     'vinte e quatro',
  //     'vinte e cinco',
  //     'vinte e seis',
  //     'vinte e sete',
  //     'vinte e oito',
  //     'vinte e nove'
  //   ];

  //   String hora = horasPorExtenso[hour % 24];

  //   if (minute == 0) {
  //     return '$hora horas';
  //   } else if (minute == 15) {
  //     return '$hora e quinze';
  //   } else if (minute == 30) {
  //     return '$hora e meia';
  //   } else if (minute == 45) {
  //     final proximaHora = horasPorExtenso[(hour + 1) % 24];
  //     return 'quinze para as $proximaHora';
  //   } else {
  //     return '$hora e ${minutosPorExtenso[minute]}';
  //   }
  // }

  // // Para exibição em interfaces: 14:30
  // String toDisplayFormat() {
  //   return to24hFormat();
  // }

  // // Para armazenamento em banco de dados
  // String toDatabaseFormat() {
  //   return to24hFormat();
  // }

  // // Para usar em nomes de arquivos: 1430
  // String toFileNameFormat() {
  //   final hourStr = hour.toString().padLeft(2, '0');
  //   final minuteStr = minute.toString().padLeft(2, '0');
  //   return '${hourStr}${minuteStr}';
  // }

  // // Converte para DateTime (usando data atual)
  // DateTime toDateTime({DateTime? baseDate}) {
  //   final now = baseDate ?? DateTime.now();
  //   return DateTime(now.year, now.month, now.day, hour, minute);
  // }

  // // Comparação de horas
  // bool isBefore(TimeOfDay other) {
  //   if (hour < other.hour) return true;
  //   if (hour > other.hour) return false;
  //   return minute < other.minute;
  // }

  // bool isAfter(TimeOfDay other) {
  //   if (hour > other.hour) return true;
  //   if (hour < other.hour) return false;
  //   return minute > other.minute;
  // }

  // bool isSameAs(TimeOfDay other) {
  //   return hour == other.hour && minute == other.minute;
  // }

  // // Adiciona minutos
  // TimeOfDay addMinutes(int minutes) {
  //   int totalMinutes = hour * 60 + minute + minutes;
  //   totalMinutes = totalMinutes % (24 * 60); // Mantém dentro de 24h
  //   if (totalMinutes < 0) totalMinutes += 24 * 60; // Trata negativos

  //   return TimeOfDay(
  //     hour: totalMinutes ~/ 60,
  //     minute: totalMinutes % 60,
  //   );
  // }

  // // Diferença em minutos
  // int differenceInMinutes(TimeOfDay other) {
  //   final thisMinutes = hour * 60 + minute;
  //   final otherMinutes = other.hour * 60 + other.minute;
  //   return thisMinutes - otherMinutes;
  // }

  // // Verifica se está entre duas horas
  // bool isBetween(TimeOfDay start, TimeOfDay end) {
  //   final thisMinutes = hour * 60 + minute;
  //   final startMinutes = start.hour * 60 + start.minute;
  //   final endMinutes = end.hour * 60 + end.minute;

  //   return thisMinutes >= startMinutes && thisMinutes <= endMinutes;
  // }

  // // Retorna o período do dia
  // String get periodOfDay {
  //   if (hour < 6) return 'Madrugada';
  //   if (hour < 12) return 'Manhã';
  //   if (hour < 18) return 'Tarde';
  //   return 'Noite';
  // }
}
