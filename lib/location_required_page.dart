import 'package:deehelp/app_startup_provider.dart';
import 'package:deehelp/core/services/location/state/location_state.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:deehelp/location_permission_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

class LocationRequiredPage extends ConsumerWidget {
  const LocationRequiredPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final locationState = ref.watch(locationNotifierProvider);
    // final locationNotifier = ref.watch(locationNotifierProvider.notifier);
    final state = ref.watch(locationPermissionProvider);
    // final notifier = ref.watch(locationPermissionProvider.notifier);

    ref.listen(
      locationPermissionProvider,
      (previous, next) {
        next.maybeMap(
            granted: (value) => ref.read(appStartupProvider.notifier).refresh(),
            orElse: () => null);
      },
    );

    return UICustomScaffold(
      hideAppBar: true,
      body: SafeArea(
        child: state.maybeWhen(
          loading: () => _buildContent("asasa", context, () {}, loading: true),
          serviceDisabled: () => _buildContent(
            "GPS disable",
            context,
            () => Geolocator.openLocationSettings(),
          ),
          denied: (status, message) => _buildContent(
            "Permission denied",
            context,
            () => ref.read(locationPermissionProvider.notifier).request(),
          ),
          deniedPermanently: (status, message) => _buildContent(
            "Permission pra sempre",
            context,
            () => ref.read(locationPermissionProvider.notifier).request(),
          ),
          orElse: () => SizedBox.fromSize(),
        ),
        // child: switch (state) {
        //   LocationLoading() => _buildContent(
        //       "Ative o GPS do dispositivo",
        //       context,
        //       () {
        //         debugPrint("LocationServiceDisabled");
        //         Geolocator.openLocationSettings();
        //       },
        //       loading: true,
        //     ),
        //   LocationServiceDisabled() => _buildContent(
        //       "Ative o GPS do dispositivo",
        //       context,
        //       () {
        //         debugPrint("LocationServiceDisabled");
        //         Geolocator.openLocationSettings();
        //       },
        //     ),
        //   LocationPermissionDenied() => _buildContent(
        //         "Precisamos da sua localização para continuar", context, () {
        //       debugPrint("LocationPermissionDenied");
        //       ref.read(locationPermissionProvider.notifier).request();
        //     }),
        //   LocationPermissionPermanentlyDenied() => _buildContent(
        //       "Permissão negada permanentemente",
        //       context,
        //       () {
        //         debugPrint("LocationPermissionPermanentlyDenied");
        //         ref.read(locationPermissionProvider.notifier).request();
        //       },
        //     ),
        //   LocationGranted() => const SizedBox.shrink(),
        //   // ignore: unreachable_switch_case
        //   _ => const SizedBox.shrink(),
        // },
      ),
    );
  }

  Widget _buildContent(
    String message,
    BuildContext context,
    VoidCallback press, {
    bool loading = false,
  }) {
    // final icon = status == LocationStatus.serviceDisabled
    //     ? Icons.gps_off_rounded
    //     : Icons.explore_rounded;

    // final title = status == LocationStatus.serviceDisabled
    //     ? "GPS desativado"
    //     : "Localização";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: Dimens.size32),
        UIICon(
          radius: Dimens.size90.w,
          isAlpha: true,
          bgColor: AppColors.primaryColor,
          icon: Icon(
            Icons.explore_rounded,
            size: Dimens.size125.w,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: Dimens.size32),
        const Text(
          "Localizacao",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: Dimens.size16),
        Text(
          message,
          textAlign: TextAlign.center,
          style: context.appTextStyles.bodyTextStyle1,
        ),
        // if (status == LocationStatus.permissionDeniedForever) ...[
        //   const SizedBox(height: Dimens.size16),
        //   _buildTextInfo(context),
        // ],
        const Spacer(),
        UIElevatedButton(
          // text: status == LocationStatus.permissionDeniedForever
          //     ? "Abrir configurações"
          //     : "Continuar",
          text: "Localização",
          isLoading: loading,
          press: press,
          // press: () {
          //   // if (status == LocationStatus.permissionDeniedForever) {
          //   //   locationNotifier.openNativePermissionSettings();
          //   // } else {
          //   //   locationNotifier.getCurrentLocation();
          //   // }
          // },
        ),
      ],
    );
  }

  Widget _buildTextInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimens.defaultPadding.w,
        vertical: Dimens.defaultPadding.w,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor30,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Localização necessária",
            style: context.appTextStyles.sectionTitle3.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Para continuar usando todas as funcionalidades do aplicativo, é necessário habilitar as permissões do dispositivo. Vá até as configurações e ative manualmente as permissões solicitadas.",
            // textAlign: TextAlign.center,
            style: context.appTextStyles.sectionSubTitle1.copyWith(
              color: AppColors.darkGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
