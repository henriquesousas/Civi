import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/services/network/network_info_provider.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/badge/badge_text.dart';
import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/core/ui/widgets/buttons/button_edit.dart';
import 'package:deehelp/core/ui/widgets/buttons/button_outline.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/core/ui/widgets/image/image_view_dialog.dart';
import 'package:deehelp/core/utils/enum_utils.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/incidents/update/incident_field.dart';
import 'package:deehelp/feature/incidents/update/update_incident_args.dart';
import 'package:deehelp/feature/incidents/update/widgets/action_tile.dart';
import 'package:deehelp/feature/incidents/update/widgets/confirm_dialog.dart';
import 'package:deehelp/feature/incidents/update/widgets/danger_card.dart';
import 'package:deehelp/feature/incidents/update/widgets/horizontal_photos.dart';
import 'package:deehelp/feature/items/detail/widgets/editable_field_tile.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/section_title.dart';
import 'package:deehelp/feature/items/soft_divider.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:deehelp/core/extension/date_extension.dart';
import 'package:deehelp/core/extension/dialog_extension.dart';
import 'package:deehelp/feature/incidents/providers/incident_list_viewmodel_provider.dart';
import 'package:deehelp/feature/incidents/providers/incident_selected_provider.dart';
import 'package:deehelp/feature/incidents/providers/update_incident_viewmodel_provider.dart';
import 'package:deehelp/feature/incidents/update/state/update_incident_state.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UpdateIncidentPage extends ConsumerStatefulWidget {
  const UpdateIncidentPage({super.key});

  @override
  ConsumerState<UpdateIncidentPage> createState() => _UpdateIncidentPageState();
}

class _UpdateIncidentPageState extends ConsumerState<UpdateIncidentPage> {
  @override
  Widget build(BuildContext context) {
    final authenticatedUser = ref.watch(authenticatedUserProvider);
    final state = ref.watch(updateIncidentViewmodelProvider);

    final isVehicle = state.updatedValue!.product.type != ItemType.phone.name;
    bool isOwner = authenticatedUser == null
        ? false
        : state.updatedValue!.userId == authenticatedUser.id;

    ref.listen<UpdateIncidentState>(
      updateIncidentViewmodelProvider,
      (oldState, currentState) {
        if (currentState.updatedSuccessfully) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.watch(incidentSelectedProvider.notifier).state =
                currentState.updatedValue;
            context.showSnackBar("Registro alterado com sucesso");
          });
          return;
        }

        if (oldState?.errorUpdateStatusMessage !=
                currentState.errorUpdateStatusMessage &&
            currentState.errorUpdateStatusMessage != null) {
          context.showSnackBar(
            currentState.errorUpdateStatusMessage!,
            type: DialogType.error,
          );
        }

        if (currentState.deletedSuccessfully) {
          final ni = ref.watch(networkInfoProvider);
          final niProvider = incidentListViewModelProvider(ni);
          incidentListViewModelProvider(ni);
          ref.watch(niProvider.notifier).removeAt(currentState.updatedValue!);
          // ref
          //     .watch(incidentListViewModelProvider.notifier)
          //     .removeAt(currentState.updatedValue!);
          if (context.canPop()) context.pop();
        }

