import 'package:deehelp/core/providers/current_location_provider.dart';
import 'package:deehelp/core/providers/location_notifier_provider.dart';
import 'package:deehelp/core/services/location/location_failure.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/bottom_sheet/custom_modal_bottom_sheet.dart';
import 'package:deehelp/features/dashboard/presentation/widget/request_location_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardLocation extends ConsumerWidget {
  const DashboardLocation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(dashboardViewmodelProvider);
    final currentPlace = ref.watch(currentLocationProvider);

    return GestureDetector(
      onTap: () {
        // final locationState = ref.read(locationNotifierProvider);

        // locationState.when(
        //   data: (location) {
        //     // Se já tem localização, mostra modal para mudar?
        //     _showLocationOptionsModal(context, ref);
        //   },
        //   error: (error, stackTrace) {
        //     // Se tem erro, mostra modal de erro
        //     if (error is LocationFailure) {
        //       // _showErrorModal(context, error, ref);
        //     }
        //   },
        //   loading: () {
        //     // Se está carregando, não faz nada ou mostra loading
        //   },
        // );
        // _showLocationOptionsModal(context, ref);
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
              press: () {
                ref
                    .watch(locationNotifierProvider.notifier)
                    .getCurrentLocation();
              },
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
