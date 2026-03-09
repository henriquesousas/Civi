import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapLocationSummaryCard extends StatelessWidget {
  final String title;
  final String alertsText;
  final VoidCallback? onEditTap;

  const MapLocationSummaryCard({
    super.key,
    required this.title,
    required this.alertsText,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // const Text(
          //   '🏠',
          //   style: TextStyle(fontSize: 18),
          // ),
          const Text(
            '🔥',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.appText.headermd.copyWith(
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  alertsText,
                  style: context.appText.caption.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onEditTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFE5E7EB),
                ),
              ),
              child: Text(
                'Ver incidentes',
                style: context.appText.caption.copyWith(
                  color: const Color(0xFF374151),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
