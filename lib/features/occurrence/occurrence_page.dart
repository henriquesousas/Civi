import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:deehelp/app/router/router_config.dart';
import 'package:deehelp/shared/components/icons/primary_icon.dart';
import 'package:deehelp/shared/components/primary_app_bar.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

import '../../app/theme/app_colors.dart';

class OccurrencePage extends StatelessWidget {
  const OccurrencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const PrimaryAppBar(title: "Ocorrência"),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 100,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => context.push(Routes.productDetail),
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(20),
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
                  child: Column(
                    children: [
                      //Veficado
                      Row(
                        children: [
                          Text(
                            "Ontem",
                            style: context.getTextStyle.regular.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "12:45",
                            style: context.getTextStyle.small.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const Spacer(),
                          PrimaryIcon(
                            height: 25,
                            width: 25,
                            background: AppColors.lightGradient,
                            icon: Icon(
                              Icons.favorite,
                              color: AppColors.primary,
                              size: 16,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.success.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Verificado",
                              style: context.getTextStyle.small.copyWith(
                                  color: AppColors.success,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      //Information
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: AppColors.success,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 30,
                                color: AppColors.border,
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: AppColors.error,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 30,
                                color: AppColors.border,
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: AppColors.error,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              spacing: 22,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Avenida paulista 1500, Osasco - São Paulo ",
                                  style: context.getTextStyle.regular.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // const SizedBox(height: 18),
                                Text(
                                  "Furto/Roubo",
                                  style: context.getTextStyle.small.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // const SizedBox(height: 18),
                                Text(
                                  "DND0171",
                                  style: context.getTextStyle.small.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: AppColors.textSecondary,
                              size: 16,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Jhon Doe",
                              style: context.getTextStyle.small.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(width: 16),
                            Icon(
                              Icons.directions_car,
                              color: AppColors.textSecondary,
                              size: 16,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Gol G3",
                              style: context.getTextStyle.small.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.chevron_right,
                              color: AppColors.textTertiary,
                              size: 16,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
