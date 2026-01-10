import 'package:deehelp/core/ui/animation/transform_scale_opacity_animator.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/features/incident/presentation/add/widget/success/registered_product_info.dart';
import 'package:deehelp/features/incident/presentation/add/widget/success/registered_success_quick_actions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class IncidentRegisteredSuccessfullyWidget extends StatelessWidget {
  const IncidentRegisteredSuccessfullyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D47A1),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0D47A1),
                Color(0xFF1565C0),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
              stops: [0.0, 0.4, 0.7, 1.0],
            ),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Dimens.size10),
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => context.pop(),
                      splashRadius: 20,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TransformScaleOpacityAnimator(
                            duration: const Duration(milliseconds: 1500),
                            child: Lottie.asset(
                              "assets/lottie/loader_success.json",
                              width: Dimens.defaultImageIndicator.w,
                              height: Dimens.defaultImageIndicator.h,
                              repeat: false,
                            ),
                          ),
                          Text(
                            'Registro Concluído!',
                            textAlign: TextAlign.center,
                            style:
                                context.appTextStyles.bodyTextStyle1.copyWith(
                              fontSize: Dimens.size32.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2,
                              shadows: [
                                Shadow(
                                  blurRadius: 10,
                                  color: Colors.black.withValues(alpha: 0.2),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: Dimens.size10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Sua notificação foi compartilhada com a comunidade de segurança local',
                              textAlign: TextAlign.center,
                              style: context.appTextStyles.sectionSubTitle1
                                  .copyWith(
                                color: Colors.white.withValues(alpha: 0.95),
                                height: 1.6,
                              ),
                            ),
                          ),
                          const SizedBox(height: Dimens.size15),
                          const RegisteredProductInfo(),
                          const SizedBox(height: Dimens.size15),
                          const RegisteredSuccessQuickActionsWidget(),
                          const SizedBox(height: Dimens.size15),
                          UIElevatedButton(
                            bgColor: AppColors.whiteColor,
                            text: "Voltar ao início",
                            textStyle:
                                context.appTextStyles.sectionTitle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0D47A1),
                            ),
                            press: () => context.pop(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Faça o Boletim de Ocorrência na delegacia mais próxima.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withValues(alpha: 0.7),
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
