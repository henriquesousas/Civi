import 'dart:math' as math;
import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double calculateTextWidth(String text, double percent) {
    final maxWidth = percentWidth(percent);

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: appTextStyles.caption1Style,
      ),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    return math.min(textPainter.size.width, maxWidth);
  }

  Future<DateTime?> pickDate({DateTime? initialDate}) async {
    return await showDatePicker(
      context: this,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      locale: const Locale("pt", "BR"),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
            ),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
  }

  Future<TimeOfDay?> pickTime({TimeOfDay? initialTime}) async {
    return await showTimePicker(
      context: this,
      initialTime: initialTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            // Estilo específico para TimePicker
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Colors.white,
              hourMinuteTextColor: Colors.black,
              hourMinuteColor: Colors.grey[100],
              dayPeriodTextColor: Colors.black,
              dayPeriodColor: Colors.grey[100],
              dialHandColor: AppColors.primaryColor,
              dialBackgroundColor: Colors.grey[50],
              dialTextColor: Colors.black,
              entryModeIconColor: AppColors.primaryColor,
              hourMinuteTextStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              dayPeriodTextStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          child: MediaQuery(
            // Força o formato 24h para Brasil
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true,
            ),
            child: child!,
          ),
        );
      },
      // Opções do TimePicker
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: 'SELECIONE A HORA',
      cancelText: 'CANCELAR',
      confirmText: 'CONFIRMAR',
      hourLabelText: 'HORA',
      minuteLabelText: 'MINUTO',
      // errorInvalidText: 'Hora inválida',
      // anchorPoint: Offset.zero,
    );
  }
}
