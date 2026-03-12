import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UIAnnotatedRegionWidget extends StatelessWidget {
  final Widget child;
  final Color statusBarColor;
  final Color systemNavigationBarColor;
  final Brightness? statusBarBrightness;
  final Brightness? statusBarIconBrightness;

  final Brightness systemNavigationBarIconBrightness;
  final Color? systemNavigationBarDividerColor;
  final bool useDarkTheme;
  final EdgeInsets? padding;

  const UIAnnotatedRegionWidget({
    super.key,
    required this.child,
    this.statusBarColor = Colors.white,
    this.statusBarBrightness,
    this.statusBarIconBrightness,
    this.systemNavigationBarIconBrightness = Brightness.dark,
    this.systemNavigationBarColor = Colors.white,
    this.systemNavigationBarDividerColor,
    this.useDarkTheme = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    // final systemUiOverlayStyle = useDarkTheme
    //     ? SystemUiOverlayStyle.dark.copyWith(
    //         statusBarColor: Colors.white,
    //         statusBarBrightness: statusBarBrightness ?? Brightness.light,
    //         statusBarIconBrightness: statusBarIconBrightness ?? Brightness.dark,
    //         systemNavigationBarColor: systemNavigationBarColor,
    //         systemNavigationBarIconBrightness:
    //             systemNavigationBarIconBrightness,
    //         systemNavigationBarDividerColor: systemNavigationBarDividerColor,
    //       )
    //     : SystemUiOverlayStyle.light.copyWith(
    //         statusBarColor: Colors.transparent,
    //         statusBarBrightness: statusBarBrightness ?? Brightness.light,
    //         statusBarIconBrightness: statusBarIconBrightness ?? Brightness.dark,
    //         systemNavigationBarColor: systemNavigationBarColor,
    //         systemNavigationBarIconBrightness:
    //             systemNavigationBarIconBrightness,
    //         systemNavigationBarDividerColor: systemNavigationBarDividerColor,
    //       );

    return Container(
      color: systemNavigationBarColor,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          // value: systemUiOverlayStyle,
          // value: SystemUiOverlayStyle.light.copyWith(
          //   statusBarColor: Colors.black,
          // ),
          value: useDarkTheme
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,

          child: SafeArea(
            top: false,
            left: false,
            right: false,
            bottom: true,
            child: child,
          ),
        ),
      ),
    );
  }
}
