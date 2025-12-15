// import 'package:deehelp/core/widgets/card/ui_custom_app_card.dart';
// import 'package:deehelp/core/widgets/card/ui_custom_scaffold.dart';
// import 'package:flutter/material.dart';

// class TestPage extends StatelessWidget {
//   const TestPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return UICustomScaffold(
//       pageTitle: "Transacion history",
//       onBackButtonTap: () {},
//       actionButton: [],
//       body: UICustomAppCard(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Flexible(
//               fit: FlexFit.loose,
//               child: ListView.builder(
//                 physics: const ClampingScrollPhysics(
//                   parent: AlwaysScrollableScrollPhysics(),
//                 ),
//                 itemCount: 50,
//                 itemBuilder: (context, index) {
//                   return SizedBox(height: 2);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
