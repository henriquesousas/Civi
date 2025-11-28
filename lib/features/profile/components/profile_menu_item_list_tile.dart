// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../../../core/components/list_tile/divider_list_tile.dart';
//
// //TODO: Rename
// class ProfileMenuListTile extends StatelessWidget {
//   final String text;
//   final String? svgSrc;
//   final VoidCallback press;
//   final bool isShowDivider;
//   final bool isShowForwardArrow;
//
//   const ProfileMenuListTile({
//     super.key,
//     required this.text,
//     required this.press,
//     this.svgSrc,
//     this.isShowDivider = true,
//     this.isShowForwardArrow = true,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return DividerListTile(
//       minLeadingWidth: 24,
//       leading: svgSrc != null
//           ? SvgPicture.asset(
//               svgSrc!,
//               height: 24,
//               width: 24,
//               colorFilter: ColorFilter.mode(
//                 Theme.of(context).iconTheme.color!,
//                 BlendMode.srcIn,
//               ),
//             )
//           : null,
//       title: Text(
//         text,
//         style: const TextStyle(fontSize: 14, height: 1),
//       ),
//       press: press,
//       isShowDivider: isShowDivider,
//       isShowForwardArrow: isShowForwardArrow,
//     );
//   }
// }
