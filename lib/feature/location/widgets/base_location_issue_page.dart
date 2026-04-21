import 'package:deehelp/app_name.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/services/permissions/location/export_location.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/core/ui/widgets/cards/card_exports.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseLocationIssuePage extends ConsumerStatefulWidget {
  final String title;
  final String message;
  final String buttonName;
  final bool loading;
  final bool showDeniedInfo;
  final VoidCallback action;
  const BaseLocationIssuePage({
    super.key,
    required this.title,
    required this.message,
    required this.buttonName,
    required this.action,
    this.loading = false,
    this.showDeniedInfo = false,
  });

  @override
  ConsumerState<BaseLocationIssuePage> createState() =>
      _BaseLocationIssuePageState();
}

class _BaseLocationIssuePageState extends ConsumerState<BaseLocationIssuePage>
    with WidgetsBindingObserver {
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
      ref.read(locationAccessNotifierProvider.notifier).check();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(locationAccessNotifierProvider);
    final loading = state.maybeMap(
      checking: (value) => true,
      orElse: () => false,
    );

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(LayoutSpacingSize.page),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HighlightIcon(
                containerSize: IconContainerSizes.xxl,
                radius: RadiusSize.xxl,
                icon: Icon(
                  Icons.location_off_rounded,
                  size: IconSizes.xxl,
                  color: context.primaryColor,
                ),
              ),
              const SizedBox(height: SpacingSize.xl),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: context.appTextOld.headerlg,
              ),
              const SizedBox(height: SpacingSize.md),
              Text(
                widget.message,
                textAlign: TextAlign.center,
                style: context.appTextOld.body.copyWith(
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: SpacingSize.sm),
              Text(
                'Usamos o GPS para mostrar ocorrências próximas, '
                'mapa da região e alertas relevantes para você.',
                textAlign: TextAlign.center,
                style: context.appTextOld.bodySmall,
              ),
              const SizedBox(height: SpacingSize.xl),
              CardHintInfo(
                message:
                    'Sua localização é usada apenas para exibir informações '
                    'da sua região. O ${AppName.appName} não rastreia você em segundo plano.',
                icon: Icon(
                  Icons.lock_outline,
                  size: IconSizes.xs,
                  color: AppColors.primaryColor,
                  // color: _muted,
                ),
              ),
              const SizedBox(height: SpacingSize.sm),
              Visibility(
                visible: widget.showDeniedInfo,
                child: CardHintInfo(
                  message:
                      'Para continuar usando todas as funcionalidades do aplicativo, é necessário habilitar as permissões do dispositivo. Vá até as configurações e ative manualmente as permissões solicitadas.',
                  bgColor: Colors.redAccent.withValues(alpha: 0.7),
                  textColor: Colors.white,
                  icon: Icon(
                    Icons.lock_outline,
                    size: IconSizes.xs,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: SpacingSize.xxl),
              ButtonPrimary(
                press: widget.action,
                text: widget.buttonName,
                loading: loading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
