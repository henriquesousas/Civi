import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
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
  final Widget? leading;
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
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return UIAnnotatedRegionWidget(
      // statusBarColor: appBarBgColor ?? Colors.white,
      useDarkTheme: true,
      systemNavigationBarColor: appBarBgColor ?? Colors.white,
      // statusBarColor: appBarBgColor ?? Colors.red,
      // systemNavigationBarColor:
      //     appBarBgColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar,
        // backgroundColor: bgColor ?? const Color(0xFFF8FAFC),
        backgroundColor: bgColor ?? Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: hideAppBar == true
            ? null
            : DefaultAppBar(
                title: "$pageTitle",
                press: () => onBackButtonTap,
                leading: _getLeading(),
              ),
        // : AppBar(
        //     // surfaceTintColor: Colors.transparent,
        //     // elevation: 12,
        //     toolbarHeight: 60,
        //     centerTitle: centerTitle,
        //     // backgroundColor: appBarBgColor ?? Colors.white,
        //     // backgroundColor: appBarBgColor ??
        //     //     Theme.of(context).scaffoldBackgroundColor,
        //     leading: _getLeading(),
        //     titleSpacing: 0,
        //     title: Padding(
        //       padding: EdgeInsets.only(
        //           left: showBackButton ? 0 : Dimens.size10.w),
        //       child: Text(
        //         "$pageTitle",
        //         style: context.appTextStyles.appBarTitle.copyWith(
        //           fontWeight: FontWeight.w500,
        //         ),
        //       ),
        //     ),
        //     actions: [
        //       if (actionButton != null) ...[...actionButton!],
        //     ],
        //   ),
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

  Widget? _getLeading() {
    if (leading != null) return leading!;
    return showBackButton
        ? IconButton(
            onPressed: () {
              if (onBackButtonTap != null) {
                onBackButtonTap!();
              } else {}
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          )
        : null;
  }
}
