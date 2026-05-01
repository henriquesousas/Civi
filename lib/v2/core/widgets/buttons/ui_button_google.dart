import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/theme/size_icon.dart';
import 'package:deehelp/v2/core/widgets/buttons/ui_button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UIButtonGoogle extends StatelessWidget {
  const UIButtonGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return UIButtonIcon(
      tap: () {},
      buttonStyle: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: const BorderSide(
          color: Color(0xFF22314D),
        ),
        backgroundColor: AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
      ),
      icon: SvgPicture.asset(
        "assets/svg/google.svg",
        width: SizeIcon.s.w,
        height: SizeIcon.s.h,
      ),
      title: "Login com o Google",
    );
  }
}
