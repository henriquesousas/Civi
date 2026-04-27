import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class RowProductTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const RowProductTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: SizeLayoutSpacing.l),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.10),
            width: 1,
          ),
        ),
      ),
      child: Row(
        spacing: 10,
        children: [
          const CustomNetworkImage(
            width: SizeImage.s,
            height: SizeImage.s,
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDAG-WQ_LqdqFZR55W30fle82BWI1wfHxAxA&s",
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  style: context.appText.bodyLarger.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: SizeSpacing.s),
                Text(
                  "Preto • 2010 • DND-0171",
                  maxLines: 3,
                  style: context.appText.subtitle.copyWith(
                    color: context.themeColor.secundaryTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          StatusBadge(
            style: StatusStyle.from(ItemStatus.active),
          )
        ],
      ),
    );
  }
}
