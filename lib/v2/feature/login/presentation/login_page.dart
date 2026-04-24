import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/buttons/export_buttons.dart';
import 'package:deehelp/v2/feature/login/presentation/widgets/floating_tag.dart';
import 'package:deehelp/v2/feature/login/presentation/widgets/login_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              child: Image.network(
                'https://images.unsplash.com/photo-1519501025264-65ba15a82390?auto=format&fit=crop&w=1400&q=80',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 150.h,
              left: 28,
              child: const FloatingTag(
                text: '200M de você',
                lineHeight: 70,
              ),
            ),
            Positioned(
              top: 220.h,
              left: context.percentWidth(0.35),
              child: const FloatingTag(
                text: 'Atividade suspeita',
                lineHeight: 92,
              ),
            ),
            Positioned(
              top: 100.h,
              right: 28,
              child: const FloatingTag(
                text: 'Roubo registrado',
                lineHeight: 58,
                lineToRight: true,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x22000000),
                      Color(0x44000000),
                      Color(0xEE0D0D11),
                      Color(0xFF0D0D11),
                    ],
                    stops: [0.0, 0.35, 0.68, 1.0],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SizeLayoutSpacing.l,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: SizeSpacing.l),
                    Text(
                      'Civi',
                      style: context.appText.header.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1,
                      ),
                    ),
                    const Spacer(),
                    const Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        LoginChip(text: 'Alertas'),
                        LoginChip(text: 'Mapa'),
                        LoginChip(text: 'Ao vivo'),
                      ],
                    ),
                    const SizedBox(height: SizeSpacing.xl),
                    Text(
                      'Saiba o que está\nacontecendo agora\nperto de você',
                      style: context.appText.header.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: SizeSpacing.l),
                    Text(
                      'Acompanhe roubos, assaltos e movimentações suspeitas em tempo real na sua cidade.',
                      style: context.appText.subtitle.copyWith(
                        color: context.themeColor.secundaryTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: SizeSpacing.xl),
                    UIButtonPrimary(
                      text: "Começar com o Google",
                      backgroundColor: AppColor.primaryColor,
                      textColor: Colors.white,
                      press: () {},
                    ),
                    const SizedBox(height: SizeSpacing.xs),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Continuar sem login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.04),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _FloatingTag extends StatelessWidget {
//   final String text;
//   final double lineHeight;
//   final bool lineToRight;

//   const _FloatingTag({
//     required this.text,
//     required this.lineHeight,
//     this.lineToRight = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final lineColor = Colors.white.withOpacity(0.90);

//     return Column(
//       crossAxisAlignment:
//           lineToRight ? CrossAxisAlignment.end : CrossAxisAlignment.center,
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
//           decoration: BoxDecoration(
//             color: const Color(0xFFF8FAFC),
//             borderRadius: BorderRadius.circular(28),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.22),
//                 blurRadius: 16,
//                 offset: const Offset(0, 8),
//               ),
//             ],
//           ),
//           child: Text(
//             text,
//             style: const TextStyle(
//               fontSize: 13.5,
//               fontWeight: FontWeight.w800,
//               color: Color(0xFF0F172A),
//             ),
//           ),
//         ),
//         if (!lineToRight) ...[
//           Container(width: 2, height: lineHeight, color: lineColor),
//           Container(
//             width: 14,
//             height: 14,
//             decoration: BoxDecoration(
//               color: lineColor,
//               shape: BoxShape.circle,
//             ),
//           ),
//         ] else ...[
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(width: 2, height: lineHeight, color: lineColor),
//               Container(width: 42, height: 2, color: lineColor),
//               Container(
//                 width: 14,
//                 height: 14,
//                 decoration: BoxDecoration(
//                   color: lineColor,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ],
//     );
//   }
// }
