import 'package:deehelp/features/itens/my_items.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors_v2.dart';

class MyItemsCard extends StatelessWidget {
  final MyItems item;
  final VoidCallback onTap;
  const MyItemsCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // spacing: 10,
        children: [
          // item.imageUrl != null
          //     ? ClipRRect(
          //         borderRadius: BorderRadius.circular(10),
          //         child: Image.asset(
          //           item.imageUrl ?? "",
          //           width: 60,
          //           height: 60,
          //           fit: BoxFit.cover,
          //         ),
          //       )
          //     : Container(
          //         width: 60,
          //         height: 60,
          //         decoration: BoxDecoration(
          //           color: AppColors.primary.withValues(alpha: 0.4),
          //           borderRadius: BorderRadius.circular(10),
          //           border: Border.all(
          //             color: Colors.white.withValues(alpha: 0.3),
          //             width: 3,
          //           ),
          //         ),
          //         child: Icon(
          //           Icons.phone,
          //           color: AppColors.primary.withValues(alpha: 0.6),
          //           size: 20,
          //         ),
          //       ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.name,
                        style: context.getTextStyle.mediumSmall.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColorsV2.border,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: onTap,
                            child: Text(
                              "Editar",
                              style: context.getTextStyle.small.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColorsV2.textSecondary,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${item.year}",
                        style: context.getTextStyle.small,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: AppColorsV2.borderDark,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Text(
                        item.code,
                        style: context.getTextStyle.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
