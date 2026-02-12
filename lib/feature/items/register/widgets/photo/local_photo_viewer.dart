
// import 'package:flutter/material.dart';

// class _LocalPhotoViewerDialog extends StatefulWidget {
//   final List<XFile> files;
//   final int initialIndex;

//   const _LocalPhotoViewerDialog({
//     required this.files,
//     required this.initialIndex,
//   });

//   @override
//   State<_LocalPhotoViewerDialog> createState() =>
//       _LocalPhotoViewerDialogState();
// }

// class _LocalPhotoViewerDialogState extends State<_LocalPhotoViewerDialog> {
//   late final PageController _ctrl;
//   late int index;

//   @override
//   void initState() {
//     super.initState();
//     index = widget.initialIndex;
//     _ctrl = PageController(initialPage: widget.initialIndex);
//   }

//   @override
//   void dispose() {
//     _ctrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Stack(
//         children: [
//           PageView.builder(
//             controller: _ctrl,
//             itemCount: widget.files.length,
//             onPageChanged: (i) => setState(() => index = i),
//             itemBuilder: (_, i) {
//               return InteractiveViewer(
//                 minScale: 1,
//                 maxScale: 4,
//                 child: Center(
//                   child: Image.file(
//                     File(widget.files[i].path),
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               );
//             },
//           ),
//           Positioned(
//             top: MediaQuery.of(context).padding.top + 10,
//             left: 14,
//             right: 14,
//             child: Row(
//               children: [
//                 IconButton(
//                   onPressed: () => Navigator.pop(context),
//                   icon: const Icon(Icons.close, color: Colors.white),
//                 ),
//                 const Spacer(),
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.10),
//                     borderRadius: BorderRadius.circular(99),
//                     border: Border.all(color: Colors.white.withOpacity(0.18)),
//                   ),
//                   child: Text(
//                     '${index + 1}/${widget.files.length}',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }