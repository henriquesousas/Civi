import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/buttons/export_buttons.dart';
import 'package:deehelp/v2/core/widgets/textfield/ui_primary_textfield.dart';
import 'package:deehelp/v2/feature/product/presentation/register/widgets/photo_container.dart';
import 'package:deehelp/v2/feature/product/presentation/register/widgets/section_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterVehiclePage extends StatefulWidget {
  const RegisterVehiclePage({super.key});

  @override
  State<RegisterVehiclePage> createState() => _RegisterVehiclePageState();
}

class _RegisterVehiclePageState extends State<RegisterVehiclePage> {
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
                'Cadastrar veículo',
                style: context.appText.header.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: SizeSpacing.s),
              Text(
                'Informe os dados do veículo para facilitar a identificação e o cadastro no app.',
                style: context.appText.subtitle.copyWith(
                  color: context.themeColor.secundaryTextColor,
                  height: 1.35,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: SizeSpacing.xl),
              const SectionLabel('Nome do veículo'),
              const SizedBox(height: SizeSpacing.s),
              const UIPrimaryTextfield(
                hintText: 'Ex: Civic Touring 2020',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: SizeSpacing.xl),
              const SectionLabel('Marca'),
              const SizedBox(height: SizeSpacing.s),
              UIPrimaryTextfield(
                hintText: 'Ex: Honda',
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
              const SectionLabel('Placa'),
              const SizedBox(height: SizeSpacing.s),
              const UIPrimaryTextfield(
                hintText: 'Ex: ABC1D23',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: SizeSpacing.xl),
              const SectionLabel('Observações'),
              const SizedBox(height: SizeSpacing.s),
              Text(
                'Descreva detalhes importantes do veículo. Máximo de 300 caracteres.',
                style: context.appText.subtitle.copyWith(
                  color: context.themeColor.secundaryTextColor,
                ),
              ),
              const SizedBox(height: SizeSpacing.m),
              const UIPrimaryTextfield(
                hintText:
                    'Ex: Possui adesivo no vidro traseiro, roda preta, pequeno risco na porta.',
                textInputAction: TextInputAction.newline,
                maxLine: 5,
                maxLength: 300,
              ),
              const SectionLabel('Fotos'),
              const SizedBox(height: SizeSpacing.s),
              Text(
                'Adicione 1 ou mais fotos para ajudar na identificação.',
                style: context.appText.subtitle.copyWith(
                  color: context.themeColor.secundaryTextColor,
                ),
              ),
              const SizedBox(height: SizeSpacing.s),
              PhotoContainer(photos: mockPhotos, onAdd: () {}),
              const SizedBox(height: SizeSpacing.m),
              UIButtonPrimary(press: () {}, text: "Salvar veicuilo"),
              SizedBox(height: SizeSpacing.m.h),
            ],
          ),
        ),
      ),
    );
  }
}
