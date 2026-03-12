import 'package:deehelp/app_name.dart';
import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  final VoidCallback onSkip;
  const Header({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Container(
        //   width: 52.w,
        //   height: 52.w,
        //   decoration: BoxDecoration(
        //     color: context.primaryColor,
        //     borderRadius: BorderRadius.circular(100),
        //     boxShadow: [
        //       BoxShadow(
        //         color: context.primaryColor.withValues(alpha: 0.25),
        //         blurRadius: 18,
        //         offset: const Offset(0, 10),
        //       ),
        //     ],
        //   ),
        //   child: const Icon(Icons.arrow_back, color: Colors.white),
        //   // child: Image.asset(
        //   //   'assets/images/logo5.png',
        //   //   // width: 90,
        //   //   // height: 80,
        //   //   fit: BoxFit.cover,
        //   // ),
        // ),

        IconButton(
          onPressed: () => context.pop(),
          icon:
              Icon(Icons.arrow_back_ios_new_rounded, color: context.onSurface),
        ),

        const SizedBox(width: SpacingSize.md),
        Expanded(
          child: Text(
            AppName.appName,
            style: context.appText.headerlg.copyWith(
              fontWeight: FontWeight.w900,
              color: context.onSurface,
              letterSpacing: 0.2,
            ),
          ),
        ),
        // TextButton(
        //   onPressed: onSkip,
        //   style: TextButton.styleFrom(
        //     foregroundColor: Colors.white,
        //     padding: const EdgeInsets.symmetric(
        //         horizontal: SpacingSize.md, vertical: SpacingSize.md),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(RadiusSize.md),
        //       side: BorderSide(color: Colors.white.withValues(alpha: 0.22)),
        //     ),
        //   ),
        //   child: const Text(
        //     'Fechar',
        //     style: TextStyle(fontWeight: FontWeight.w900),
        //   ),
        // ),
      ],
    );
  }
}
