import 'package:deehelp/core/extensions/date_extension.dart';
import 'package:deehelp/core/extensions/dialog_extension.dart';
import 'package:deehelp/core/extensions/string_extension.dart';
import 'package:deehelp/core/extensions/time_extension.dart';
import 'package:deehelp/core/router/app_router.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/avatar/profile_image_with_upload_button_widget.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/card/ui_card_tile.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/core/ui/widgets/image/ui_my_network_image_widget.dart';
import 'package:deehelp/features/incident/domain/enum/incident_status.dart';
import 'package:deehelp/features/incident/domain/enum/type_alert.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_viewmodel_providers.dart';
import 'package:deehelp/features/incident/presentation/views/listing/state/listing_incident_state.dart';
import 'package:deehelp/features/incident/presentation/views/update/state/update_incident_state.dart';
import 'package:deehelp/features/incident/presentation/views/update/update_incident_args.dart';
import 'package:deehelp/features/products/presentation/views/add/widget/grid_add_photo.dart';
import 'package:deehelp/features/products/presentation/views/listing/widgets/status_badge_widget.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/item_detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class UpdateIncidentPage extends ConsumerStatefulWidget {
  const UpdateIncidentPage({super.key});

  @override
  ConsumerState<UpdateIncidentPage> createState() => _UpdateIncidentPageState();
}

class _UpdateIncidentPageState extends ConsumerState<UpdateIncidentPage> {
  bool _visibility = false;
  @override
  Widget build(BuildContext context) {
    final currentIncident =
        ref.watch(listingIncidentViewmodelProvider).maybeMap(
              guard: (value) => value.incident,
              orElse: () => null,
            );

    if (currentIncident == null) context.pop();
    ref.listen<UpdateIncidentState>(
      updateIncidentViewmodelProvider,
      (oldState, currentState) {
        if (currentState.updatedSuccessfully) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.showSnackBar("Registro alterado com sucesso");
          });
          return;
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
                    subtitle: currentIncident?.product.name ?? '',
                    trailing: UiCardTile(
                        label: currentIncident!.product.code,
                        color: AppColors.accent1),
                    showIconEdit: false,
                    showDivider: true,
                    press: () {},
                  ),
                  ItemDetailTile(
                    title: "Como aconteceu",
                    subtitle: currentIncident.howTo.isNullOrEmpty() == true
                        ? "Não informado"
                        : currentIncident.howTo!,
                    showIconEdit: true,
                    showDivider: false,
                    press: () => context.push(
                      AppRouter.updateIncidentTile,
                      extra: UpdateIncidentArgs.toMap(
                        toolbarTitle: 'Como acontenceu',
                        description:
                            "Aqui você pode revisar e atualizar a informação sobre como o incidente aconteceu, garantindo que o registro reflita da melhor forma a situação vivida.",
                        hint: "Conte-nos um pouco mais sobre o ocorrido",
                        value: currentIncident.howTo ?? '',
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
                        currentIncident?.local?.city.isNullOrEmpty() == true
                            ? "Não informado"
                            : currentIncident!.local!.city,
                    showIconEdit: true,
                    showDivider: true,
                    press: () => context.push(
                      AppRouter.updateIncidentTile,
                      extra: UpdateIncidentArgs.toMap(
                        toolbarTitle: 'Atualizar cidade',
                        description:
                            "Atualize a cidade vinculada ao incidente, garantindo que o registro esteja correto e reflita o local exato onde ocorreu.",
                        hint: "Informe a cidade",
                        value: currentIncident?.local?.city ?? '',
                        field: IncidentField.city,
                      ),
                    ),
                  ),
                  ItemDetailTile(
                    title: "Estado",
                    subtitle:
                        currentIncident?.local?.state.isNullOrEmpty() == true
                            ? "Não informado"
                            : currentIncident!.local!.state,
                    showIconEdit: true,
                    showDivider: true,
                    press: () => context.push(
                      AppRouter.updateIncidentTile,
                      extra: UpdateIncidentArgs.toMap(
                        toolbarTitle: 'Atualizar estado',
                        description:
                            "Atualize o estado vinculada ao incidente, garantindo que o registro esteja correto e reflita o local exato onde ocorreu.",
                        hint: "Informe o estado",
                        value: currentIncident?.local?.state ?? '',
                        field: IncidentField.state,
                      ),
                    ),
                  ),
                  ItemDetailTile(
                    title: "Local aproximado",
                    subtitle:
                        currentIncident?.local?.address.isNullOrEmpty() == true
                            ? "Não informado"
                            : currentIncident!.local!.address,
                    showIconEdit: true,
                    showDivider: false,
                    press: () => context.push(
                      AppRouter.updateIncidentTile,
                      extra: UpdateIncidentArgs.toMap(
                        toolbarTitle: 'Atualizar endereço aproximado',
                        description:
                            "Atualize o endereço aproxinado do ocorrido vinculada ao incidente, garantindo que o registro esteja correto e reflita o local exato onde ocorreu.",
                        hint: "Endereço próximo",
                        value: currentIncident?.local?.address ?? '',
                        field: IncidentField.address,
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
                    title: "Postado por",
                    subtitle: "anonimo",
                    trailing: ProfileImageWithUploadButtonWidget(
                      onTap: () {},
                      imageUrl: "Anonimo",
                      imageAlt: "Anonimo",
                      showUploadIcon: false,
                      height: Dimens.size32.h,
                      width: Dimens.size32.w,
                      radius: Dimens.profileImageRadius.w,
                    ),
                    showIconEdit: true,
                    showDivider: true,
                    press: () {},
                  ),
                  ItemDetailTile(
                    title: "Status",
                    subtitle: "Situação do cadastro",
                    showIconEdit: true,
                    showDivider: true,
                    trailing: StatusBadgeWidget(
                      label: currentIncident!.status.label,
                      color: currentIncident.status.color,
                      iconData: currentIncident.status.icon,
                    ),
                    press: () {},
                  ),
                  ItemDetailTile(
                    title: "Protocolo",
                    // subtitle: "Código aleatório gerado automaticamente",
                    showIconEdit: true,
                    showDivider: true,
                    trailing: UiCardTile(
                      label: currentIncident.alertId,
                      color: AppColors.greyColor,
                    ),
                    press: () {},
                  ),
                  ItemDetailTile(
                    title: "Visível",
                    // subtitle:
                    //     "Toda a comunidade conseguirá ver esse cadastro (Recomendado)",
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
                      value: _visibility,
                      onChanged: (value) {
                        setState(() {
                          _visibility = !_visibility;
                        });
                      },
                    ),
                    press: () {},
                  ),
                  ItemDetailTile(
                    title: "Data do ocorrido",
                    subtitle: currentIncident.occurredAt.toDateWithFullMonth(),
                    showIconEdit: false,
                    showDivider: true,
                    press: () {},
                  ),
                  // ItemDetailTile(
                  //   title: "Criado em",
                  //   subtitle: currentIncident.createdAt.toDayMonthYearFormat(),
                  //   showIconEdit: false,
                  //   showDivider: true,
                  //   press: () {},
                  // ),
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
                      maxPhotos: currentIncident?.product.images.length ?? 0,
                      photos: currentIncident?.product.images ?? [],
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
              press: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Arquivo excluído'),
                    duration: Duration(seconds: 5),
                    action: SnackBarAction(
                      label: 'DESFAZER',
                      textColor: Colors.yellow,
                      onPressed: () {
                        // Ação ao clicar
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
