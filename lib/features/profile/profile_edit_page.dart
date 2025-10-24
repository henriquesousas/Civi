import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:deehelp/shared/animation/fade_slide_transition_animator.dart';
import 'package:deehelp/shared/components/inputs/secondary_text_field.dart';
import 'package:deehelp/shared/components/primary_app_bar.dart';

import '../../app/theme/app_colors.dart' show AppColors;
import '../../shared/components/buttons/primary_button.dart';
import 'components/profile_edit_content_section.dart';
import 'components/profile_gender.dart';
import 'components/profile_image_section_edit.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PrimaryAppBar(
        title: "Alterar conta",
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
              const ProfileImageSectionEdit(),
              const ProfileEditContentSection(
                title: "Informações pessoais",
                icon: Icons.contact_phone,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryTextField(
                          label: "Nome",
                          hint: "primeiro nome",
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: SecondaryTextField(
                          label: "Sobrenome",
                          hint: "sobrenome",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ProfileGender(),
                  SizedBox(height: 20)
                ],
              ),
              const ProfileEditContentSection(
                title: "Contato",
                icon: Icons.person_outline,
                children: [
                  Column(
                    children: [
                      SecondaryTextField(
                        label: "Email",
                        hint: "seu email",
                      ),
                      SizedBox(height: 20),
                      SecondaryTextField(
                        label: "Celular",
                        hint: "(11) 9 7273-2245",
                      )
                    ],
                  ),
                ],
              ),
              const ProfileEditContentSection(
                title: "Contato de emergência",
                icon: Icons.emergency,
                children: [
                  Column(
                    children: [
                      SecondaryTextField(
                        label: "Nome do contato",
                        hint: "nome",
                      ),
                      SizedBox(height: 20),
                      SecondaryTextField(
                        label: "Número contato de emergência",
                        hint: "(11) 9 7273-2245",
                      )
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
