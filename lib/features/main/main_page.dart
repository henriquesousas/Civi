import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/features/main/state/bottom_navigation_bloc.dart';
import 'package:yousafe/features/main/state/bottom_navigation_event.dart';
import 'package:yousafe/features/main/state/bottom_navigation_state.dart';
import 'package:yousafe/shared/extensions/screen_size_extension.dart';

import 'nav_item.dart';
import 'nav_menu.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: IndexedStack(
            index: state.selectedIndex,
            children: state.pages,
          ),
          bottomNavigationBar: state.showBottomBar
              ? Container(
                  margin: const EdgeInsets.all(20),
                  height: context.percentHeight(0.11),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                    child: Container(
                      height: 70,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: NavMenu.getNavigationItems
                              .asMap()
                              .entries
                              .map((entry) {
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
                          }).toList()),
                    ),
                  ),
                )
              : const SizedBox(),
        );
      },
    );
  }
}
