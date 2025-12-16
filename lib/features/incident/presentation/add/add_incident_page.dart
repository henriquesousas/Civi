import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/button/ui_hold_confirm_button.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

enum TypeAlert {
  immediately,
  detailed,
  none,
}

class AddIncidentPage extends StatefulWidget {
  const AddIncidentPage({super.key});

  @override
  State<AddIncidentPage> createState() => _AddIncidentPageState();
}

class _AddIncidentPageState extends State<AddIncidentPage>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  TypeAlert _typeAlert = TypeAlert.none;
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

  void _changeAlert(TypeAlert type) {
    setState(() {
      if (_typeAlert == type) return;
      _typeAlert = type;

      _isExpanded = _typeAlert == TypeAlert.detailed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UICustomScaffold(
      pageTitle: "Registrar incidente",
      onBackButtonTap: () => context.pop(),
      body: Column(
        spacing: 10,
        children: [
          UICustomAppCard(
            onPressed: () => _changeAlert(TypeAlert.immediately),
            borderColor: _typeAlert == TypeAlert.immediately
                ? AppColors.primaryColor
                : AppColors.lightGreyColor30,
            borderWidth: _typeAlert == TypeAlert.immediately ? 2 : 1,
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _typeAlert == TypeAlert.immediately
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        border: Border.all(
                          color: _typeAlert == TypeAlert.immediately
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                        ),
                      ),
                      child: Icon(
                        Icons.check,
                        size: 12.w,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Text(
                      "Aviso Imediato",
                      style: context.appTextStyles.bodyTextStyle2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Ideal para situações urgentes. Com poucos toques, você envia um alerta instantâneo informando o roubo do seu veículo à comunidade.",
                  style: context.appTextStyles.bodyTextStyle1,
                ),
                const SizedBox(height: 10),
                Visibility(
                  visible: _typeAlert == TypeAlert.immediately,
                  child: UIHoldConfirmButton(
                    hapticFeedback: true,
                    title: "Segure pra confirmar",
                    textColor: AppColors.whiteColor,
                    backgroundColor: AppColors.primaryColorDark,
                    contentPadding: const EdgeInsets.all(22),
                    onProgressCompleted: () async {},
                    onApiCall: () async {},
                    onProgressChange: (v) {},
                  ),
                )
              ],
            ),
          ),
          UICustomAppCard(
            borderColor: _typeAlert == TypeAlert.detailed
                ? AppColors.primaryColor
                : AppColors.lightGreyColor30,
            borderWidth: _typeAlert == TypeAlert.detailed ? 2 : 1,
            child: InkWell(
              onTap: () => _changeAlert(TypeAlert.detailed),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 5,
                      children: [
                        Container(
                          width: 15.w,
                          height: 15.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _typeAlert == TypeAlert.detailed
                                ? AppColors.primaryColor
                                : AppColors.whiteColor,
                            border: Border.all(
                              color: _typeAlert == TypeAlert.detailed
                                  ? AppColors.primaryColor
                                  : AppColors.greyColor,
                            ),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 12.w,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Text(
                          "Aviso detalhado",
                          style: context.appTextStyles.bodyTextStyle2.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Registre o roubo do seu veículo com informações completas, como características do veículo, local e horário do ocorrido, ajudando na identificação e no acompanhamento do caso.",
                      style: context.appTextStyles.bodyTextStyle1,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      height: _isExpanded ? null : 0,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: _isExpanded ? 1 : 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "📋 Detalhes que você pode incluir:",
                              style: context.appTextStyles.sectionSubTitle1
                                  .copyWith(
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
