import 'package:flutter/material.dart';
import 'package:deehelp/app/localization/image_config.dart';
import 'package:deehelp/app/theme/app_colors.dart';
import 'package:deehelp/app/theme/size_config.dart';
import 'package:deehelp/features/favorites/components/ui_verification_flag.dart';
import 'package:deehelp/shared/components/buttons/primary_button.dart';
import 'package:deehelp/shared/components/primary_app_bar.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

import '../../shared/components/icons/primary_icon.dart';
import '../favorites/favourite_model.dart';
import '../profile/components/profile_edit_content_section.dart';
import '../welcome/old/components/ui_dot.dart';

class OccurrenceDetailPage extends StatelessWidget {
  const OccurrenceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PrimaryAppBar(
        title: "Detalhes da ocorrência",
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              icon: Icon(
                Icons.share,
                color: AppColors.primaryColor,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(12),
        child: Column(
          // spacing: 30,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Galeria de imagens
            SizedBox(
              height: SizeConfig.height280,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            width: context.screenWidth,
                            height: SizeConfig.height280,
                            ImageConfig.fakeCarro1,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          3, (index) => UIDot(currentPage: 0, index: index)),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 20,
                    child: UIVerificationFlag(isVerified: true),
                  ),
                ],
              ),
            ),
            const SizedBox(height: SizeConfig.height16),
            // Título e informações básicas
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Honda Civic - Roubo/Furto",
                          style: context.getTextStyle.mediumSmall.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      // const UIIconRounded(fileImage: ImageConfig.favoriteFill)
                      PrimaryIcon(
                        height: 30,
                        width: 30,
                        background: AppColors.lightGradient,
                        icon: const Icon(
                          Icons.favorite,
                          color: AppColors.primary,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      // Icon(
                      //   Icons.directions_car,
                      //   size: 16,
                      //   color: AppColors.textLightColor,
                      // ),
                      // Image(
                      //   image: AssetImage(ImageConfig.vehicle2),
                      //   width: 16,
                      // ),
                      const PrimaryIcon(
                        height: 30,
                        width: 30,
                        icon: Icon(
                          Icons.drive_eta,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "DND0171",
                        style: context.getTextStyle.small.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Icon(Icons.location_on,
                      //     size: 16, color: AppColors.textLightColor),
                      // Image(
                      //   image: AssetImage(ImageConfig.pin),
                      //   width: 16,
                      // ),
                      const PrimaryIcon(
                        height: 30,
                        width: 30,
                        icon: Icon(
                          Icons.pin_drop_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Barueri - SP",
                        style: context.getTextStyle.small,
                      ),
                    ],
                  ),
                  // const SizedBox(height: SizeConfig.height16),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ProfileEditContentSection(
              title: "Detalhes do veículo",
              icon: Icons.description,
              children: [
                _buildInfoItem(
                  context,
                  "Placa",
                  "DND0171",
                  ImageConfig.license,
                  Icons.confirmation_number,
                ),
                _buildInfoItem(context, "Cor", "Vermelho", ImageConfig.pallete,
                    Icons.color_lens,
                    valueColor: Colors.red),
                _buildInfoItem(context, "Ano", "2025", ImageConfig.calendar,
                    Icons.calendar_today),
                _buildInfoItem(context, "Modelo", "Honda Civic EXL",
                    ImageConfig.vehicle2, Icons.directions_car),
                _buildInfoItem(
                    context,
                    "Observações",
                    "O veículo possui um adesivo no vidro traseiro com a frase 'Deus é fiel'",
                    ImageConfig.obs,
                    Icons.note),
              ],
            ),
            const SizedBox(height: 10),
            ProfileEditContentSection(
              title: "Detalhes da ocorrência",
              icon: Icons.offline_bolt,
              children: [
                _buildInfoItem(context, "Data", "01/01/2025",
                    ImageConfig.calendar, Icons.date_range),
                _buildInfoItem(context, "Horário", "12:30", ImageConfig.clock,
                    Icons.access_time),
                _buildInfoItem(
                    context,
                    "Local",
                    "Av. Paulista, 1000 - Barueri/SP",
                    ImageConfig.pin,
                    Icons.place),
                _buildInfoItem(context, "Tipo", "Roubo de veículo",
                    ImageConfig.warning, Icons.warning),
                _buildInfoItem(context, "Status", "Em andamento",
                    ImageConfig.info, Icons.info,
                    valueColor: Colors.orange),
              ],
            ),
            const SizedBox(height: 10),
            ProfileEditContentSection(
              title: "Informações do proprietário",
              icon: Icons.account_circle,
              children: [
                _buildInfoItem(context, "Nome", "João Silva",
                    ImageConfig.profile2, Icons.person),
                _buildInfoItem(context, "Contato", "(11) 99999-9999",
                    ImageConfig.phone, Icons.phone),
                _buildInfoItem(context, "E-mail", "joao@email.com",
                    ImageConfig.email, Icons.email),
              ],
            ),
            const SizedBox(height: 10),
            ProfileEditContentSection(
              title: "Como aconteceu",
              icon: Icons.report,
              children: [
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing.",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: context.getTextStyle.small,
                )
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ocorrências similares",
                      style: context.getTextStyle.medium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Ver todas",
                        style: context.getTextStyle.small.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: SizeConfig.height16),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: FavouriteModel.getFavourites.length,
                    itemBuilder: (context, index) {
                      final favorite = FavouriteModel.getFavourites[index];
                      return Container(
                        width: 160,
                        margin:
                            const EdgeInsets.only(right: SizeConfig.padding12),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius:
                              BorderRadius.circular(SizeConfig.borderRadius14),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(SizeConfig.borderRadius14),
                              ),
                              child: Image.asset(
                                favorite.image,
                                width: 160,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.all(SizeConfig.padding08),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    favorite.description,
                                    style: context.getTextStyle.small.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    favorite.address,
                                    style: context.getTextStyle.small.copyWith(
                                      fontSize: 10,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      size: 16,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // Botão de ação
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: SizeConfig.padding24,
            vertical: SizeConfig.padding12,
          ),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  text: "Enviar mensagem",
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: SizeConfig.padding12),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.borderRadius14),
                  border: Border.all(color: AppColors.buttonColor),
                ),
                child: IconButton(
                  icon: const Icon(Icons.call, color: AppColors.buttonColor),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(
    BuildContext context, {
    required String title,
    required String fileImage,
    String? content,
    List<Widget>? children,
    IconData? icon,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        // bottom: SizeConfig.padding10,
        left: 20,
        right: 30,
      ),
      padding: const EdgeInsets.all(SizeConfig.padding16),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(
        //   color: Colors.grey.shade200,
        //   width: 1,
        // ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                // Icon(icon, size: 20, color: AppColors.primaryColor),
                Image(
                  image: AssetImage(fileImage),
                  width: 20,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                title,
                style: context.getTextStyle.regular.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: SizeConfig.padding12),
          if (content != null)
            Text(
              content,
              style: context.getTextStyle.smallMedium,
            ),
          if (children != null)
            Column(
              children: children,
            ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    String label,
    String value,
    String fileImage,
    IconData icon, {
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: SizeConfig.padding08,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon(icon, size: 16, color: AppColors.textLightColor),
          Image(
            image: AssetImage(fileImage),
            width: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: context.getTextStyle.small.copyWith(
                    color: AppColors.textLightColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: context.getTextStyle.small.copyWith(
                    color: valueColor ?? AppColors.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
