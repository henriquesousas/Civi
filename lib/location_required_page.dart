import 'package:deehelp/app_startup_provider.dart';
import 'package:deehelp/core/services/permissions/location/location_access_state.dart';
import 'package:deehelp/core/services/permissions/location/location_service.dart';
import 'package:deehelp/old_core/services/location/state/location_state.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/old_core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/old_core/ui/widgets/icon/ui_icon.dart';
import 'package:deehelp/location_permission_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

class LocationRequiredPage extends ConsumerStatefulWidget {
  const LocationRequiredPage({super.key});

  @override
  ConsumerState<LocationRequiredPage> createState() =>
      _LocationRequiredPageState();
}

class _LocationRequiredPageState extends ConsumerState<LocationRequiredPage>
    with WidgetsBindingObserver {
  String _title = '';
  String _message = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(locationPermissionProvider.notifier).check();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(locationPermissionProvider);

    ref.listen<LocationAccessState>(
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
          loading: () => _buildContent(
            icon: Icons.where_to_vote,
            title: _title,
            message: _message,
            context: context,
            press: () {},
            loading: true,
          ),
          serviceDisabled: () {
            _title = "GPS desativado";
            _message =
                "Precisamos do GPS ligado para identificar sua localização e oferecer todos os recursos do aplicativo.";
            return _buildContent(
              icon: Icons.gps_off_rounded,
              title: _title,
              message: _message,
              context: context,
              textButton: "Ativar GPS",
              press: () => Geolocator.openLocationSettings(),
            );
          },
          denied: () {
            _title = "Localização";
            _message =
                "Para continuar usando todas as funcionalidades do aplicativo, é necessário habilitar as permissões do dispositivo.";
            return _buildContent(
              icon: Icons.location_on_rounded,
              title: _title,
              message: _message,
              context: context,
              press: () =>
                  ref.read(locationPermissionProvider.notifier).request(),
            );
          },
          deniedPermanently: () {
            _title = "Localização";
            _message =
                "Para continuar usando todas as funcionalidades do aplicativo, é necessário habilitar as permissões do dispositivo. Vá até as configurações e ative manualmente as permissões solicitadas.";
            return _buildContent(
              icon: Icons.location_on_rounded,
              title: _title,
              message: _message,
              context: context,
              showInfo: true,
              textButton: "Abrir configuração",
              press: () => LocationService().openNativePermissionSettings(),
            );
          },
          orElse: () => SizedBox.fromSize(),
        ),
      ),
    );
  }

  Widget _buildContent({
    required BuildContext context,
    required String message,
    required String title,
    required IconData icon,
    required VoidCallback press,
    String textButton = "Continuar",
    bool showInfo = false,
    bool loading = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: Dimens.size32),
        UIICon(
          radius: Dimens.size120.w,
          isAlpha: true,
          bgColor: AppColors.primaryColor,
          icon: Icon(
            icon,
            size: Dimens.size90.w,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: Dimens.size32),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: Dimens.size16),
        Text(
          message,
          textAlign: TextAlign.center,
          style: context.appTextStyles.bodyTextStyle1.copyWith(
            height: 1.5,
          ),
        ),
        if (showInfo) ...[
          const SizedBox(height: Dimens.size16),
          _buildTextInfo(context),
        ],
        const Spacer(),
        UIElevatedButton(
          text: textButton,
          isLoading: loading,
          press: press,
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
        borderRadius: BorderRadius.circular(10),
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
            "1.Clique no botão abaixo para abrir a tela de configuração de permissãoes do app.\n\n2.Toque na opcão Durante o uso do app.",
            style: context.appTextStyles.sectionSubTitle1.copyWith(
              color: AppColors.darkGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
