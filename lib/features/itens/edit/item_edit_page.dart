import 'package:deehelp/app/localization/image_config.dart';
import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors_v2.dart';
import '../../../shared/animation/fade_slide_transition_animator.dart';
import '../../../shared/components/buttons/primary_button.dart';
import '../../../shared/components/inputs/primary_text_field.dart';
import '../../../shared/components/inputs/secondary_text_field.dart';
import '../dotted_container.dart';
import 'my_item_edit_section.dart';

class ItemEditPage extends StatefulWidget {
  const ItemEditPage({super.key});

  @override
  State<ItemEditPage> createState() => _ItemEditPageState();
}

class _ItemEditPageState extends State<ItemEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsV2.background,
      appBar: UIAppBar(
        title: "Detalhes",
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close),
        ),
      ),
      body: FadeSlideTransitionAnimator(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 30,
            children: [
              MyItemEditSection(
                title: "Fotos",
                icon: Icons.image,
                children: [
                  SizedBox(
                    width: context.screenWidth,
                    height: context.percentHeight(0.25),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return DottedContainer(
                          height: context.percentHeight(0.1),
                          width: 0,
                          image: index != 3 ? ImageConfig.fakeCarro3 : null,
                        );
                      },
                    ),
                  ),
                ],
              ),
              const MyItemEditSection(
                title: "Detalhes do veículo",
                icon: Icons.directions_car,
                children: [
                  Column(
                    spacing: 16,
                    children: [
                      SecondaryTextField(
                        label: "Placa",
                        hint: "Informe o número da placa",
                      ),
                      SecondaryTextField(
                        label: "Marca",
                        hint: "Informe a marca",
                      ),
                      SecondaryTextField(
                        label: "Cor",
                        hint: "Cor do seu veículo",
                      ),
                    ],
                  ),
                ],
              ),
              const MyItemEditSection(
                title: "Observação",
                icon: Icons.description,
                children: [
                  Column(
                    spacing: 16,
                    children: [
                      PrimaryTextField(
                        labelText: "Observação",
                        hintText: "Ex: amassado na lateral esquerda...",
                        maxLine: 5,
                      ),
                    ],
                  ),
                ],
              ),
              PrimaryButton(
                text: "Salvar alterações",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
