import 'dart:async';
import 'dart:ui';

import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/core/ui/widgets/buttons/ui_hold_confirm_button.dart';
import 'package:deehelp/core/ui/widgets/cards/card_exports.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/core/utils/enum_utils.dart';
import 'package:deehelp/feature/home/widgets/thini_divider.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/incidents/report/report_incident_viewmodel.dart';
import 'package:deehelp/feature/incidents/report/widgets/register/expandable_card.dart';
import 'package:deehelp/feature/incidents/report/widgets/register/field_tile.dart';
import 'package:deehelp/feature/incidents/report/widgets/register/item_card.dart';
import 'package:deehelp/feature/incidents/report/widgets/register/text_field_long_text.dart';
import 'package:deehelp/feature/incidents/report/widgets/register/text_input.file.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/section_title.dart';
import 'package:deehelp/feature/profile/item_list_router_args.dart';
import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
import 'package:deehelp/core/extension/date_extension.dart';
import 'package:deehelp/core/extension/time_extension.dart';
import 'package:deehelp/feature/incidents/providers/report_incident_event_provider.dart';
import 'package:deehelp/feature/incidents/providers/report_incident_viewmodel_provider.dart';
import 'package:deehelp/feature/incidents/report/events/report_incident_event.dart';
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
  // DateTime? selectedDate;
  // TimeOfDay? selectedTime;
  final cityCtrl = TextEditingController();
  final districtCtrl = TextEditingController();
  final howCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    // final currentLocation = ref.read(currentLocationProvider.notifier).state;

    // ref
    //     .read(reportIncidentViewmodelProvider.notifier)
    //     .addCurrentPlace(currentLocation);
  }

  @override
  void dispose() {
    cityCtrl.dispose();
    districtCtrl.dispose();
    howCtrl.dispose();
    holdTimer?.cancel();
    addressCtrl.dispose();
    super.dispose();
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
          // showGeneralDialog(
          //   context: context,
          //   barrierDismissible: false,
          //   barrierColor: Colors.transparent,
          //   pageBuilder: (_, __, ___) => IncidentErrorOverlay(onRetry: () {
          //     if (context.canPop()) {
          //       context.pop();
          //     }
          //   }),
          // );
          _showReportErrorSheet();
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
      extra: ItemListRouteArgs(
        args: ItemListingArgs(
          isAddingIncident: true,
          fetchData: true,
        ),
        showBackButton: true,
      ),
    );
    if (product != null) {
      viewModel.selectProduct(product);
    }
  }

  Future<void> _pickDate(
      ReportIncidentViewmodel viewModel, DateTime? initialDate) async {
    final now = DateTime.now();
    final result = await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: DateTime(now.year - 2),
      lastDate: DateTime(now.year + 1),
      helpText: 'Selecionar data',
    );
    if (result == null) return;
    // setState(() => selectedDate = result);
    viewModel.onOccurredAtChange(result);
  }

  Future<void> _pickTime(
      ReportIncidentViewmodel viewModel, TimeOfDay? initialTime) async {
    final result = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      helpText: 'Selecionar horário',
    );
    if (result == null) return;
    // setState(() => selectedTime = result);
    debugPrint("Hora do ocorrido ${result}");
    viewModel.onTimeOccurredAtChange(result);
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
            const SizedBox(height: SpacingSize.md),
            ExpandableCard(
              selected: state.type == TypeAlert.detailed,
              title: "Detalhado",
              subtitle:
                  'Inclui data, horário e contexto. Recomendado para um registro completo.',
              badge: "COMPLETO",
              icon: Icons.assignment_outlined,
              onTap: () => viewModel.selectAlertType(TypeAlert.detailed),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  children: [
                    const SizedBox(height: SpacingSize.md),
                    FieldTile(
                      icon: Icons.calendar_month_outlined,
                      label: 'Data',
                      value: state.occurredAt == null
                          ? 'Selecionar'
                          : state.occurredAt!.toDayMonthYearFormat(),
                      onTap: () => _pickDate(viewModel, state.occurredAt),
                    ),
                    const ThinDivider(),
                    FieldTile(
                      icon: Icons.schedule_outlined,
                      label: 'Horário',
                      value: state.timeOccurredAt == null
                          ? 'Selecionar'
                          : state.timeOccurredAt!.to24hFormat(),
                      onTap: () => _pickTime(viewModel, state.timeOccurredAt),
                    ),
                    const ThinDivider(),
                    TextInputTile(
                      icon: Icons.location_city_outlined,
                      label: 'Cidade',
                      // controller: cityCtrl,
                      controller: state.cityController!,
                      onChanged: (value) => viewModel.onCityChange(value),
                      error: state.cityError,
                      hint: 'Ex.: Centro',
                      textInputAction: TextInputAction.next,
                    ),
                    const ThinDivider(),
                    TextInputTile(
                      icon: Icons.place_outlined,
                      label: 'Estado',
                      // controller: districtCtrl,
                      controller: state.stateController!,
                      onChanged: (value) => viewModel.onStateChange(value),
                      error: state.stateError,
                      hint: 'Ex.: São Paulo',
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: SpacingSize.md),
                    const ThinDivider(),
                    TextInputTile(
                      icon: Icons.signpost_outlined,
                      label: 'Endereço aproximado',
                      controller: addressCtrl,
                      hint: 'Ex.: Próx. à Av. Paulista, 1200',
                      textInputAction: TextInputAction.next,
                      onChanged: (v) => viewModel.onFullAddressChange(v),
                      error: state.errorFullAddress,
                    ),
                    TextFieldLongText(
                      title: 'Como aconteceu',
                      subtitle: 'Descreva em até 300 caracteres.',
                      controller: howCtrl,
                      onChanged: (v) => viewModel.onHowToChange(v),
                      maxLen: 300,
                    ),
                    const SizedBox(height: SpacingSize.lg),
                    ButtonPrimary(
                      loading: state.isLoading,
                      press: state.isFormValid
                          ? () => viewModel.saveDetailed()
                          : null,
                      text: "Salvar",
                    )
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showReportErrorSheet({String? supportId, String? details}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => IncidentReportErrorSheet(
        supportId: supportId,
        technicalDetails: details,
        onClose: () => Navigator.pop(context),
        onRetry: () {
          Navigator.pop(context);
          // chame seu submit novamente aqui
          // ex: viewModel.submit(...)
        },
      ),
    );
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

class IncidentReportErrorSheet extends StatelessWidget {
  final String title;
  final String message;

  /// Ex.: "ERRO-REQ-9021" ou "INC-2026-000123"
  final String? supportId;

  /// Se quiser mostrar detalhes técnicos (opcional).
  final String? technicalDetails;

  final VoidCallback? onRetry;
  final VoidCallback? onClose;

  const IncidentReportErrorSheet({
    super.key,
    this.title = 'Não foi possível enviar o incidente',
    this.message =
        'Ocorreu um erro ao tentar registrar sua ocorrência. Verifique sua conexão e tente novamente.',
    this.supportId,
    this.technicalDetails,
    this.onRetry,
    this.onClose,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);
  static const _danger = Color(0xFFE53935);
  static const _bg = Color(0xFFF5F7FD);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle
              Container(
                width: 44,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6EAF6),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              const SizedBox(height: 12),

              // Header
              Row(
                children: [
                  _IconBadge(
                    icon: Icons.error_outline_rounded,
                    bg: _danger.withOpacity(0.10),
                    fg: _danger,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: _ink,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onClose ?? () => Navigator.pop(context),
                    icon: const Icon(Icons.close_rounded, color: _muted),
                    tooltip: 'Fechar',
                  )
                ],
              ),
              const SizedBox(height: 8),

              // Message
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  message,
                  style: const TextStyle(
                    color: _muted,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.8,
                    height: 1.3,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Tips box
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: _bg,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFE6EAF6)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _TipRow(
                      icon: Icons.wifi_rounded,
                      text: 'Verifique sua conexão com a internet (Wi-Fi/4G).',
                    ),
                    SizedBox(height: 10),
                    _TipRow(
                      icon: Icons.refresh_rounded,
                      text: 'Tente novamente em alguns segundos.',
                    ),
                    SizedBox(height: 10),
                    _TipRow(
                      icon: Icons.edit_note_rounded,
                      text:
                          'Se for “Imediato”, você pode registrar agora e completar os detalhes depois.',
                    ),
                  ],
                ),
              ),

              if (supportId != null || technicalDetails != null) ...[
                const SizedBox(height: 12),
                _SupportBox(
                  supportId: supportId,
                  technicalDetails: technicalDetails,
                ),
              ],

              const SizedBox(height: 14),
              ButtonPrimary(press: () => context.pop(), text: "Fechar"),

              // Actions
              // Row(
              //   children: [
              //     Expanded(
              //       child: OutlinedButton(
              //         onPressed: onClose ?? () => Navigator.pop(context),
              //         style: OutlinedButton.styleFrom(
              //           foregroundColor: _ink,
              //           side: BorderSide(color: _primary.withOpacity(0.22)),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(18),
              //           ),
              //           padding: const EdgeInsets.symmetric(vertical: 14),
              //         ),
              //         child: const Text(
              //           'Fechar',
              //           style: TextStyle(fontWeight: FontWeight.w900),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: 12),
              //     Expanded(
              //       child: ElevatedButton(
              //         onPressed: onRetry,
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: _primary,
              //           foregroundColor: Colors.white,
              //           elevation: 0,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(18),
              //           ),
              //           padding: const EdgeInsets.symmetric(vertical: 14),
              //         ),
              //         child: const Text(
              //           'Tentar novamente',
              //           style: TextStyle(fontWeight: FontWeight.w900),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              // const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  final IconData icon;
  final Color bg;
  final Color fg;

  const _IconBadge({
    required this.icon,
    required this.bg,
    required this.fg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: fg.withOpacity(0.18)),
      ),
      child: Icon(icon, color: fg),
    );
  }
}

class _TipRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TipRow({required this.icon, required this.text});

  static const _muted = Color(0xFF6B7AAE);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: _muted),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12.7,
              color: _muted,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }
}

class _SupportBox extends StatelessWidget {
  final String? supportId;
  final String? technicalDetails;

  const _SupportBox({this.supportId, this.technicalDetails});

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE6EAF6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ajuda ao suporte',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              color: _ink,
            ),
          ),
          const SizedBox(height: 8),
          if (supportId != null)
            Text(
              'ID: $supportId',
              style: const TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w700,
                color: _muted,
              ),
            ),
          if (technicalDetails != null) ...[
            const SizedBox(height: 6),
            Text(
              technicalDetails!,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: _muted,
                height: 1.25,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
