// import 'package:deehelp/core/ui/theme/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../core/ui/assets/resources.dart';

// class SearchWidget extends StatefulWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final ValueChanged<String>? onChanged;
//   final VoidCallback? onSearch;
//   final VoidCallback? onClear;
//   final bool autoFocus;
//   final Color backgroundColor;
//   final Color accentColor;
//   final double borderRadius;
//   final bool showClearButton;
//   final bool showSearchIcon;
//   final EdgeInsetsGeometry padding;

//   const SearchWidget({
//     Key? key,
//     required this.controller,
//     this.hintText = 'Buscar...',
//     this.onChanged,
//     this.onSearch,
//     this.onClear,
//     this.autoFocus = false,
//     this.backgroundColor = Colors.white,
//     this.accentColor = Colors.blue,
//     this.borderRadius = 25.0,
//     this.showClearButton = true,
//     this.showSearchIcon = true,
//     this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//   }) : super(key: key);

//   @override
//   _SearchWidgetState createState() => _SearchWidgetState();
// }

// class _SearchWidgetState extends State<SearchWidget> {
//   final FocusNode _focusNode = FocusNode();
//   bool _hasFocus = false;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(_onFocusChange);
//     widget.controller.addListener(_onTextChange);
//   }

//   void _onFocusChange() {
//     setState(() {
//       _hasFocus = _focusNode.hasFocus;
//     });
//   }

//   void _onTextChange() {
//     setState(() {});
//   }

//   void _onClear() {
//     widget.controller.clear();
//     if (widget.onClear != null) {
//       widget.onClear!();
//     } else {
//       // Foca no campo após limpar
//       _focusNode.requestFocus();
//     }
//     if (widget.onChanged != null) {
//       widget.onChanged!('');
//     }
//   }

//   void _onSearch() {
//     if (widget.onSearch != null) {
//       widget.onSearch!();
//     } else {
//       // Esconde o teclado se não há ação customizada
//       _focusNode.unfocus();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: widget.padding,
//       child: Container(
//         decoration: BoxDecoration(
//           color: widget.backgroundColor,
//           border: Border.all(color: AppColors.lightGreyColor20),
//           borderRadius: BorderRadius.circular(10),
//           // boxShadow: [
//           //   BoxShadow(
//           //     color: Colors.black.withOpacity(_hasFocus ? 0.1 : 0.05),
//           //     blurRadius: _hasFocus ? 12 : 8,
//           //     offset: Offset(0, _hasFocus ? 4 : 2),
//           //     spreadRadius: _hasFocus ? 0.5 : 0,
//           //   ),
//           // ],
//         ),
//         child: TextField(
//           controller: widget.controller,
//           focusNode: _focusNode,
//           autofocus: widget.autoFocus,
//           textInputAction: TextInputAction.search,
//           onSubmitted: (value) => _onSearch(),
//           onChanged: widget.onChanged,
//           decoration: InputDecoration(
//             hintText: widget.hintText,
//             hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
//                   fontWeight: FontWeight.normal,
//                   color: AppColors.textSecondary,
//                 ),
//             // Ícone de pesquisa
//             prefixIcon: widget.showSearchIcon
//                 ? Padding(
//                     padding: const EdgeInsets.only(left: 16, right: 12),
//                     child: SvgPicture.asset(
//                       R.images.svgSearch,
//                       height: 24,
//                       width: 24,
//                       colorFilter: const ColorFilter.mode(
//                         AppColors.primaryColor,
//                         BlendMode.srcIn,
//                       ),
//                     ),
//                   )
//                 : null,
//             // Ícone de limpar
//             suffixIcon:
//                 widget.showClearButton && widget.controller.text.isNotEmpty
//                     ? AnimatedSwitcher(
//                         duration: Duration(milliseconds: 200),
//                         child: IconButton(
//                           key: ValueKey('clear'),
//                           icon: Icon(
//                             Icons.clear_rounded,
//                             color: Colors.grey[500],
//                             size: 20,
//                           ),
//                           onPressed: _onClear,
//                           splashRadius: 18,
//                           padding: EdgeInsets.only(right: 8),
//                         ),
//                       )
//                     : null,
//             // Bordas
//             // border: OutlineInputBorder(
//             //   borderRadius: BorderRadius.circular(widget.borderRadius),
//             //   borderSide: BorderSide.none,
//             // ),
//             // enabledBorder: OutlineInputBorder(
//             //   borderRadius: BorderRadius.circular(widget.borderRadius),
//             //   borderSide: BorderSide.none,
//             // ),
//             // // focusedBorder: OutlineInputBorder(
//             //   borderRadius: BorderRadius.circular(widget.borderRadius),
//             //   borderSide: BorderSide(
//             //     color: widget.accentColor.withOpacity(0.8),
//             //     width: 2.0,
//             //   ),
//             // ),
//             // Preenchimento
//             filled: true,
//             fillColor: Colors.transparent,
//             // Espaçamento
//             contentPadding: EdgeInsets.symmetric(
//               vertical: 2,
//               horizontal: widget.showSearchIcon ? 0 : 16,
//             ),
//             // Constraints para altura consistente
//             constraints: BoxConstraints(
//               minHeight: 50,
//             ),
//           ),
//           style: TextStyle(
//             color: Colors.grey[800],
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//           cursorColor: widget.accentColor,
//           cursorWidth: 2.0,
//           cursorHeight: 18,
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _focusNode.removeListener(_onFocusChange);
//     widget.controller.removeListener(_onTextChange);
//     _focusNode.dispose();
//     super.dispose();
//   }
// }
