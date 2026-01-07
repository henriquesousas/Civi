import 'package:deehelp/core/extensions/context_extension.dart';
import 'package:deehelp/core/extensions/date_extension.dart';
import 'package:deehelp/core/extensions/time_extension.dart';
import 'package:deehelp/core/res/resources.dart';
import 'package:deehelp/core/router/app_router.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/button/ui_category_button.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/button/ui_hold_confirm_button.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:deehelp/core/ui/widgets/textfield/ui_text_field_rounded.dart';
import 'package:deehelp/features/auth/presentation/session/session_provider.dart';
import 'package:deehelp/features/incident/domain/entity/type_alert.dart';
import 'package:deehelp/features/incident/presentation/add/state/add_incident_state.dart';
import 'package:deehelp/features/incident/presentation/add/widget/card_select_image.dart';
import 'package:deehelp/features/incident/presentation/add/widget/card_type_incident.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_viewmodel_providers.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/presentation/views/listing/product_listing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class AddIncidentPage extends ConsumerStatefulWidget {
  const AddIncidentPage({super.key});

  @override
  ConsumerState<AddIncidentPage> createState() => _AddIncidentPageState();
}

class _AddIncidentPageState extends ConsumerState<AddIncidentPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

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

  // Future<Position> _getCurrentPosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Verifica se o serviço de localização está ativo
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     throw Exception('Serviço de localização desativado');
  //   }

  //   // Verifica permissões
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       throw Exception('Permissão negada');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     throw Exception('Permissão negada permanentemente');
  //   }

  //   // Retorna posição atual
  //   return await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );
  // }

  // Future<void> _getCityAndState() async {
  //   try {
  //     Position position = await _getCurrentPosition();
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //       position.latitude,
  //       position.longitude,
  //       localeIdentifier: "pt_BR",
  //     );
  //     if (placemarks.isNotEmpty) {
  //       final state = placemarks
  //           .map((e) => e.administrativeArea ?? e.locality ?? "")
  //           .firstWhere((name) => name.isNotEmpty);

  //       final city = placemarks
  //           .map((e) => e.subAdministrativeArea ?? e.locality ?? "")
  //           .firstWhere((name) => name.isNotEmpty);
  //     }
  //   } catch (e) {
  //     print("Erro ao obter localização: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addIncidentViewmodelProvider);
    final viewModel = ref.watch(addIncidentViewmodelProvider.notifier);
    final session = ref.watch(userSessionProvider);

    ref.listen<AddIncidentState>(
      addIncidentViewmodelProvider,
      (previous, next) {
        if (next.errorMessage != null && next.errorMessage != "") {
          // context.push(AppRouter.addIncidentError);
        }
        if (next.successMessage != null && next.successMessage != "") {
          // context.pushReplacement(AppRouter.addIncidentSuccess);
        }
      },
    );

    return UICustomScaffold(
      pageTitle: "Registrar incidente",
      onBackButtonTap: () => context.pop(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    // Container(
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: Dimens.size10.w,
                    //     vertical: Dimens.size10.h,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(8),
                    //     color: AppColors.lightGreyColor30,
                    //   ),
                    //   child: Text(
                    //     "Selecione o tipo de alerta:",
                    //     style: context.appTextStyles.caption1Style.copyWith(
                    //       color: AppColors.darkGreyColor,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    // ),
                    Visibility(
                      visible: state.product != null,
                      child: CardTypeIncident(
                        press: () =>
                            viewModel.selectTypeAlert(TypeAlert.immediately),
                        selected: state.type == TypeAlert.immediately,
                        title: "Quero enviar um alerta imediato",
                        subTitle:
                            "Ideal para situações urgentes. Com poucos toques, você envia um alerta instantâneo informando o roubo do seu veículo à comunidade.",
                        child: Visibility(
                          visible: state.type == TypeAlert.immediately,
                          child: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Você poderá adicionar mais detalhes depois.",
                                style: context.appTextStyles.bodyTextStyle1
                                    .copyWith(
                                  color: AppColors.textColorBody,
                                ),
                              ),
                              UIHoldConfirmButton(
                                hapticFeedback: true,
                                title: "Segure pra confirmar",
                                textColor: AppColors.whiteColor,
                                backgroundColor: AppColors.primaryColorDark,
                                contentPadding: const EdgeInsets.all(22),
                                onProgressCompleted: () async {
                                  if (session?.id != null) {
                                    viewModel.save(session!.id);
                                  }
                                },
                                onApiCall: () async {},
                                onProgressChange: (v) {
                                  debugPrint(v.toString());
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: state.product != null,
                      child: CardTypeIncident(
                        press: () =>
                            viewModel.selectTypeAlert(TypeAlert.detailed),
                        selected: state.type == TypeAlert.detailed,
                        title: "Alerta detalhado do incidente",
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
                              height:
                                  state.type == TypeAlert.detailed ? null : 0,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                opacity:
                                    state.type == TypeAlert.detailed ? 1 : 0,
                                child: Column(
                                  spacing: 10,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Dimens.size10.w,
                                        vertical: Dimens.size10.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.lightGreyColor30,
                                      ),
                                      child: Text(
                                        "Detalhes que você pode incluir:",
                                        style: context
                                            .appTextStyles.caption1Style
                                            .copyWith(
                                          color: AppColors.darkGreyColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      spacing: 5,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: UITextFieldRounded(
                                            showLabelText: false,
                                            labelText: "",
                                            hintText: "Data do ocorrido...",
                                            onTap: () async {
                                              final picked =
                                                  await context.pickDate(
                                                initialDate: _selectedDate,
                                              );
                                              if (picked != null &&
                                                  picked != _selectedDate) {
                                                setState(() {
                                                  _selectedDate = picked;
                                                });
                                              }
                                            },
                                            prefixIcon: const Icon(
                                              Icons.calendar_month_outlined,
                                              color: AppColors.textColorBody,
                                            ),
                                            readOnly: true,
                                            controller: TextEditingController(
                                              text: _selectedDate != null
                                                  ? _selectedDate
                                                      ?.toDayMonthYearFormat()
                                                  : "",
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: UIElevatedButton(
                                            radius: 8,
                                            text: "Hoje",
                                            press: () {
                                              setState(() {
                                                _selectedDate = DateTime.now();
                                              });
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                    UITextFieldRounded(
                                      showLabelText: false,
                                      labelText: "",
                                      hintText: "Hora do ocorrido...",
                                      onTap: () {
                                        context
                                            .pickTime(
                                                initialTime: _selectedTime)
                                            .then((picked) {
                                          if (picked != null &&
                                              picked != _selectedTime) {
                                            setState(() {
                                              _selectedTime = picked;
                                            });
                                          }
                                        });
                                      },
                                      readOnly: true,
                                      prefixIcon: const Icon(
                                        Icons.av_timer,
                                        color: AppColors.textColorBody,
                                      ),
                                      controller: TextEditingController(
                                        text: _selectedTime != null
                                            ? _selectedTime?.to24hFormat()
                                            : "",
                                      ),
                                    ),
                                    UITextFieldRounded(
                                      showLabelText: false,
                                      labelText: "",
                                      hintText: "Estado...",
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          debugPrint("Selecionar estado");
                                        },
                                        icon: const Icon(
                                          Icons.arrow_circle_right,
                                          color: AppColors.darkGreyColor10,
                                          // size: 12,
                                        ),
                                      ),
                                    ),
                                    UITextFieldRounded(
                                      showLabelText: false,
                                      labelText: "",
                                      hintText: "Bairro...",
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          debugPrint("Selecionar bairro");
                                        },
                                        icon: const Icon(
                                          Icons.arrow_circle_right,
                                          color: AppColors.darkGreyColor10,
                                          // size: 12,
                                        ),
                                      ),
                                    ),
                                    const UITextFieldRounded(
                                      showLabelText: false,
                                      labelText: "",
                                      hintText:
                                          "Rua,Avenida próximo (não precisa ser exato)",
                                    ),
                                    const UITextFieldRounded(
                                      showLabelText: false,
                                      labelText: "",
                                      hintText:
                                          "Como acontence, conte mais detalhes...",
                                      maxLine: 8,
                                    ),
                                    UIElevatedButton(
                                      text: "Salvar incidente",
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
              ),
            ),
          );
        },
      ),
    );
  }
}
