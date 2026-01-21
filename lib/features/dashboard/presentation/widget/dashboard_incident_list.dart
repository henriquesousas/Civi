import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:flutter/material.dart';

class DashboardIncidentList extends StatelessWidget {
  final List<IncidentOutput> items;
  const DashboardIncidentList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * items.length * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        itemBuilder: (context, index) {
          BorderRadius borderRadius;
          final item = items[index];
          final borderFirst = const BorderRadius.only(
            topLeft: Radius.circular(Dimens.size20),
            topRight: Radius.circular(Dimens.size20),
          );
          final borderLast = const BorderRadius.only(
            bottomLeft: Radius.circular(Dimens.size20),
            bottomRight: Radius.circular(Dimens.size20),
          );

          if (items.length == 1) {
            borderRadius = BorderRadius.circular(Dimens.size20);
          } else {
            if (index == 0) {
              borderRadius = borderFirst;
            } else if (index == items.length - 1) {
              borderRadius = borderLast;
            } else {
              borderRadius = BorderRadius.circular(0);
            }
          }

          return Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: borderRadius,
              border: Border(
                top: const BorderSide(
                  color: AppColors.lightGreyColor20,
                  width: 1,
                ),
                left: const BorderSide(
                  color: AppColors.lightGreyColor20,
                  width: 1,
                ),
                right: const BorderSide(
                  color: AppColors.lightGreyColor20,
                  width: 1,
                ),
                bottom: index == items.length - 1
                    ? const BorderSide(
                        color: AppColors.lightGreyColor20, width: 1)
                    : BorderSide.none,
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    item.product.name,
                    style: context.appTextStyles.buttonTextStyle1.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  subtitle: Text(
                    _getIncidentLocality(item) ?? '',
                    style: context.appTextStyles.caption2Style.copyWith(
                      color: AppColors.textColorBody,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_right_alt_outlined,
                    color: AppColors.textSecondary,
                  ),
                  onTap: () => {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String? _getIncidentLocality(IncidentOutput item) {
    if (item.local == null) return null;
    if (item.local!.address != null && item.local!.address!.isNotEmpty) {
      return 'Roubo aconteceu em ${item.local!.city}, ${item.local!.state}, próximo a ${item.local!.address}';
    }
    return 'Roubo aconteceu em ${item.local!.city}, ${item.local!.state}';
  }
}
