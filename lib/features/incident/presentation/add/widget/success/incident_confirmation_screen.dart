import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformativoCardsPage extends StatelessWidget {
  const InformativoCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Próximos Passos",
        style: context.appTextStyles.bodyTextStyle1.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       Theme.of(context).colorScheme.primary.withOpacity(0.05),
      //       Theme.of(context).colorScheme.background,
      //     ],
      //   ),
      // ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                UIICon(
                  bgColor: AppColors.greyColor,
                  icon: Icon(Icons.close),
                  isAlpha: true,
                ),
                Text("Próximos passos")
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.all(Dimens.size20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header com explicação
                  // _buildHeaderSection(context),
                  // SizedBox(height: Dimens.size24.h),

                  // Cards informativos
                  ..._buildInfoCards(context),
                  // SizedBox(height: Dimens.size32.h),

                  // Aviso importante
                  _buildImportantNotice(context),
                  SizedBox(height: Dimens.size32.h),

                  // Botões de ação
                  // _buildActionButtons(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Dimens.size20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(Dimens.size16.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            size: Dimens.size40.w,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: Dimens.size12.h),
          Text(
            "Incidente Registrado com Sucesso!",
            style: context.appTextStyles.caption1Style.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textColorBody,
            ),
          ),
          SizedBox(height: Dimens.size10.h),
          Text(
            "Para garantir a confiabilidade do sistema, complete os próximos passos:",
            style: context.appTextStyles.bodyTextStyle2?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildInfoCards(BuildContext context) {
    final cardsInfo = [
      _CardInfo(
        icon: Icons.gavel_rounded,
        title: "Formalize o Registro",
        description:
            "Abra um Boletim de Ocorrência em até 48 horas para validar seu incidente.",
        gradientColors: [
          Color(0xFF2196F3), // Blue
          Color(0xFF21CBF3),
        ],
        stepNumber: 1,
        deadline: "48 horas",
      ),
      _CardInfo(
        icon: Icons.share,
        title: "Compartilhe com a Rede",
        description:
            "Alerta amigos e familiares sobre o ocorrido para aumentar a segurança coletiva.",
        gradientColors: [
          Color(0xFF4CAF50), // Green
          Color(0xFF8BC34A),
        ],
        stepNumber: 2,
        deadline: "Imediato",
      ),
      _CardInfo(
        icon: Icons.edit_document,
        title: "Adicione Detalhes",
        description:
            "Enriqueça o registro com fotos, descrições detalhadas e informações adicionais.",
        gradientColors: [
          Color(0xFFFF9800), // Orange
          Color(0xFFFFB74D),
        ],
        stepNumber: 3,
        deadline: "Flexível",
      ),
      _CardInfo(
        icon: Icons.verified_user,
        title: "Validação do Sistema",
        description:
            "Incidentes sem BO em 48h são desativados automaticamente para manter a confiabilidade.",
        gradientColors: [
          Color(0xFF9C27B0), // Purple
          Color(0xFFBA68C8),
        ],
        stepNumber: 4,
        deadline: "Crítico",
      ),
    ];

    return cardsInfo.map((info) {
      return Padding(
        padding: EdgeInsets.only(bottom: Dimens.size16.h),
        child: _buildInfoCard(context, info),
      );
    }).toList();
  }

  Widget _buildInfoCard(BuildContext context, _CardInfo info) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.size16.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Card principal
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: info.gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(Dimens.size16.w),
            ),
            padding: EdgeInsets.all(Dimens.size20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ícone e número do passo
                Container(
                  width: Dimens.size60.w,
                  height: Dimens.size60.w,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        info.icon,
                        size: Dimens.size26.w,
                        color: Colors.white,
                      ),
                      // Número do passo (canto inferior direito)
                      Positioned(
                        right: 2,
                        bottom: 2,
                        child: Container(
                          width: Dimens.size20.w,
                          height: Dimens.size20.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              info.stepNumber.toString(),
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: info.gradientColors.first,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: Dimens.size16.w),

                // Conteúdo textual
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        info.title,
                        style: context.appTextStyles.sectionTitle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: Dimens.size10.h),
                      Text(
                        info.description,
                        style: context.appTextStyles.bodyTextStyle2.copyWith(
                          color: Colors.white.withOpacity(0.9),
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: Dimens.size12.h),

                      // Badge de prazo
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimens.size12.w,
                          vertical: Dimens.size5.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(Dimens.size10.w),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.access_time,
                              size: Dimens.size14.w,
                              color: Colors.white,
                            ),
                            SizedBox(width: Dimens.size5.w),
                            Text(
                              "Prazo: ${info.deadline}",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Ícone de seta
                Icon(
                  Icons.chevron_right,
                  color: Colors.white.withOpacity(0.7),
                  size: Dimens.size24.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImportantNotice(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Dimens.size20.w),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.05),
        borderRadius: BorderRadius.circular(Dimens.size16.w),
        border: Border.all(
          color: Colors.red.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.red,
                size: Dimens.size24.w,
              ),
              SizedBox(width: Dimens.size12.w),
              Text(
                "Aviso Importante",
                style: context.appTextStyles.sectionTitle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: Dimens.size12.h),
          RichText(
            text: TextSpan(
              style: context.appTextStyles.bodyTextStyle1?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                height: 1.6,
              ),
              children: [
                TextSpan(
                  text: "Para manter a ",
                ),
                TextSpan(
                  text: "confiabilidade dos dados",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                TextSpan(
                  text:
                      ", incidentes sem boletim de ocorrência registrado em até 48 horas serão ",
                ),
                TextSpan(
                  text: "removidos automaticamente",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                TextSpan(
                  text:
                      ". Esta medida é essencial para garantir informações verificadas para toda a comunidade.",
                ),
              ],
            ),
          ),
          SizedBox(height: Dimens.size10.h),
          Text(
            "Sua colaboração é fundamental para um sistema de segurança comunitário efetivo.",
            style: context.appTextStyles.caption1Style?.copyWith(
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        // Botão principal
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Ação para ir ao boletim de ocorrência
              // Navigator.push(context, MaterialPageRoute(builder: (context) => BOScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: EdgeInsets.symmetric(
                vertical: Dimens.size16.h,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.size12.w),
              ),
              elevation: 3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.gavel_rounded, size: Dimens.size20.w),
                SizedBox(width: Dimens.size12.w),
                Text(
                  "Iniciar Boletim de Ocorrência",
                  style: context.appTextStyles.sectionTitle3?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: Dimens.size16.h),

        // Botões secundários
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  // Ação de compartilhar
                },
                icon: Icon(Icons.share, size: Dimens.size18.w),
                label: Text("Compartilhar"),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: Dimens.size14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimens.size12.w),
                  ),
                ),
              ),
            ),
            SizedBox(width: Dimens.size12.w),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  // Ação de adicionar detalhes
                },
                icon: Icon(Icons.edit, size: Dimens.size18.w),
                label: Text("Detalhes"),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: Dimens.size14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimens.size12.w),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: Dimens.size12.h),

        // Link para voltar
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Voltar para o início",
            style: context.appTextStyles.bodyTextStyle1.copyWith(
              color: Theme.of(context).colorScheme.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

class _CardInfo {
  final IconData icon;
  final String title;
  final String description;
  final List<Color> gradientColors;
  final int stepNumber;
  final String deadline;

  _CardInfo({
    required this.icon,
    required this.title,
    required this.description,
    required this.gradientColors,
    required this.stepNumber,
    required this.deadline,
  });
}
