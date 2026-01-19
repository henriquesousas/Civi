import 'package:deehelp/core/extensions/date_extension.dart';
import 'package:deehelp/core/extensions/dialog_extension.dart';
import 'package:deehelp/core/extensions/string_extension.dart';
import 'package:deehelp/core/router/app_router.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/card/ui_card_tile.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/incident/domain/enum/incident_status.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_list_viewmodel_provider.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_selected_provider.dart';
import 'package:deehelp/features/incident/presentation/providers/update_incident_viewmodel_provider.dart';
import 'package:deehelp/features/incident/presentation/update/incident_field.dart';
import 'package:deehelp/features/incident/presentation/update/state/update_incident_state.dart';
import 'package:deehelp/features/incident/presentation/update/update_incident_args.dart';
import 'package:deehelp/features/products/presentation/views/add/widget/grid_add_photo.dart';
import 'package:deehelp/features/products/presentation/views/listing/widgets/status_badge_widget.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/item_detail_tile.dart';
import 'package:flutter/material.dart';
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
    final state = ref.watch(updateIncidentViewmodelProvider);
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
          ref
              .watch(incidentListViewModelProvider.notifier)
              .removeAt(currentState.updatedValue!);
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
    return UICustomScaffold(
      pageTitle: "Detalhes",
      onBackButtonTap: () => context.pop(),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          spacing: 10,
          children: [
            UICustomAppCard(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  ItemDetailTile(
                    title: "Veiculo roubado",
                    subtitle: state.updatedValue?.product.name ?? '',
                    trailing: UiCardTile(
                      label: state.updatedValue?.product.code ?? '',
                      color: AppColors.accent1,
                    ),
                    showIconEdit: false,
                    showDivider: true,
                    press: () {},
                  ),
                  ItemDetailTile(
                    title: "Como aconteceu",
                    subtitle: state.updatedValue?.howTo.isNullOrEmpty() == true
                        ? "Não informado"
                        : state.updatedValue?.howTo!,
                    showIconEdit: true,
                    showDivider: false,
                    press: () => context.push(
                      AppRouter.updateIncidentTile,
                      extra: UpdateIncidentArgs.toMap(
                        toolbarTitle: 'Como acontenceu',
                        description:
                            "Aqui você pode revisar e atualizar a informação sobre como o incidente aconteceu, garantindo que o registro reflita da melhor forma a situação vivida.",
                        hint: "Conte-nos um pouco mais sobre o ocorrido",
                        value: state.updatedValue?.howTo ?? '',
                        field: IncidentField.howto,
                        maxLength: 200,
                        maxLine: 6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            UICustomAppCard(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  ItemDetailTile(
                    title: "Cidade",
                    subtitle:
                        state.updatedValue?.local?.city.isNullOrEmpty() == true
                            ? "Não informado"
                            : state.updatedValue?.local!.city,
                    showIconEdit: true,
                    showDivider: true,
                    press: () => context.push(
                      AppRouter.updateIncidentTile,
                      extra: UpdateIncidentArgs.toMap(
                        toolbarTitle: 'Atualizar cidade',
                        description:
                            "Atualize a cidade vinculada ao incidente, garantindo que o registro esteja correto e reflita o local exato onde ocorreu.",
                        hint: "Informe a cidade",
                        value: state.updatedValue?.local?.city ?? '',
                        field: IncidentField.city,
                        showMyLocationButton: true,
                      ),
                    ),
                  ),
                  ItemDetailTile(
                    title: "Estado",
                    subtitle:
                        state.updatedValue?.local?.state.isNullOrEmpty() == true
                            ? "Não informado"
                            : state.updatedValue?.local!.state,
                    showIconEdit: true,
                    showDivider: true,
                    press: () => context.push(
                      AppRouter.updateIncidentTile,
                      extra: UpdateIncidentArgs.toMap(
                        toolbarTitle: 'Atualizar estado',
                        description:
                            "Atualize o estado vinculada ao incidente, garantindo que o registro esteja correto e reflita o local exato onde ocorreu.",
                        hint: "Informe o estado",
                        value: state.updatedValue?.local?.state ?? '',
                        field: IncidentField.state,
                        showMyLocationButton: true,
                      ),
                    ),
                  ),
                  ItemDetailTile(
                    title: "Local aproximado",
                    subtitle:
                        state.updatedValue?.local?.address.isNullOrEmpty() ==
                                true
                            ? "Não informado"
                            : state.updatedValue?.local!.address,
                    showIconEdit: true,
                    showDivider: false,
                    press: () => context.push(
                      AppRouter.updateIncidentTile,
                      extra: UpdateIncidentArgs.toMap(
                        toolbarTitle: 'Atualizar endereço aproximado',
                        description:
                            "Atualize o endereço aproxinado do ocorrido vinculada ao incidente, garantindo que o registro esteja correto e reflita o local exato onde ocorreu.",
                        hint: "Endereço próximo",
                        value: state.updatedValue?.local?.address ?? '',
                        field: IncidentField.address,
                        showMyLocationButton: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            UICustomAppCard(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemDetailTile(
                    title: "Status",
                    subtitle: "Situação do cadastro",
                    showIconEdit: true,
                    showDivider: true,
                    trailing: StatusBadgeWidget(
                      label: state.updatedValue?.status.label ?? '',
                      color: state.updatedValue!.status.color,
                      iconData: state.updatedValue!.status.icon,
                    ),
                    press: () {},
                  ),
                  ItemDetailTile(
                    title: "Protocolo",
                    // subtitle: "Código aleatório gerado automaticamente",
                    showIconEdit: true,
                    showDivider: true,
                    trailing: UiCardTile(
                      label: state.updatedValue?.alertId ?? '',
                      color: AppColors.greyColor,
                    ),
                    press: () {},
                  ),
                  ItemDetailTile(
                    title: "Visível",
                    subtitle:
                        "Ao selecionar essa opção seu cadastro ficará invísivel para toda a comunidade",
                    showIconEdit: true,
                    showDivider: true,
                    trailing: Switch(
                      activeThumbColor: AppColors.primaryColor,
                      inactiveThumbColor: AppColors.greyColor,
                      trackOutlineColor:
                          WidgetStateProperty.resolveWith<Color>((states) {
                        if (states.contains(WidgetState.selected)) {
                          return AppColors.primaryColor.withValues(alpha: 0.03);
                        }
                        return AppColors.greyColor;
                      }),
                      value: ref
                              .watch(updateIncidentViewmodelProvider)
                              .updatedValue
                              ?.visibilty ==
                          true,
                      onChanged: (value) {
                        ref
                            .watch(updateIncidentViewmodelProvider.notifier)
                            .updateStatus();
                      },
                    ),
                    press: () {},
                  ),
                  ItemDetailTile(
                    title: "Data do ocorrido",
                    subtitle:
                        state.updatedValue?.occurredAt.toDateWithFullMonth(),
                    showIconEdit: false,
                    showDivider: true,
                    press: () {},
                  ),
                ],
              ),
            ),
            UICustomAppCard(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  ItemDetailTile(
                    title: "Fotos",
                    showIconEdit: false,
                    showDivider: false,
                    press: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridAddPhoto(
                      maxPhotos: state.updatedValue?.product.images.length ?? 0,
                      photos: state.updatedValue?.product.images ?? [],
                    ),
                  ),
                ],
              ),
            ),
            UIElevatedButton(
                bgColor: AppColors.errorColor,
                text: "Deletar cadastro",
                isEnabled: true,
                isLoading: false,
                press: () async {
                  final yes = await context.showQuestionDialog("Atenção",
                      'Deseja realmente deletar o incidente: ${state.updatedValue!.alertId} ?');

                  if (yes) {
                    ref.watch(updateIncidentViewmodelProvider.notifier).delete(
                          state.updatedValue!.id,
                        );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
