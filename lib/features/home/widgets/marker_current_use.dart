import 'package:deehelp/core/components/ui_my_network_image_widget.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/theme/app_colors.dart';

Marker marker({
  required BuildContext context,
  required LatLng point,
}) {
  return Marker(
    point: point,
    width: 80,
    height: 80,
    child: Column(
      spacing: 2,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const UIMyNetworkImageWidget(
              width: 50,
              height: 50,
              radius: 100,
              // imageUrl: FirebaseAuth.instance.currentUser?.photoURL ?? '',
              imageUrl:
                  "https://www.meionews.com/uploads/imagens/2024/11/17/carro-roubado-de-comitiva-do-g20-e-achado-em-favela-no-rio-de-janeiro-922b8399-7578-4726-b6c7-de616d8ebb49.jpg",
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                offset: const Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Text(
            "Você",
            style: context.appTextStyles.caption1Style.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
