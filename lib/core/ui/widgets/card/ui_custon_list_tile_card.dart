import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';

import '../image/ui_my_network_image_widget.dart';

class UICustomListTileCard extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double width;
  final double? imageWidth;
  final double? imageHeight;
  final Widget? leading;
  final Color backgroundColor;
  final double radius;
  final VoidCallback? press;
  final String? imagePath;
  final String? title;
  final Widget? titleWidget;
  final String? subtitle;
  final Widget? subtitleWidget;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Widget? trailing;
  final bool? showBorder;
  final bool? showLeading;
  final bool isPress;

  const UICustomListTileCard({
    super.key,
    this.width = double.infinity,
    this.backgroundColor = Colors.transparent,
    this.radius = 0,
    this.press,
    this.imagePath,
    this.title,
    this.subtitle,
    this.subtitleWidget,
    this.titleStyle,
    this.subtitleStyle,
    this.trailing,
    this.isPress = false,
    this.padding,
    this.margin,
    this.showBorder = true,
    this.showLeading = true,
    this.imageWidth,
    this.imageHeight,
    this.leading,
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: press,
        child: Container(
          width: width,
          padding: padding ??
              const EdgeInsetsDirectional.symmetric(
                  vertical: Dimens.defaultPadding),
          margin: margin,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
            border: showBorder == true
                ? const Border(
                    bottom: BorderSide(
                      color: AppColors.borderColor1,
                      width: 1,
                    ),
                  )
                : null,
          ),
          child: ListTile(
            minTileHeight: 0,
            minVerticalPadding: 0,
            horizontalTitleGap: 8,
            leading: showLeading == true
                ? (leading ??
                    UIMyNetworkImageWidget(
                      imageUrl: imagePath ?? "",
                      isProfile: false,
                      width: imageWidth ?? Dimens.defaultListTilePadding,
                      height: imageWidth ?? Dimens.defaultListTilePadding,
                    ))
                : null,
            title: titleWidget ??
                (title != null
                    ? Text(
                        title ?? "",
                        style:
                            titleStyle ?? context.appTextStyles.sectionTitle3,
                      )
                    : null),
            subtitle: subtitleWidget ??
                (subtitle != null
                    ? Text(
                        subtitle ?? "",
                        style: subtitleStyle ??
                            context.appTextStyles.sectionSubTitle1.copyWith(
                              color: AppColors.textTertiary,
                            ),
                      )
                    : null),
            trailing: trailing,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
