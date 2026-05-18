import 'package:deehelp/app_name.dart';
import 'package:deehelp/old_core/services/permissions/location/export_location.dart';
import 'widgets/base_location_issue_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GpsDisabledPage extends ConsumerStatefulWidget {
  const GpsDisabledPage({super.key});

  @override
  ConsumerState<GpsDisabledPage> createState() => _GpsDisabledPageState();
}

class _GpsDisabledPageState extends ConsumerState<GpsDisabledPage> {
  @override
  Widget build(BuildContext context) {
    return BaseLocationIssuePage(
      title: "Ative o GPS",
      message:
          "Para funcionar corretamente, o ${AppName.appName} precisa acessar sua localização.",
      buttonName: "Ativar GPS",
      action: () async {
        ref.read(locationAccessNotifierProvider.notifier).openGpsSettings();
      },
    );
  }
}
