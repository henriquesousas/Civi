import 'package:deehelp/old_core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/old_core/ui/router/app_router.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_features/incident/domain/usecase/incident_output.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DashboardIncidentList extends StatelessWidget {
  final List<IncidentOutput> items;
  const DashboardIncidentList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimens.size10.w),
        height: context.screenHeight * 0.5,
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
                // color: AppColors.whiteColor,
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: borderRadius,
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    width: 1,
                  ),
                  left: BorderSide(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    width: 1,
                  ),
                  right: BorderSide(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    width: 1,
                  ),
                  bottom: index == items.length - 1
                      ? BorderSide(
                          color: Theme.of(context).colorScheme.outlineVariant,
                          width: 1)
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
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    subtitle: Text(
                      _getIncidentLocality(item) ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextStyles.caption2Style.copyWith(
                        // color: AppColors.textColorBody,
                        color: Theme.of(context).colorScheme.surfaceDim,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_right_alt_outlined,
                      color: AppColors.textSecondary,
                    ),
                    onTap: () {
                      context.push(
                        AppRouter.incidentDetail,
                        extra: {"args": item},
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
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
