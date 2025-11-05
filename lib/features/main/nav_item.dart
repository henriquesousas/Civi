import 'package:deehelp/app/theme/app_colors.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

import 'nav_menu.dart';

class NavItem extends StatefulWidget {
  final int index;
  final bool isSelected;
  final NavMenu item;
  final Function(int) onItemTapped;

  const NavItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onItemTapped,
    required this.index,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _scaleController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onItemTapped(widget.index),
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: widget.isSelected
              ? widget.item.color.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _scaleController,
              builder: (context, child) {
                final scale = widget.isSelected
                    ? 1.0 + (_scaleController.value * 0.1)
                    : 1.0;

                return Transform.scale(
                  scale: scale,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Container
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width:
                            widget.isSelected ? context.percentWidth(0.06) : 0,
                        height:
                            widget.isSelected ? context.percentHeight(0.04) : 0,
                        decoration: BoxDecoration(
                          color: widget.item.color.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Icon
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        child: Icon(
                          widget.isSelected
                              ? widget.item.activeIcon
                              : widget.item.icon,
                          key: ValueKey(
                              '${widget.item.label}_${widget.isSelected}'),
                          color: widget.isSelected
                              ? widget.item.color
                              : AppColors.textSecondary,
                          size: context.percentWidth(0.05),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            //Label
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: context.textSmall.copyWith(
                color: widget.isSelected
                    ? widget.item.color
                    : AppColors.textSecondary,
              ),
              child: Text(
                widget.item.label,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textSmall.copyWith(
                  fontWeight:
                      widget.isSelected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),

            // Active indicator dot
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              // margin: const EdgeInsets.only(top: 2),
              width: widget.isSelected ? 4 : 0,
              height: 4,
              decoration: BoxDecoration(
                color: widget.item.color,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
