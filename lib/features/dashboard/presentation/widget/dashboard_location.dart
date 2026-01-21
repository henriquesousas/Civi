import 'package:deehelp/core/providers/current_location_provider.dart';
import 'package:deehelp/core/providers/location_notifier_provider.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/bottom_sheet/custom_modal_bottom_sheet.dart';
import 'package:deehelp/features/dashboard/presentation/dashboard_viewmode_provider.dart';
import 'package:deehelp/features/dashboard/presentation/widget/request_location_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardLocation extends ConsumerWidget {
  final String? place;
  const DashboardLocation({super.key, this.place});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(dashboardViewmodelProvider);
    final currentPlace = ref.watch(currentLocationProvider);

    return GestureDetector(
      onTap: () {
        customModalBottomSheet(
          isDismissible: true,
          context,
          child: PopScope(
            canPop: true,
            child: RequestLocationModal(
              title: "Localização automática",
              message:
                  "O acesso a localização do seu aparelho facilita a visualização dos incidentes na sua região.",
              buttonTitle: "Permitir localização automática",
              press: () => ref
                  .watch(locationNotifierProvider.notifier)
                  .getCurrentLocation(),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.lightGreyColor30,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              currentPlace != null
                  ? Icons.location_on_outlined
                  : Icons.location_off_outlined,
              size: Dimens.size16.w,
              color: AppColors.textColorBody,
            ),
            Text(
              currentPlace != null
                  ? '${currentPlace.city} ${currentPlace.state}'
                  : "Localização não informada",
              style: context.appTextStyles.caption2Style.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textColorHeader,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              size: 14,
              color: AppColors.textColorBody,
            ),
          ],
        ),
      ),
    );
  }
}
