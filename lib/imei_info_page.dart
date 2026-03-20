import 'package:deehelp/core/extension/size_extension.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ImeiInfoPage extends StatelessWidget {
  const ImeiInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFF0B0F14);
    const surface = Color(0xFF121821);
    // const surfaceSoft = Color(0xFF161D27);
    const border = Color(0xFF222B38);
    // const primary = Color(0xFF3B82F6);
    const textPrimary = Colors.white;
    const textSecondary = Color(0xFF9AA4B2);
    const warningBg = Color(0xFF1E1720);
    const warningBorder = Color(0xFF3A243C);
    const warningText = Color(0xFFF5C2E7);

    return Scaffold(
      backgroundColor: bg,
      // appBar: AppBar(
      //   backgroundColor: bg,
      //   elevation: 0,
      //   title: const Text(
      //     'Sobre o IMEI',
      //     style: TextStyle(
      //       color: textPrimary,
      //       fontWeight: FontWeight.w700,
      //     ),
      //   ),
      //   iconTheme: const IconThemeData(color: textPrimary),
      // ),
      appBar: DefaultAppBar(
        title: "Sobre o IMEI",
        press: () => context.pop(),
        showBackButton: true,
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Row(
          children: [
            // Expanded(
            //   child: OutlinedButton(
            //     onPressed: () => Navigator.pop(context),
            //     style: OutlinedButton.styleFrom(
            //       side: const BorderSide(color: border),
            //       foregroundColor: textPrimary,
            //       minimumSize: const Size.fromHeight(52),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(16),
            //       ),
            //     ),
            //     child: const Text('Entendi'),
            //   ),
            // ),
            // const SizedBox(width: 12),
            Expanded(
              child: ButtonPrimary(
                press: () => context.pop(),
                text: "Entendi",
              ),
              // child: FilledButton(
              //   onPressed: () {
              //     // navegar para o formulário / campo IMEI
              //   },
              //   style: FilledButton.styleFrom(
              //     backgroundColor: primary,
              //     foregroundColor: Colors.white,
              //     minimumSize: const Size.fromHeight(52),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(16),
              //     ),
              //   ),
              //   child: const Text('Cadastrar IMEI'),
              // ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const _HeroCard(),
            Center(
              child: Lottie.asset(
                "assets/lottie/phone_code.json",
                width: context.percentWidth(0.5),
                height: context.percentWidth(0.5),
                repeat: false,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'O que é o IMEI?',
              style: TextStyle(
                color: textPrimary,
                fontSize: context.safeSp(22),
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'O IMEI é um número único que identifica o seu celular. '
              'Ele funciona como a identidade do aparelho e pode ajudar '
              'na comprovação e identificação em caso de perda ou roubo.',
              style: TextStyle(
                color: textSecondary,
                fontSize: context.safeSp(14),
                height: 1.5,
              ),
            ),
            // const SizedBox(height: 20),
            // const _InfoCard(
            //   icon: Icons.verified_outlined,
            //   title: 'Identificação única',
            //   description:
            //       'Cada celular possui um IMEI exclusivo, usado para diferenciar um aparelho de outro.',
            // ),
            // const SizedBox(height: 12),
            // const _InfoCard(
            //   icon: Icons.shield_outlined,
            //   title: 'Por que cadastrar',
            //   description:
            //       'Informar o IMEI deixa o cadastro mais completo e pode ajudar na validação do dispositivo.',
            // ),
            // const SizedBox(height: 12),
            // const _InfoCard(
            //   icon: Icons.search_outlined,
            //   title: 'Como encontrar',
            //   description:
            //       'Digite *#06# no telefone, consulte a caixa do aparelho ou veja nas configurações do sistema.',
            // ),
            const SizedBox(height: 22),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Como acessar o IMEI do dispositivo',
                    style: TextStyle(
                      color: textPrimary,
                      fontSize: context.safeSp(14),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const _StepItem(
                    number: '1',
                    text: 'Abra o aplicativo de telefone do celular',
                  ),
                  const _StepItem(
                    number: '2',
                    text: 'Digite o código *#06#',
                  ),
                  const _StepItem(
                    number: '3',
                    text: 'O número IMEI aparecerá na tela',
                  ),
                  const _StepItem(
                    number: '4',
                    text:
                        'Você também pode encontrar nas configurações do aparelho',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Android: Configurações > Sobre o telefone\n'
                    'iPhone: Ajustes > Geral > Sobre',
                    style: TextStyle(
                      color: textSecondary,
                      fontSize: context.safeSp(13),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: warningBg,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: warningBorder),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.lock_outline_rounded,
                    color: warningText,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Guarde seu IMEI com segurança e evite compartilhar essa informação publicamente.',
                      style: TextStyle(
                        color: warningText,
                        fontSize: context.safeSp(13),
                        height: 1.45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _HeroCard extends StatelessWidget {
//   const _HeroCard();

//   @override
//   Widget build(BuildContext context) {
//     const surfaceSoft = Color(0xFF161D27);
//     const border = Color(0xFF222B38);
//     const primary = Color(0xFF3B82F6);
//     const textPrimary = Colors.white;
//     const textSecondary = Color(0xFF9AA4B2);

//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: border),
//         gradient: const LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color(0xFF161D27),
//             Color(0xFF101620),
//           ],
//         ),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 58,
//             height: 58,
//             decoration: BoxDecoration(
//               color: primary.withValues(alpha: 0.14),
//               borderRadius: BorderRadius.circular(18),
//             ),
//             child: const Icon(
//               Icons.phone_android_rounded,
//               color: primary,
//               size: 28,
//             ),
//           ),
//           const SizedBox(width: 14),
//           const Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Cadastro mais seguro',
//                   style: TextStyle(
//                     color: textPrimary,
//                     fontSize: 17,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 SizedBox(height: 6),
//                 Text(
//                   'Adicionar o IMEI ajuda a identificar melhor o aparelho cadastrado.',
//                   style: TextStyle(
//                     color: textSecondary,
//                     fontSize: 14,
//                     height: 1.4,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _InfoCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String description;

//   const _InfoCard({
//     required this.icon,
//     required this.title,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const surface = Color(0xFF121821);
//     const border = Color(0xFF222B38);
//     const primary = Color(0xFF3B82F6);
//     const textPrimary = Colors.white;
//     const textSecondary = Color(0xFF9AA4B2);

//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: surface,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: border),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 42,
//             height: 42,
//             decoration: BoxDecoration(
//               color: primary.withValues(alpha: 0.12),
//               borderRadius: BorderRadius.circular(14),
//             ),
//             child: Icon(
//               icon,
//               color: primary,
//               size: 20,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     color: textPrimary,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   description,
//                   style: const TextStyle(
//                     color: textSecondary,
//                     fontSize: 14,
//                     height: 1.45,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _StepItem extends StatelessWidget {
  final String number;
  final String text;

  const _StepItem({
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF3B82F6);
    // const textPrimary = Colors.white;
    const textSecondary = Color(0xFF9AA4B2);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24.w,
            height: 24.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primary.withValues(alpha: 0.14),
              shape: BoxShape.circle,
            ),
            child: Text(
              number,
              style: TextStyle(
                color: primary,
                fontSize: context.safeSp(12),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: textSecondary,
                fontSize: context.safeSp(12),
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
