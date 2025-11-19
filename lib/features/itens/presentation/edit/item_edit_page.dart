import 'package:deehelp/core/components/container/ui_simple_container.dart';
import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors_v2.dart';
import '../../../../core/components/buttons/ui_primary_button.dart';
import '../../../../core/components/images/ui_network_image_with_loader.dart';
import '../../../../shared/animation/fade_slide_transition_animator.dart';

class ItemEditPage extends StatefulWidget {
  const ItemEditPage({super.key});

  @override
  State<ItemEditPage> createState() => _ItemEditPageState();
}

class _ItemEditPageState extends State<ItemEditPage> {
  Widget _buildListTitle(
    String head,
    String line, {
    bool showDivider = true,
    bool showCam = false,
  }) {
    return Column(
      children: [
        ListTile(
          title: Text(
            head,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(line, style: Theme.of(context).textTheme.bodyMedium),
          // trailing: const Icon(
          //   Icons.edit,
          //   color: AppColors.lightGreyColor20,
          // ),
          trailing: !showCam
              ? const Icon(
                  Icons.edit,
                  color: AppColors.lightGreyColor20,
                )
              : Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ),
        ),
        if (showDivider)
          const Divider(color: AppColors.lightGreyColor30, height: 1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsV2.background,
      appBar: UIAppBar(
        title: "Detalhes",
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: FadeSlideTransitionAnimator(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(18),
          child: Column(
            spacing: 10,
            children: [
              UISimpleContainer(
                padding: const EdgeInsets.all(2),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      _buildListTitle("Marca", "Wolwsvagen"),
                      _buildListTitle("Nome", "Honda Civi 2.0"),
                      _buildListTitle("Cor", "Vermelho", showDivider: false)
                    ],
                  ),
                ],
              ),
              UISimpleContainer(
                padding: const EdgeInsets.all(2),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      _buildListTitle("Tipo", "Carro", showDivider: false)
                    ],
                  ),
                ],
              ),
              UISimpleContainer(
                padding: const EdgeInsets.all(2),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      _buildListTitle(
                        "Detalhes",
                        "alguma coisa aqui dasdsadsad sadasdsad sadsd sdsa dsasadsad dhsajdhjhdsahdshdhsadhsa hjsadh sdhjsadhjksda asdkjdsad dsahj",
                        showDivider: false,
                      )
                    ],
                  ),
                ],
              ),
              UISimpleContainer(
                padding: const EdgeInsets.all(2),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      _buildListTitle(
                        "Fotos",
                        "1 Foto",
                        showDivider: false,
                        showCam: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UINetworkImageWithLoader(
                          src:
                              "https://imagens.ebc.com.br/PcuJ-04UtlauC0bdNTGvhR2kgMk=/1170x700/smart/https://agenciabrasil.ebc.com.br/sites/default/files/thumbnails/image/raf05032_1.jpg?itok=BDM0Ehau",
                          width: context.percentWidth(0.9),
                          height: context.percentHeight(0.3),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              UIPrimaryButton(
                text: "Confirmar alterações",
                press: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text("Para deletar esse veículo permanentemente"),
                    Text(
                      "Clique aqui",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColors.errorColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
