import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/features/bottom_view/state/bottom_navigation_bloc.dart';
import 'package:yousafe/features/bottom_view/state/bottom_navigation_state.dart';
import 'package:yousafe/features/bottom_view/components/ui_bottom_navigation_bar.dart';

class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({super.key});

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
              ? UIBottomNavigationBar(state: state)
              : const SizedBox(),
        );
      },
    );
  }
}
