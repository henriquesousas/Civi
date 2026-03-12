// import 'package:deehelp/core/extension/color_extension.dart';
// import 'package:deehelp/core/theme/export_theme.dart';
// import 'package:deehelp/core/ui/styles/export_style.dart';
// import 'package:deehelp/core/ui/widgets/image/export_image.dart';
// import 'package:flutter/material.dart';

// class AccountCard extends StatelessWidget {
//   final String name;
//   final String email;
//   final String? imageUrl;
//   const AccountCard(
//       {super.key,
//       required this.name,
//       required this.email,
//       required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
//       padding: const EdgeInsets.all(RadiusSize.lg),
//       decoration: BoxDecoration(
//         color: context.secondaryContainer,
//         borderRadius: BorderRadius.circular(RadiusSize.lg),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x142B5BEE),
//             blurRadius: 16,
//             offset: Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           // if (imageUrl != null) ...[
//           //   ProfileImageWithUploadButtonWidget(
//           //     imageUrl: imageUrl,
//           //     imageAlt: name,
//           //   ),
//           // ] else ...[
//           //   // HomeAvatarBadge(initials: "PS", onTap: () {})
//           // ],

//           ProfileImageWithUploadButtonWidget(
//             imageUrl: imageUrl,
//             imageAlt: name,
//           ),

//           const SizedBox(width: SpacingSize.lg),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: context.appText.headermd,
//                 ),
//                 const SizedBox(height: SpacingSize.xxs),
//                 Text(
//                   email,
//                   style: context.appText.bodySmall.copyWith(
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // const Icon(Icons.chevron_right, color: Color(0xFF8A96C8)),
//         ],
//       ),
//     );
//   }
// }