        if (oldState?.errorMessage != currentState.errorMessage &&
            currentState.errorMessage != null) {
          context.showSnackBar(
            currentState.errorMessage!,
            type: DialogType.error,
          );
        }
      },
    );

    return Scaffold(
      appBar: DefaultAppBar(
        title: "Ocorrência",
        showBackButton: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.verified_rounded,
              color: state.updatedValue!.visibilty
                  ? AppColors.success
                  : AppColors.grey,
              size: IconSizes.md,
            ),
          ),
          IconButton(
            onPressed: () => UrlLauncherUtils.shareMyIncident(
              context,
              state.updatedValue!.alertId,
              state.updatedValue!.createdAt,
            ),
            icon: Icon(
              Icons.share,
              size: IconSizes.md,
            ),
          )
        ],
        press: () => context.pop(),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // '${state.updatedValue!.product.name} reportado como roubado',
                      state.updatedValue!.product.name,
                      style: context.appText.headerlg,
                    ),
                    const SizedBox(height: SpacingSize.sm),
                    Text(
                      'Roubado nas proximidades de ${_getLocal(state)} • ${_dataLabel(state)}',
                      style: context.appText.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              // StatusBadge(style: StatusStyle.from(state.updatedValue!.status)),
              StatusBadgeV2(status: state.updatedValue!.status),
              // _StatusPill(status: status),
            ],
          ),
          if (isVehicle) ...[
            const SizedBox(height: SpacingSize.lg),
            const SectionTitle("Fotos do veículo"),
            PageCard(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        HighlightIcon(
                          icon: Icon(
                            Icons.photo_library_outlined,
                            color: context.onSurface,
                          ),
                        ),
                        const SizedBox(width: SpacingSize.md),
                        Expanded(
                          child: Text(
                            'Imagens do item',
                            style: context.appText.bodySmall.copyWith(
                              fontWeight: FontWeight.w900,
                              color: context.onSurface,
                            ),
                          ),
                        ),
                        BadgeText(
                          text: state.updatedValue?.product.images.length
                                  .toString() ??
                              "0",
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    HorizontalPhotos(
                      photos: state.updatedValue?.product.images ?? [],
                      onTap: (index) => openPhotoViewer(
                        index,
                        state.updatedValue!.product.images,
                      ),
                    ),
                    const SizedBox(height: SpacingSize.sm),
                    Text(
                      'Dica: fotos nítidas ajudam a identificar o veículo mais rápido.',
                      style: context.appText.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (!isVehicle) ...[
            const SizedBox(height: SpacingSize.lg),
            const SectionTitle("IMEI"),
            PageCard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const HighlightIcon(icon: Icon(Icons.dialpad_outlined)),
                        const SizedBox(width: SpacingSize.md),
                        Expanded(
                          child: Text(
                            'Identificação do aparelho',
                            style: context.appText.bodySmall.copyWith(
                              fontWeight: FontWeight.w900,
                              color: context.onSurface,
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: ButtonOutline(
                            press: () => _copyImei(
                                context, state.updatedValue!.product.code),
                            icon: Icon(Icons.copy_outlined, size: IconSizes.sm),
                            text: "Copiar",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: SpacingSize.md),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        // color: const Color(0xFFF5F7FD),
                        color: AppColors.primaryColor.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(18),
                        // border: Border.all(color: const Color(0xFFE6EAF6)),
                        border: Border.all(
                            color:
                                AppColors.primaryColor.withValues(alpha: 0.1),
                            width: 1),
                      ),
                      child: Text(
                        state.updatedValue!.product.code,
                        style: context.appText.headermd.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: SpacingSize.md),
                    Text(
                      'Você pode informar esse número às autoridades e operadoras.',
                      style: context.appText.caption.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: SpacingSize.md),
          const SectionTitle('Informações'),
          PageCard(
            child: Column(
              children: [
                EditableFieldTile(
                  icon: Icons.fingerprint_outlined,
                  label: 'ID da ocorrência',

                  textColor: context.onSurface,
                  value: state.updatedValue?.alertId ?? '',
                  // onEdit: () async {},
                ),
                const SoftDivider(),
                EditableFieldTile(
                  icon: Icons.category_outlined,
                  label: 'Tipo do item',

                  textColor: context.onSurface,
                  value: EnumUtils.fromString(
                          ItemType.values, state.updatedValue!.product.type)
                      .label,
                  // onEdit: () async {},
                ),
                const SoftDivider(),
                EditableFieldTile(
                  icon: Icons.branding_watermark_outlined,
                  label: 'Marca',
                  textColor: context.onSurface,
                  value: state.updatedValue!.product.brand,
                ),
                const SoftDivider(),
                EditableFieldTile(
                  icon: Icons.color_lens_outlined,
                  label: 'Cor',
                  textColor: context.onSurface,
                  value: state.updatedValue!.product.color,
                ),
                const SoftDivider(),
                if (isVehicle) ...[
                  EditableFieldTile(
                    icon: Icons.confirmation_number_outlined,
                    label: 'Placa',
                    textColor: context.onSurface,
                    value: state.updatedValue?.product.code ?? '',
                  ),
                ],
                if (!isVehicle) ...[
                  EditableFieldTile(
                    icon: Icons.numbers,
                    label: 'IMEI',
                    textColor: context.onSurface,
                    value: state.updatedValue?.product.code ?? '',
                  ),
                ],
                const SoftDivider(),
                EditableFieldTile(
                  icon: Icons.place_outlined,
                  label: 'Detalhes do item',
                  textColor: context.onSurface,
                  value: state.updatedValue?.product.obs ?? '',
                ),
                const SoftDivider(),
                EditableFieldTile(
                  icon: Icons.place_outlined,
                  label: 'Região',
                  value: _getLocal(state),
                  onEdit: isOwner
                      ? () async {
                          context.push(
                            IncidentRouter.update,
                            extra: UpdateIncidentArgs.toMap(
                              toolbarTitle: 'Atualizar cidade',
                              description:
                                  "Atualize a cidade vinculada ao incidente, garantindo que o registro esteja correto e reflita o local exato onde ocorreu.",
                              hint: "Informe a cidade",
                              value: state.updatedValue?.local?.city ?? '',
                              field: IncidentField.city,
                              showMyLocationButton: true,
                            ),
                          );
                        }
                      : null,
                ),
              ],
            ),
          ),
          const SizedBox(height: SpacingSize.md),
          const SectionTitle('Como aconteceu'),
          PageCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    HighlightIcon(
                        icon: Icon(
                      Icons.description_outlined,
                      color: context.onSurface,
                    )),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Descrição (até 300 caracteres)',
                        style: context.appText.caption.copyWith(
                          color: context.secondaryColor,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    if (isOwner)
                      ButtonEdit(
                        onTap: () {
                          context.push(
                            // AppRouter.updateIncidentTile,
                            IncidentRouter.update,
                            extra: UpdateIncidentArgs.toMap(
                              toolbarTitle: 'Como acontenceu',
                              description:
                                  "Aqui você pode revisar e atualizar a informação sobre como o incidente aconteceu, garantindo que o registro reflita da melhor forma a situação vivida.",
                              hint: "Conte-nos um pouco mais sobre o ocorrido",
                              value: state.updatedValue?.howTo ?? '',
                              field: IncidentField.howto,
                              maxLength: 300,
                              maxLine: 6,
                            ),
                          );
                        },
                      ),
                  ],
                ),
                const SizedBox(height: SpacingSize.md),
                Text(
                  state.updatedValue?.howTo == null
                      ? 'Nenhuma descrição informada.'
                      : state.updatedValue!.howTo!,
                  style: context.appText.bodySmall.copyWith(
                    color: context.onSurface,
                    fontWeight: FontWeight.w600,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: SpacingSize.lg),
          const SectionTitle('Ações'),
          Column(
            children: [
              ActionTile(
                icon: Icons.local_police_outlined,
                title: 'Chamar a polícia',
                subtitle: 'Discar 190',
                onTap: () => UrlLauncherUtils.makePhoneCall("190"),
                isPrimary: true,
              ),
              // const SizedBox(height: SpacingSize.lg),
              // Row(
              //   children: [
              //     Expanded(
              //       child: ButtonOutline(
              //         press: () => UrlLauncherUtils.launchWhatsIncidentDenunc(
              //           alertId: state.updatedValue!.alertId,
              //           context: context,
              //         ),
              //         text: "WhatsApp",
              //         icon: Icon(
              //           Icons.chat_bubble_outline,
              //           color: context.onSurfaceVariant,
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: SpacingSize.md),
              //     Expanded(
              //       child: ButtonOutline(
              //         bgColor: context.primaryColor,
              //         borderColor: context.primaryColor,
              //         textColor: context.surface,
              //         press: () => UrlLauncherUtils.shareIncident(
              //           context,
              //           state.updatedValue!.alertId,
              //           state.updatedValue!.createdAt,
              //         ),
              //         text: "Compartilhar",
              //         icon: Icon(
              //           Icons.share,
              //           color: context.surface,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
          const SizedBox(height: SpacingSize.lg),
          if (isOwner) ...[
            const SectionTitle('Danger Zone'),
            DangerCard(
              title: 'Cancelar ocorrência',
              subtitle: 'Use apenas se o registro foi feito por engano.',
              icon: Icons.cancel_outlined,
              onTap: () => _cancelIncident(isOwner),
              destructive: true,
            ),
          ],
        ],
      ),
    );
  }

  Future<void> openPhotoViewer(int index, List<ImageMedia> photos) async {
    await showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.92),
      builder: (_) => ImageViewDialog(
        photos: photos,
        initialIndex: index,
      ),
    );
  }

  Future<void> _cancelIncident(
    bool isOwner,
  ) async {
    if (!isOwner) return;

    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => const ConfirmDialog(
        title: 'Cancelar ocorrência?',
        message:
            'Use apenas se você registrou por engano. A ocorrência ficará como “Cancelado”.',
        confirmLabel: 'Sim, cancelar',
      ),
    );
    if (ok != true) return;

    // setState(() => status = IncidentStatus.canceled);
  }

  String _getLocal(UpdateIncidentState state) {
    debugPrint(state.updatedValue?.local?.address);
    if (state.updatedValue == null) return 'Não informado';
    if (state.updatedValue!.local == null) return 'Não informado';
    bool hasAddress = state.updatedValue!.local?.address != null;

    final address = hasAddress ? "${state.updatedValue!.local?.address} •" : '';

    return "$address${state.updatedValue!.local!.city!} • ${state.updatedValue!.local?.state!}";
  }

  String _dataLabel(UpdateIncidentState state) {
    return state.updatedValue!.occurredAt.timeAgo();
  }

  Future<void> _copyImei(BuildContext context, String imei) async {
    await Clipboard.setData(ClipboardData(text: imei));
    if (!context.mounted) return;
    context.showSnackBar("IMEI copiado");
  }
}
