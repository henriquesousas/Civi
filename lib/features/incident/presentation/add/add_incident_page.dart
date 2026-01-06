import 'package:deehelp/core/router/app_router.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/button/ui_hold_confirm_button.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/auth/presentation/session/session_provider.dart';
import 'package:deehelp/features/incident/domain/entity/type_alert.dart';
import 'package:deehelp/features/incident/presentation/add/alert_error_screen.dart';
import 'package:deehelp/features/incident/presentation/add/alert_sender.dart';
import 'package:deehelp/features/incident/presentation/add/sending_alert_screen.dart';
import 'package:deehelp/features/incident/presentation/add/widget/card_select_image.dart';
import 'package:deehelp/features/incident/presentation/add/widget/card_type_incident.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_viewmodel_providers.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/presentation/views/listing/product_listing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// enum TypeAlert {
//   immediately,
//   detailed,
//   none,
// }

class AddIncidentPage extends ConsumerStatefulWidget {
  const AddIncidentPage({super.key});

  @override
  ConsumerState<AddIncidentPage> createState() => _AddIncidentPageState();
}

class _AddIncidentPageState extends ConsumerState<AddIncidentPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addIncidentViewmodelProvider);
    final viewModel = ref.watch(addIncidentViewmodelProvider.notifier);
    final session = ref.watch(userSessionProvider);

    return UICustomScaffold(
      pageTitle: "Registrar incidente",
      onBackButtonTap: () => context.pop(),
      body: Column(
        spacing: 10,
        children: [
          CardSelectImage(
            product: state.product,
            press: () async {
              final product = await context.push<Product?>(
                AppRouter.myProducts,
                extra: {ProductListingPage.isAddIncidentKey: true},
              );
              if (product != null) {
                viewModel.selectProduct(product);
              }
            },
          ),
          Visibility(
            visible: state.product != null,
            child: CardTypeIncident(
              press: () => viewModel.selectTypeAlert(TypeAlert.immediately),
              selected: state.type == TypeAlert.immediately,
              title: "Aviso Imediato",
              subTitle:
                  "Ideal para situações urgentes. Com poucos toques, você envia um alerta instantâneo informando o roubo do seu veículo à comunidade.",
              child: Visibility(
                visible: state.type == TypeAlert.immediately,
                child: UIHoldConfirmButton(
                  hapticFeedback: true,
                  title: "Segure pra confirmar",
                  textColor: AppColors.whiteColor,
                  backgroundColor: AppColors.primaryColorDark,
                  contentPadding: const EdgeInsets.all(22),
                  onProgressCompleted: () async {
                    if (session?.id != null) {
                      // viewModel.save(session!.id);
                      // await AlertSender.sendAlertAndShowSuccess(
                      //   context: context,
                      //   vehicleType: "Carro",
                      //   location: "Rua teste",
                      //   onSendComplete: () {
                      //     // Callback opcional após sucesso
                      //     print('Alerta enviado com sucesso!');
                      //   },
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SendingAlertScreen(
                            vehicleType: "Carro",
                            location: 'Local não informado',
                          ),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AlertErrorScreen(
                            onRetry: () {
                              Navigator.pop(context);
                              // _submitIncident(); // Tenta novamente
                            },
                          ),
                        ),
                      );
                    }
                  },
                  onApiCall: () async {},
                  onProgressChange: (v) {
                    debugPrint(v.toString());
                  },
                ),
              ),
            ),
          ),
          Visibility(
            visible: state.product != null,
            child: CardTypeIncident(
              press: () => viewModel.selectTypeAlert(TypeAlert.detailed),
              selected: state.type == TypeAlert.detailed,
              title: "Aviso detalhado",
              subTitle:
                  "Registre o roubo do seu veículo com informações completas, como características do veículo, local e horário do ocorrido, ajudando na identificação e no acompanhamento do caso.",
              child: InkWell(
                onTap: () {},
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    // height: _isExpanded ? null : 0,
                    height: state.type == TypeAlert.detailed ? null : 0,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: state.type == TypeAlert.detailed ? 1 : 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "📋 Detalhes que você pode incluir:",
                            style:
                                context.appTextStyles.sectionSubTitle1.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          UIElevatedButton(
                            text: "Iniciar Registro Detalhado",
                            press: () {
                              // Ação do botão
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
