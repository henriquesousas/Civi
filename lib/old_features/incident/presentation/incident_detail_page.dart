import 'package:deehelp/old_core/ui/extensions/date_extension.dart';
import 'package:deehelp/old_core/ui/extensions/string_extension.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/widgets/card/ui_card_tile.dart';
import 'package:deehelp/old_core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/old_core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/old_core/zoom_image_viewer.dart';
import 'package:deehelp/old_features/incident/domain/enum/incident_status.dart';
import 'package:deehelp/old_features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/old_features/incident/presentation/report/widgets/register/plate_number_widget.dart';
import 'package:deehelp/core/ui/widgets/image/grid_add_image.dart';
import 'package:deehelp/old_features/products/presentation/views/listing/widgets/status_badge_widget.dart';
import 'package:deehelp/old_features/products/presentation/views/update/widgets/item_detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IncidentDetailPage extends ConsumerStatefulWidget {
  final IncidentOutput incident;
  const IncidentDetailPage({
    super.key,
    required this.incident,
  });

  @override
  ConsumerState<IncidentDetailPage> createState() => _UpdateIncidentPageState();
}

class _UpdateIncidentPageState extends ConsumerState<IncidentDetailPage> {
  @override
  Widget build(BuildContext context) {
    return UICustomScaffold(
      pageTitle: "Detalhes do roubo",
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
                    title: "Protocolo",
                    showIconEdit: true,
                    showDivider: true,
                    trailing: UICardTile(
                      label: widget.incident.alertId,
                      color: AppColors.textColorBody,
                    ),
                    press: () {},
                  ),
                  ItemDetailTile(
                    title: "Veiculo roubado",
                    subtitle: widget.incident.product.name,
                    // trailing: UICardTile(
                    //   label: widget.incident.product.code,
                    //   color: AppColors.accent1,
                    // ),
                    trailing: PlateNumberWidget(
                        plateNumber: widget.incident.product.code),
                    showIconEdit: false,
                    showDivider: true,
                    press: () {},
                  ),
                  ItemDetailTile(
                    title: "Como aconteceu",
                    subtitle: widget.incident.howTo.isNullOrEmpty() == true
                        ? "Não informado"
                        : widget.incident.howTo,
                    showIconEdit: false,
                    showDivider: false,
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
                        widget.incident.local?.city.isNullOrEmpty() == true
                            ? "Não informado"
                            : widget.incident.local!.city,
                    showIconEdit: false,
                    showDivider: true,
                  ),
                  ItemDetailTile(
                    title: "Estado",
                    subtitle:
                        widget.incident.local?.state.isNullOrEmpty() == true
                            ? "Não informado"
                            : widget.incident.local!.state,
                    showIconEdit: false,
                    showDivider: true,
                  ),
                  ItemDetailTile(
                    title: "Local aproximado",
                    subtitle:
                        widget.incident.local?.address.isNullOrEmpty() == true
                            ? "Não informado"
                            : widget.incident.local!.address,
                    showIconEdit: false,
                    showDivider: false,
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
                      label: widget.incident.status.label,
                      color: widget.incident.status.color,
                      iconData: widget.incident.status.icon,
                    ),
                  ),
                  ItemDetailTile(
                    title: "Data do ocorrido",
                    subtitle: widget.incident.occurredAt.toDateWithFullMonth(),
                    showIconEdit: false,
                    showDivider: true,
                  ),
                ],
              ),
            ),
            UICustomAppCard(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Imagens do veículo",
                      style: context.appTextStyles.bodyTextStyle1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColorBody,
                      ),
                    ),
                    Stack(
                      children: [
                        GridAddImage(
                          maxPhotos: widget.incident.product.images.length,
                          photos: widget.incident.product.images,
                          press: (index) {
                            showDialog(
                              context: context,
                              barrierColor: Colors.black87,
                              builder: (context) {
                                return ImageZoomViewer(
                                  imageUrls: widget.incident.product.images
                                      .map(
                                        (e) => e.value,
                                      )
                                      .toList(),
                                  initialIndex: index,
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
