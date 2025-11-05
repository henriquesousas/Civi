import 'package:deehelp/app/theme/app_colors.dart';
import 'package:deehelp/features/main/state/bottom_navigation_bloc.dart';
import 'package:deehelp/features/main/state/bottom_navigation_event.dart';
import 'package:deehelp/features/main/state/bottom_navigation_state.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'nav_item.dart';
import 'nav_menu.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        // Tela inicial (index 0 → mapa com bottom bar flutuante)
        if (state.selectedIndex == 0) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                /// Páginas
                IndexedStack(
                  index: state.selectedIndex,
                  children: state.pages,
                ),

                /// Bottom bar flutuante
                if (state.showBottomBar)
                  Positioned(
                    left: 1,
                    right: 1,
                    bottom: 2,
                    child: _buildBottomBar(
                      context,
                      state,
                      translucent: true,
                    ), // versão translúcida
                  ),
              ],
            ),
          );
        }

        // Outras telas (index != 0 → bottom bar padrão do Scaffold)
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: IndexedStack(
            index: state.selectedIndex,
            children: state.pages,
          ),
          bottomNavigationBar: state.showBottomBar
              ? _buildBottomBar(context, state, translucent: false)
              : const SizedBox(),
        );
      },
    );
  }

  Widget _buildBottomBar(BuildContext context, BottomNavigationState state,
      {required bool translucent}) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: context.percentHeight(0.09),
        decoration: BoxDecoration(
          color:
              translucent ? Colors.white.withValues(alpha: 0.9) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              offset: const Offset(0, 8),
              blurRadius: 32,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.1),
              offset: const Offset(0, 4),
              blurRadius: 16,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: NavMenu.getNavigationItems.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = index == state.selectedIndex;
              return Expanded(
                child: NavItem(
                  item: item,
                  index: index,
                  isSelected: isSelected,
                  onItemTapped: (index) => context
                      .read<BottomNavigationBloc>()
                      .add(ChangePageEvent(index)),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
