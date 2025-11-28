import 'package:deehelp/core/components/ui_annotated_region_widget.dart';
import 'package:deehelp/core/components/ui_my_assets_image_widget.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class UICustomScaffold extends StatelessWidget {
  final String? pageTitle;
  final List<Widget>? actionButton;
  final Widget? body;
  final bool? hideAppBar;
  final Color? appBarBgColor;
  final Color? bgColor;
  final EdgeInsetsGeometry? padding;
  final bool demo;
  final bool centerTitle;
  final VoidCallback? onBackButtonTap;
  final Widget? floatingActionButton;

  const UICustomScaffold({
    super.key,
    this.pageTitle = "PageTitle",
    this.actionButton,
    this.body,
    this.hideAppBar,
    this.appBarBgColor,
    this.bgColor,
    this.padding,
    this.demo = false,
    this.centerTitle = false,
    this.onBackButtonTap,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return UIAnnotatedRegionWidget(
      statusBarColor: appBarBgColor ?? Colors.white,
      systemNavigationBarColor: appBarBgColor ?? Colors.white,
      child: Scaffold(
        backgroundColor: bgColor ?? const Color(0xFFF8FAFC),
        resizeToAvoidBottomInset: false,
        appBar: hideAppBar == true
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: AppBar(
                  surfaceTintColor: Colors.transparent,
                  centerTitle: centerTitle,
                  backgroundColor: appBarBgColor ?? Colors.white,
                  leading: IconButton(
                    onPressed: () {
                      if (onBackButtonTap != null) {
                        onBackButtonTap!();
                      } else {}
                    },
                    icon: UIMyAssetsImageWidget(
                      color: const Color(0xFF2B5BEE),
                      isSvg: true,
                      assetPath: R.images.svgArrowBackCircle,
                      width: 35,
                      height: 35,
                    ),
                  ),
                  titleSpacing: 0,
                  title: Text(
                    "$pageTitle",
                    style: context.appTextStyles.appBarTitle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  actions: [
                    if (actionButton != null) ...[...actionButton!],
                  ],
                ),
              ),
        body: Padding(
          padding: padding ??
              const EdgeInsetsDirectional.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
          child: body,
        ),
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
