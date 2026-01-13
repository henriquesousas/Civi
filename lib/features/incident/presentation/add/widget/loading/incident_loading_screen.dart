// import 'package:deehelp/core/ui/theme/dimens.dart';
// import 'package:deehelp/features/incident/presentation/add/widget/loading/incident_loading_progress_widget.dart';
// import 'package:deehelp/features/incident/presentation/add/widget/loading/incident_loading_top_image.dart';
// import 'package:deehelp/features/incident/presentation/add/widget/loading/incident_summary_widget.dart';
// import 'package:deehelp/features/incident/presentation/add/widget/loading/incident_warning_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class IncidentLoadingScreen extends StatelessWidget {
//   const IncidentLoadingScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[900],
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const IncidentLoadingTopImage(),
//                   SizedBox(height: Dimens.size40.h),
//                   Spacer(),
//                   const IncidentLoadingProgressWidget(),
//                   // const Spacer(),
//                   // const IncidentSummaryWidget(),
//                   // SizedBox(height: Dimens.size10.h),
//                   // const IncidentWarningWidget(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
