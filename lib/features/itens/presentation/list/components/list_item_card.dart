import 'package:deehelp/core/components/images/ui_network_image_with_loader.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/constants.dart';
import 'package:flutter/material.dart';

class ListItemCard extends StatelessWidget {
  final String image, brandName, code;
  final int year;
  final bool active;
  final VoidCallback? press;
  final ButtonStyle? style;

  const ListItemCard({
    super.key,
    required this.image,
    required this.brandName,
    required this.code,
    required this.year,
    required this.active,
    this.press,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: OutlinedButton(
        onPressed: press,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: const Size(256, 130),
          maximumSize: const Size(256, 130),
          side: const BorderSide(
            color: AppColors.lightGreyColor20,
            width: 0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        ),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1.15,
              child: UINetworkImageWithLoader(
                image,
                radius: defaultBorderRadius,
              ),
            ),
            const SizedBox(width: defaultPadding / 4),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            brandName.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2),
                          height: 16,
                          decoration: BoxDecoration(
                            color: active
                                ? AppColors.successColor
                                : AppColors.errorColor,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(defaultBorderRadius)),
                          ),
                          child: Text(
                            active ? "Ativo" : "Inativo",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    Text(
                      code,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!,
                    ),
                    Text(
                      "$year",
                      style: const TextStyle(
                        color: Color(0xFF31B0D8),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Theme.of(context)
                            .iconTheme
                            .color!
                            .withValues(alpha: 0.4),
                        size: 12,
                      ),
                    )
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
