import 'package:deehelp/core/components/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/components/textfields/ui_primary_text_field.dart';
import 'package:deehelp/features/itens/create/components/select_color.dart';
import 'package:deehelp/features/itens/create/components/step_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/theme/constants.dart';
import 'header.dart';

class FormStepDetail extends StatefulWidget {
  const FormStepDetail({super.key});

  @override
  State<FormStepDetail> createState() => _FormStepDetailState();
}

class _FormStepDetailState extends State<FormStepDetail> {
  int _currentIndex = 0;
  List<StepColors> colorsList = [
    StepColors(Colors.yellow, true),
    StepColors(Colors.red, false),
    StepColors(Colors.green, false),
    StepColors(Colors.grey, false),
    StepColors(Colors.blue, false),
    StepColors(Colors.white, false),
    StepColors(Colors.black, false),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          const Header(
            title: "Informe os detalhes",
            subtitle:
                "Preencha as informações importantes sobre o produto, como modelo, cor, placa ou número de série.",
          ),
          const SizedBox(height: 32),
          const UIPrimaryTextField(
            labelText: "Número da placa",
          ),
          const UIPrimaryTextField(
            labelText: "Ex: VW, Fiat, BMW...",
          ),
          UIPrimaryTextField(
            prefixIcon: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
              child: SvgPicture.asset(
                R.images.svgPallet,
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withValues(alpha: 0.3),
                  BlendMode.srcIn,
                ),
              ),
            ),
            labelText: "Selecione uma cor",
            onTap: () {
              customModalBottomSheet(context, child: const SelectColor());
            },
          ),
          // Text(
          //   "Selecione a cor",
          //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
          //         color: AppColors.textSecondary,
          //       ),
          // ),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(20),
          //       border: Border.all(
          //         width: 1,
          //         color: AppColors.lightGreyColor20,
          //       )),
          //   child: GridView.builder(
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 5,
          //       mainAxisSpacing: 10,
          //       crossAxisSpacing: 10,
          //       mainAxisExtent: 20,
          //     ),
          //     itemCount: colorsList.length,
          //     itemBuilder: (context, index) {
          //       final item = colorsList[index];
          //       return GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             _currentIndex = index;
          //             for (var i = 0; i < colorsList.length; i++) {
          //               colorsList[i].isSelected = false;
          //             }
          //             item.isSelected = true;
          //           });
          //         },
          //         child: Container(
          //           decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: colorsList[index].color,
          //             border: Border.all(
          //               color: item.isSelected
          //                   ? AppColors.whiteColor
          //                   : Colors.grey[400]!, //Colors.grey[400]!,
          //               width: item.isSelected ? 3 : 1,
          //             ),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.black.withValues(alpha: 0.1),
          //                 blurRadius: 2,
          //                 offset: const Offset(0, 1),
          //               ),
          //             ],
          //           ),
          //           child: const Center(),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
