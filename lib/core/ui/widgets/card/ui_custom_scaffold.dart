import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui_annotated_region_widget.dart';

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
  final Widget? bottomNavigationBar;
  final String? assetBackButton;
  final bool showBackButton;

  const UICustomScaffold({
    super.key,
    this.pageTitle = "",
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
    this.bottomNavigationBar,
    this.assetBackButton,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return UIAnnotatedRegionWidget(
      statusBarColor: appBarBgColor ?? Colors.white,
      systemNavigationBarColor: appBarBgColor ?? Colors.white,
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar,
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
                  leading: showBackButton
                      ? IconButton(
                          onPressed: () {
                            if (onBackButtonTap != null) {
                              onBackButtonTap!();
                            } else {}
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                          // icon: UIMyAssetsImageWidget(
                          //   color: const Color(0xFF2B5BEE),
                          //   isSvg: true,
                          //   assetPath: assetBackButton ?? R.svg.back,
                          //   width: 35.w,
                          //   height: 35.h,
                          // ),
                        )
                      : null,
                  titleSpacing: 0,
                  title: Padding(
                    padding: EdgeInsets.only(
                        left: showBackButton ? 0 : Dimens.size10.w),
                    child: Text(
                      "$pageTitle",
                      style: context.appTextStyles.appBarTitle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  actions: [
                    if (actionButton != null) ...[...actionButton!],
                  ],
                ),
              ),
        body: Padding(
          padding: padding ??
              EdgeInsetsDirectional.symmetric(
                horizontal: Dimens.defaultScafoldPadding.w,
                vertical: Dimens.defaultScafoldPadding.h,
              ),
          child: body,
        ),
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
