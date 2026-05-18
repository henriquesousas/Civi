import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/theme/size/spacing_size.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/photo/card_photo.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/section_title.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/wizard_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemRegisterPhoto extends ConsumerWidget {
  const ItemRegisterPhoto({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 110),
      children: const [
        WizardHeader(
          step: 3,
          title: "Fotos",
          subtitle: 'Envio fotos depois do cadastro concluído',
        ),
        SizedBox(height: SpacingSize.xl),
        SectionTitle('Fotos do item'),
        CardPhoto(allowedPhotos: 3),
        SizedBox(height: SpacingSize.xl),
        // ButtonOutline(
        //   bgColor: Colors.white.withValues(alpha: 0.2),
        //   borderColor: Colors.black87,
        //   press: () {
        //     final userId = ref.read(authenticatedUserProvider)?.id;
        //     if (userId != null) {
        //       ref.watch(registerItemViewModelProvider.notifier).save(userId);
        //     }
        //   },
        //   text: "Adicionar foto depois",
        // ),
      ],
    );
  }
}
