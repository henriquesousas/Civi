import 'package:deehelp/core/extensions/date_extension.dart';
import 'package:deehelp/core/extensions/time_extension.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/image/ui_my_network_image_widget.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_report_viewmodel_provider.dart';
import 'package:deehelp/features/incident/presentation/views/add/state/add_incident_state.dart';
import 'package:deehelp/features/incident/presentation/views/add/widgets/success/registered_tile_info.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_viewmodel_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                UIMyNetworkImageWidget(
                  width: Dimens.size90.w,
                  height: Dimens.size90.h,
                  radius: 200,
                  imageUrl: state.product?.images.first.value ?? '',
                ),
                const SizedBox(height: 12),
                Text(
                  state.product?.name ?? '',
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
          const SizedBox(height: Dimens.size20),
          RegisteredTileInfo(
            icon: Icons.access_time_filled,
            title: 'Data',
            value: _getDate(state),
          ),
          const SizedBox(height: Dimens.size20),
          if (state.alertId != null) ...[
            RegisteredTileInfo(
              icon: Icons.fingerprint,
              title: 'ID do Alerta',
              value: state.alertId!,
            ),
          ],
        ],
      ),
    );
  }

  String _getDate(AddIncidentState state) {
    if (state.occurredAt == null && state.timeOccurredAt == null) {
      return "Agora";
    }
    return "${state.occurredAt?.toDayMonthYearFormat() ?? ''} ${state.timeOccurredAt?.to24hFormat()}";
  }
}
