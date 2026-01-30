import 'package:deehelp/core/providers/current_location_provider.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardLocation extends ConsumerWidget {
  const DashboardLocation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPlace = ref.watch(currentLocationProvider);

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(20),
          border: BoxBorder.all(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
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
              color: Theme.of(context).colorScheme.outline,
            ),
            Text(
              currentPlace != null
                  ? '${currentPlace.fullAddress}'
                  : "Localização não informada",
              style: context.appTextStyles.caption2Style.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.surfaceDim,
              ),
            ),
            // const Icon(
            //   Icons.arrow_drop_down,
            //   size: 14,
            //   color: AppColors.textColorBody,
            // ),
          ],
        ),
      ),
    );
  }

  // void _showLocationOptionsModal(BuildContext context, WidgetRef ref) {
  //   customModalBottomSheet(
  //     isDismissible: true,
  //     context,
  //     child: PopScope(
  //       canPop: true,
  //       child: RequestLocationModal(
  //         title: "Atualizar localização",
  //         message: "Deseja atualizar sua localização atual?",
  //         buttonTitle: "Atualizar localização",
  //         press: () async {
  //           // Fecha o modal primeiro
  //           if (Navigator.canPop(context)) {
  //             Navigator.pop(context);
  //           }

  //           // Aguarda um pouco antes de solicitar
  //           await Future.delayed(const Duration(milliseconds: 100));

  //           // Agora solicita a localização
  //           await _requestLocationWithDelay(ref);
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Future<void> _requestLocationWithDelay(WidgetRef ref) async {
  //   // Adiciona um pequeno delay para evitar flicker
  //   await Future.delayed(const Duration(milliseconds: 50));

  //   try {
  //     await ref.read(locationNotifierProvider.notifier).getCurrentLocation();
  //   } catch (e) {
  //     // Erro será tratado pelo listener
  //   }
  // }
}
