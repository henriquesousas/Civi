import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/occurrence/occurrence_page.dart';
import 'package:deehelp/features/occurrence/presentation/plate_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/images/ui_network_image_with_loader.dart';
import '../../../core/router/router_constants.dart';
import '../domain/utils_date.dart';
import 'occurrence_item_widget.dart';

class OccurrenceCardItemWidget extends StatelessWidget {
  final Ocorrencia occurrence;
  const OccurrenceCardItemWidget({super.key, required this.occurrence});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.grey.shade100),
      //   borderRadius: BorderRadius.circular(16),
      // ),
      child: InkWell(
        onTap: () => context.push(RouterConstant.productDetail),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border:
                  Border.all(color: AppColors.greyColor.withValues(alpha: 0.6))
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withValues(alpha: 0.1),
              //     offset: const Offset(0, 4),
              //     blurRadius: 20,
              //     spreadRadius: 0,
              //   ),
              // ],
              ),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                UtilsDate.format(occurrence.dataOcorrencia),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              const Divider(height: 1, color: AppColors.lightGreyColor20),
              Row(
                children: [
                  UINetworkImageWithLoader(
                    width: 120,
                    height: 120,
                    src: occurrence.imagemUrl!,
                  ),
                  OccurrenceItemWidget(occurrence: occurrence),
                ],
              ),
              // const SizedBox(height: 10),
              const Divider(height: 1, color: AppColors.lightGreyColor20),
              Align(
                alignment: Alignment.bottomRight,
                child: PlateNumberWidget(plateNumber: occurrence.placa),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
