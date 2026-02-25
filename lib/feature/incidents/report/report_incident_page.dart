import 'dart:async';
import 'dart:ui';

import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/cards/card_exports.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/core/utils/enum_utils.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/incidents/report/report_incident_viewmodel.dart';
import 'package:deehelp/feature/incidents/report/widgets/register/expandable_card.dart';
import 'package:deehelp/feature/incidents/report/widgets/register/item_card.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/section_title.dart';
import 'package:deehelp/feature/profile/item_list_router_args.dart';
import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
import 'package:deehelp/old_core/ui/widgets/button/ui_hold_confirm_button.dart';
import 'package:deehelp/feature/incidents/providers/report_incident_event_provider.dart';
import 'package:deehelp/feature/incidents/providers/report_incident_viewmodel_provider.dart';
import 'package:deehelp/feature/incidents/report/events/report_incident_event.dart';
import 'package:deehelp/feature/incidents/report/widgets/error/incident_error_overlay.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:deehelp/feature/items/list/item_listing_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ReportIncidentPage extends ConsumerStatefulWidget {
  const ReportIncidentPage({super.key});

  @override
  ConsumerState<ReportIncidentPage> createState() => _AddIncidentPageState();
}

class _AddIncidentPageState extends ConsumerState<ReportIncidentPage>
    with SingleTickerProviderStateMixin {
  double holdProgress = 0.0;
  Timer? holdTimer;
  bool immediateDone = false;

  @override
  void initState() {
    super.initState();

    // LocationService().getCurrentLocation().then(
    //   (place) {
    //     if (!mounted) return null;
    //     if (place == null) return null;

    //     final currentLocation =
    //         ref.watch(currentLocationProvider.notifier).state;

    //     // ref
    //     //     .read(reportIncidentViewmodelProvider.notifier)
    //     //     .addCurrentPlace(place);
    //   },
    // );
  }

  void listener() {
    ref.listen(
      reportIncidentEventProvider,
      (previous, event) {
        if (event == null) return;
        event.when(error: (error) {
          if (context.canPop()) {
            context.pop();
          }
          showGeneralDialog(
            context: context,
            barrierDismissible: false,
            barrierColor: Colors.transparent,
            pageBuilder: (_, __, ___) => IncidentErrorOverlay(onRetry: () {
              if (context.canPop()) {
                context.pop();
              }
            }),
          );
        }, loadProgress: () {
          // showGeneralDialog(
          //   context: context,
          //   barrierDismissible: false,
          //   barrierColor: Colors.transparent,
          //   pageBuilder: (_, __, ___) =>
          //       const ReportIncidentLoadingProgressOverlay(),
          // );
          showDialogOverlay(context);
        }, successfully: (args) {
          Future.delayed(const Duration(seconds: 3), () {
            if (!mounted) return;
            if (context.canPop()) {
              context.pop();
              context.pushReplacement(
                IncidentRouter.success,
                extra: args,
              );
            }
          });
        });
      },
    );
  }

  Future<void> _pickItem(ReportIncidentViewmodel viewModel) async {
    final product = await context.push<Product?>(
      ItemsRouter.list,
      extra: ItemListRouteArgs(args: ItemListingArgs(isAddingIncident: true)),
    );
    if (product != null) {
      viewModel.selectProduct(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reportIncidentViewmodelProvider);
    final viewModel = ref.watch(reportIncidentViewmodelProvider.notifier);

    final selectedItem = state.product;
    final hasItem = state.product != null;

    listener();

    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Reportar incidente',
        showBackButton: true,
        press: () => context.pop(),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          CardHint(
            title: 'Selecione um item',
            message:
                'Para reportar um incidente, escolha um item já cadastrado no seu perfil.',
            icon: Icon(
              Icons.info_outline,
              color: context.primaryColor,
              size: IconSizes.md,
            ),
          ),
          const SizedBox(height: SpacingSize.md),
          PageCard(
            child: InkWell(
              borderRadius: BorderRadius.circular(RadiusSize.xl),
              onTap: () => _pickItem(viewModel),
              // onTap: () => showDialogOverlay(context),
              child: Padding(
                padding: const EdgeInsets.all(LayoutSpacingSize.container),
                child: Row(
                  children: [
                    if (state.product != null)
                      ItemCard(item: state.product!)
                    else
                      HighlightIcon(
                        icon: Icon(
                          Icons.inventory_2_outlined,
                          color: context.primaryColor,
                        ),
                      ),
                    const SizedBox(width: SpacingSize.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hasItem ? selectedItem!.name : 'Escolher item',
                            // "Escolher item",
                            style: context.appText.headermd,
                          ),
                          const SizedBox(height: SpacingSize.xs),
                          Text(
                            hasItem
                                ? '${EnumUtils.fromString(ItemType.values, selectedItem!.type).label} • ${selectedItem.name} • ${selectedItem.color}'
                                : 'Toque para selecionar um item cadastrado',
                            style: context.appText.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: context.secondaryColor),
                  ],
                ),
              ),
            ),
          ),
          if (hasItem) ...[
            const SizedBox(height: SpacingSize.xl),
            const SectionTitle('Tipo de registro'),
            ExpandableCard(
              selected: state.type == TypeAlert.immediately,
              title: 'Imediato',
              badge: 'RÁPIDO',
              icon: Icons.flash_on_outlined,
              subtitle:
                  'Use quando acabou de acontecer. Registre agora e complete os detalhes depois.',
              onTap: () => viewModel.selectAlertType(TypeAlert.immediately),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: SpacingSize.md),
                    const CardHintInfo(
                        message:
                            'Você poderá complementar data, local e descrição posteriormente.'),
                    const SizedBox(height: SpacingSize.md),
                    UIHoldConfirmButton(
                      hapticFeedback: true,
                      title: "Segure pra confirmar",
                      // title: state.isLoading
                      //     ? "Aguarde..."
                      //     : "Segure pra confirmar",
                      textColor: Colors.white,
                      backgroundColor: AppColors.primaryColorDark,
                      contentPadding: const EdgeInsets.all(SpacingSize.xl),
                      onProgressCompleted: () async =>
                          // viewModel.saveImmediatelly(),
                          viewModel.stopSaveImediatelly(),
                      onApiCall: () async {},
                      onProgressChange: (v) {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );

    // return UICustomScaffold(
    //   pageTitle: "Registrar incidente",
    //   onBackButtonTap: () {
    //     ref.invalidate(reportIncidentViewmodelProvider);
    //     context.pop();
    //   },
    //   body: LayoutBuilder(
    //     builder: (context, constraints) {
    //       return SingleChildScrollView(
    //         physics: const BouncingScrollPhysics(),
    //         padding: EdgeInsets.only(
    //           bottom: MediaQuery.of(context).viewInsets.bottom,
    //         ),
    //         child: ConstrainedBox(
    //           constraints: BoxConstraints(
    //             minHeight: constraints.maxHeight,
    //           ),
    //           child: IntrinsicHeight(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               spacing: 10,
    //               children: [
    //                 CardSelectImage(
    //                   product: state.product,
    //                   press: () async {
    //   final product = await context.push<Product?>(
    //     ItemsRouter.list,
    //     extra: ItemListingArgs(isAddingIncident: true),
    //   );
    //   if (product != null) {
    //     viewModel.selectProduct(product);
    //   }
    // },
    //                 ),
    //                 const ReportIncidentCardImmediately(),
    //                 const ReportIncidentCardDetailed(),
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }

  void showDialogOverlay(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.15), // leve escurecido
      builder: (_) {
        return PopScope(
          canPop: true,
          child: Stack(
            children: [
              // Blur no fundo
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(color: Colors.transparent),
              ),

              // Card central
              Center(
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: context.percentWidth(0.6),
                    padding: const EdgeInsets.symmetric(
                      horizontal: LayoutSpacingSize.container,
                      vertical: LayoutSpacingSize.container,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(RadiusSize.xl),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x22000000),
                          blurRadius: 24,
                          offset: Offset(0, 12),
                        ),
                      ],
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .outlineVariant
                            .withValues(alpha: 0.6),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 4),

                        // Loader + animação suave
                        SizedBox(
                          width: ProgressIndicatorSizes.xl,
                          height: ProgressIndicatorSizes.xl,
                          child: CircularProgressIndicator(
                            strokeWidth: 3.2,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),

                        const SizedBox(height: 14),

                        Text(
                          "Registrando roubo",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "Aguarde um instante...",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
