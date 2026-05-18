import 'package:deehelp/app_name.dart';
import 'package:deehelp/old_core/services/permissions/location/export_location.dart';
import 'widgets/base_location_issue_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationDeniedPage extends ConsumerStatefulWidget {
  const LocationDeniedPage({super.key});

  @override
  ConsumerState<LocationDeniedPage> createState() =>
      _LocationRequiredPageState();
}

class _LocationRequiredPageState extends ConsumerState<LocationDeniedPage>
    with WidgetsBindingObserver {
  bool _isDeniedPermanently = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(locationAccessNotifierProvider);
    state.maybeMap(
      deniedPermanently: (value) {
        _isDeniedPermanently = true;
        return _isDeniedPermanently;
      },
      denied: (value) {
        _isDeniedPermanently = false;
        return _isDeniedPermanently;
      },
      orElse: () => false,
    );

    return BaseLocationIssuePage(
      title: "Permita o acesso à localização",
      message:
          "O ${AppName.appName} precisa da sua permissão para acessar a localização.",
      buttonName: !_isDeniedPermanently
          ? "Permitir localização"
          : "Abrir configurações",
      showDeniedInfo: _isDeniedPermanently,
      action: () {
        if (!_isDeniedPermanently) {
          ref.read(locationAccessNotifierProvider.notifier).request();
        } else {
          ref
              .read(locationAccessNotifierProvider.notifier)
              .openNativePermissionSettings();
        }
      },
    );
  }
}
