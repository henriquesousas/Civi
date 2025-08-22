import 'package:flutter/material.dart';
import 'package:yousafe/shared/components/buttons/base_button.dart';

import '../../../app/theme/app_colors.dart';

class PrimaryButton extends BaseButton {
  const PrimaryButton({
    super.key,
    required super.text,
    required super.onPressed,
    super.width,
  });

  @override
  Color getBackgroundColor() => AppColors.primary;

  @override
  Color getForegroundColor() => Colors.white;
}

// class PrimaryButton extends StatelessWidget {
//   final String text;
//   final Color? backgroundColor;
//   final VoidCallback? onPressed;
//   final EdgeInsets? padding;
//   final double? height;
//   final double? borderRadius;
//   final TextStyle? textStyle;

//   const PrimaryButton({
//     super.key,
//     this.padding,
//     this.onPressed,
//     this.backgroundColor = Colors.white,
//     this.height,
//     this.textStyle,
//     this.borderRadius,
//     required this.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: backgroundColor,
//           foregroundColor: Colors.white,
//           elevation: 0,
//           padding: EdgeInsets.symmetric(vertical: height ?? 18),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         child: Text(
//           text,
//           style: textStyle ?? context.getTextStyle.medium,
//         ),
//       ),
//     );
//   }
// }
