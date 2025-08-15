import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yousafe/app/localization/image_config.dart';
import 'package:yousafe/app/router/router_config.dart';
import 'package:yousafe/app/theme/size_config.dart';
import 'package:yousafe/features/favorites/components/ui_delete_button.dart';
import 'package:yousafe/features/favorites/favourite_model.dart';
import 'package:yousafe/shared/components/buttons/primary_button.dart';
import 'package:yousafe/shared/components/buttons/secondary_button.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class UIDetaielSection extends StatelessWidget {
  final FavouriteModel favourite;
  const UIDetaielSection({super.key, required this.favourite});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          favourite.description,
          style: context.getTextStyle.mediumSmall,
        ),
        Text(
          favourite.plate,
          style: context.getTextStyle.regular
              .copyWith(fontWeight: FontWeight.w400),
        ),
        Text(
          favourite.address,
          style: context.getTextStyle.small,
        ),
        Text(
          "Há 3 dias",
          style: context.getTextStyle.small.copyWith(
            fontSize: 10,
          ),
        ),
        const SizedBox(height: SizeConfig.height10),
        Row(
          spacing: 10,
          children: [
            UIDeleteButton(fileImage: ImageConfig.delete),
            UIDeleteButton(fileImage: ImageConfig.flag),
            const SizedBox(width: SizeConfig.width08),
            Expanded(
              child: SecondaryButton(
                text: "Detalhes",
                height: 32,
                // textStyle: context.getTextStyle.small,
                // borderRadius: SizeConfig.borderRadius08,
                onPressed: () => context.push(Routes.productDetail),
              ),
            )
          ],
        )
      ],
    );
  }
}
