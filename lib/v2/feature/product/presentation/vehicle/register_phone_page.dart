import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/buttons/export_buttons.dart';
import 'package:deehelp/v2/core/widgets/textfield/ui_primary_textfield.dart';
import 'package:deehelp/v2/feature/product/presentation/widgets/section_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPhonePage extends StatefulWidget {
  const RegisterPhonePage({super.key});

  @override
  State<RegisterPhonePage> createState() => _RegisterPhonePageState();
}

class _RegisterPhonePageState extends State<RegisterPhonePage> {
  final List<String> mockPhotos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        press: () {},
        showBackButton: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: SizeLayoutSpacing.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cadastrar celular',
                style: context.appText.header.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: SizeSpacing.s),
              Text(
                'Informe os dados do aparelho para facilitar a identificação e o cadastro no app.',
                style: context.appText.subtitle.copyWith(
                  color: context.themeColor.secundaryTextColor,
                  height: 1.35,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: SizeSpacing.xl),
              const SectionLabel('Nome do aparelho'),
              const SizedBox(height: SizeSpacing.s),
              const UIPrimaryTextfield(
                hintText: 'Ex: Iphone 13 Pro',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: SizeSpacing.xl),
              const SectionLabel('Marca'),
              const SizedBox(height: SizeSpacing.s),
              UIPrimaryTextfield(
                hintText: 'Ex: Apple, Sansung',
                textInputAction: TextInputAction.next,
                readOnly: true,
                onTap: () => debugPrint("Ola"),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_circle_right),
                ),
              ),
              const SizedBox(height: SizeSpacing.xl),
              const SectionLabel('Cor'),
              const SizedBox(height: SizeSpacing.s),
              UIPrimaryTextfield(
                hintText: 'Ex: Preto',
                textInputAction: TextInputAction.next,
                readOnly: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_circle_right),
                ),
                onTap: () => debugPrint("Ola"),
              ),
              const SizedBox(height: SizeSpacing.xl),
              Row(
                spacing: 10,
                children: [
                  const SectionLabel('IMEI'),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.info_outline, size: 16),
                    label: const Text('O que é?'),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColor.primaryColor,
                    ),
                  )
                ],
              ),
              const SizedBox(height: SizeSpacing.s),
              const UIPrimaryTextfield(
                hintText: 'Ex: Digite o IMEI',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: SizeSpacing.xl),
              const SectionLabel('Observações'),
              const SizedBox(height: SizeSpacing.s),
              Text(
                'Descreva detalhes importantes do aparelho.',
                style: context.appText.subtitle.copyWith(
                  color: context.themeColor.secundaryTextColor,
                ),
              ),
              const SizedBox(height: SizeSpacing.m),
              const UIPrimaryTextfield(
                hintText:
                    'Ex: Tela trincada, com capinha azul, película aplicada.',
                textInputAction: TextInputAction.newline,
                maxLine: 5,
                maxLength: 300,
              ),
              UIButtonPrimary(press: () {}, text: "Salvar celular"),
              SizedBox(height: SizeSpacing.m.h),
            ],
          ),
        ),
      ),
    );
  }
}
