import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorIndicatorWidget extends StatelessWidget {
  final int error;
  const ErrorIndicatorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _getErrorTitle(error),
          style: context.appTextStyles.sectionTitle.copyWith(
            fontSize: 32.sp,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Colors.black.withValues(alpha: 0.3),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  String _getErrorTitle(int error) {
    switch (error) {
      case 1:
        return 'SEM CONEXÃO';
      case 2:
        return 'SERVIDOR INDISPONÍVEL';
      case 3:
        return 'TEMPO ESGOTADO';
      default:
        return 'FALHA NO ENVIO';
    }
  }
}
