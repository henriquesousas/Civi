import 'dart:math';

import 'package:deehelp/core/extensions/date_extension.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/image/ui_my_network_image_widget.dart';
import 'package:deehelp/features/incident/presentation/add/widget/success/registered_tile_info.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_viewmodel_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisteredProductInfo extends ConsumerWidget {
  const RegisteredProductInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addIncidentViewmodelProvider);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.15),
            Colors.white.withValues(alpha: 0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.25),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                const UIMyNetworkImageWidget(
                  radius: 90,
                  imageUrl:
                      "https://garagem360.com.br/wp-content/uploads/2022/09/volkswagen_crossfox_1.jpg",
                ),
                const SizedBox(height: 12),
                Text(
                  "Citroen C3 Tendance",
                  style: context.appTextStyles.sectionTitle.copyWith(
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Dimens.size20),
          const Divider(color: Colors.white24, height: 1),
          if (state.cityController?.text != null &&
              state.stateController?.text != null) ...[
            const SizedBox(height: Dimens.size20),
            RegisteredTileInfo(
              icon: Icons.location_pin,
              title: 'Localização',
              value:
                  '${state.cityController?.text} - ${state.stateController?.text} ',
            ),
          ],
          if (state.occurredAt != null) ...[
            const SizedBox(height: Dimens.size20),
            RegisteredTileInfo(
              icon: Icons.access_time_filled,
              title: 'Horário',
              value: "${state.occurredAt?.toDayMonthYearFormat() ?? ''} ",
            ),
          ],
          const SizedBox(height: Dimens.size20),
          RegisteredTileInfo(
            icon: Icons.fingerprint,
            title: 'ID do Alerta',
            value: 'INC${generateIncidentId()}',
          ),
        ],
      ),
    );
  }

  String generateIncidentId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(9000) + 1000; // 1000-9999 (nunca 0)
    final nano = DateTime.now().microsecondsSinceEpoch % 1000;

    // Combina: últimos 8 dígitos do timestamp + random + nano
    final timestampPart = (timestamp % 100000000).toString().padLeft(8, '0');
    final randomPart = random.toString();
    final nanoPart = nano.toString().padLeft(3, '0');

    return timestampPart.substring(0, 8) + randomPart + nanoPart;
  }
}
