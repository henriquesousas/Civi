import 'package:flutter/material.dart';

class UIAppBarWithSearch extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool showSearchBar;
  final TextEditingController? searchController;
  final String? searchHintText;
  final VoidCallback? onFilterPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const UIAppBarWithSearch({
    super.key,
    this.title,
    this.actions,
    this.showSearchBar = false,
    this.searchController,
    this.searchHintText,
    this.onFilterPressed,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(
        showSearchBar ? 140 : 56,
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Título (opcional)
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: foregroundColor ?? Colors.white,
              ),
            )
          : null,

      // Design moderno
      // backgroundColor: backgroundColor ?? AppColors.primaryColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      foregroundColor: foregroundColor ?? Colors.white,
      elevation: 0,
      actions: actions ??
          (onFilterPressed != null
              ? [
                  IconButton(
                    icon: Icon(
                      Icons.filter_list_rounded,
                      size: 28,
                      color: foregroundColor,
                    ),
                    onPressed: onFilterPressed,
                    tooltip: 'Filtrar',
                  ),
                ]
              : null),

      // Search Bar no Bottom (opcional)
      bottom: showSearchBar
          ? PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: searchHintText ?? 'Pesquisar...',
                    prefixIcon:
                        Icon(Icons.search_rounded, color: Colors.blue[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          BorderSide(color: Colors.blue[300]!, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
