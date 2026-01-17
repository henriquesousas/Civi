import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../domain/utils/plate_utils.dart';

class PlateNumberWidget extends StatelessWidget {
  final String plateNumber;
  const PlateNumberWidget({super.key, required this.plateNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.blue),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 10,
              decoration: const BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
              child: const Center(
                child: Text(
                  '🇧🇷 BRASIL',
                  style: TextStyle(
                    fontSize: 7,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Center(
                child: Text(
                  PlateUtils.format(plateNumber),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
