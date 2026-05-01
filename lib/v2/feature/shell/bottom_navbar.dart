import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/feature/shell/item_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = <ItemBottom>[
      const ItemBottom(
        icon: CupertinoIcons.rectangle_stack,
        activeIcon: CupertinoIcons.rectangle_stack_fill,
        label: 'Feed',
      ),
      const ItemBottom(
        icon: CupertinoIcons.map,
        activeIcon: CupertinoIcons.map_fill,
        label: 'Mapa',
      ),
      //
      const ItemBottom(
        icon: CupertinoIcons.largecircle_fill_circle,
        activeIcon: CupertinoIcons.largecircle_fill_circle,
        label: 'Denúnciar',
        isCenter: true,
      ),
      const ItemBottom(
        icon: CupertinoIcons.bell,
        activeIcon: CupertinoIcons.bell_fill,
        label: 'Mensagens',
      ),
      const ItemBottom(
        icon: CupertinoIcons.person_alt_circle,
        activeIcon: CupertinoIcons.person_alt_circle_fill,
        label: 'Perfil',
      ),
    ];

    return Container(
      height: 85.h,
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(color: Color(0xFF181818)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: List.generate(items.length, (index) {
            final item = items[index];
            final selected = currentIndex == index;

            return Expanded(
              child: InkWell(
                onTap: () => onTap(index),
                child: Column(
                  spacing: 6,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      selected ? item.activeIcon : item.icon,
                      color: selected ? Colors.white : Colors.white54,
                      size: SizeIcon.x,
                    ),
                    Text(
                      item.label,
                      style: context.appText.caption.copyWith(
                        color: selected ? Colors.white : Colors.white54,
                        fontWeight:
                            selected ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
