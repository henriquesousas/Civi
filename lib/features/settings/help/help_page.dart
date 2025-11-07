import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../core/resources/resources.dart';
import '../../../core/theme/constants.dart';
import '../../../shared/components/primary_app_bar.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const PrimaryAppBar(title: "Ajuda"),
      bottomNavigationBar: Container(
        height: context.percentHeight(0.16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              offset: const Offset(0, 1),
              blurRadius: 90,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListTile(
              onTap: () {
                print("ola");
              },
              title: Text(
                "Nos envia uma mensagem",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              subtitle: Text(
                "Estamos prontos para te antender.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.successColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    R.images.svgWhatsapp,
                    width: context.percentHeight(0.03),
                    height: context.percentHeight(0.03),
                    color: Colors.white,
                  ),
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color:
                    Theme.of(context).iconTheme.color!.withValues(alpha: 0.4),
                size: forwardIconSize,
              ),
            ),
          ),
        ),
        // child: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 30),
        //   child: Row(
        //     spacing: 10,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       Container(
        //         width: 60,
        //         height: 60,
        //         decoration: BoxDecoration(
        //           color: AppColors.successColor,
        //           borderRadius: BorderRadius.circular(15),
        //         ),
        //         child: Center(
        //           child: SvgPicture.asset(
        //             R.images.svgWhatsapp,
        //             width: context.percentHeight(0.03),
        //             height: context.percentHeight(0.03),
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Text(
        //             "Contato via chat",
        //             textAlign: TextAlign.center,
        //             style: Theme.of(context).textTheme.titleMedium?.copyWith(
        //                   fontWeight: FontWeight.w400,
        //                 ),
        //           ),
        //           Text("Estamos prontos para te atender :)",
        //               textAlign: TextAlign.center,
        //               style: Theme.of(context).textTheme.bodyMedium),
        //         ],
        //       ),
        //       Icon(
        //         Icons.arrow_forward_ios_rounded,
        //         color:
        //             Theme.of(context).iconTheme.color!.withValues(alpha: 0.4),
        //         size: forwardIconSize,
        //       )
        //     ],
        //   ),
        // ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/lottie/security_icon.json",
              width: context.percentWidth(0.7),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Queremos te ouvir! Envie sua mensagem e vamos conversar.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.whileColor20.withValues(alpha: 0.9)),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              onTap: () {
                print("ola");
              },
              title: Text(
                "Contato",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                "11 972732245",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    R.images.svgCall,
                    width: context.percentHeight(0.025),
                    height: context.percentHeight(0.025),
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Divider(height: 1, color: AppColors.lightGreyColor20),
            ListTile(
              onTap: () {
                print("ola");
              },
              title: Text(
                "Email",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                "paulohenriquess2014@gmail.com",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    R.images.svgMessage,
                    width: context.percentHeight(0.025),
                    height: context.percentHeight(0.025),
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
