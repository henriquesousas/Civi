import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/ui/assets/resources.dart';

class MapSearch extends StatelessWidget {
  const MapSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                SvgPicture.asset(
                  R.images.svgSearch,
                  width: 24,
                  colorFilter: const ColorFilter.mode(
                    AppColors.greyColor,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text("Buscar ocorrência..."),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset(
                    R.images.svgMapMic,
                    width: 24,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
