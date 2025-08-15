import 'package:flutter/widgets.dart';

class BottomNavigationState {
  final int selectedIndex;
  final bool showBottomBar;
  final List<Widget> pages;

  BottomNavigationState({
    required this.selectedIndex,
    required this.showBottomBar,
    required this.pages,
  });

  BottomNavigationState copyWith({
    int? selectedIndex,
    bool? showBottomBar,
    List<Widget>? pages,
  }) {
    return BottomNavigationState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      showBottomBar: showBottomBar ?? this.showBottomBar,
      pages: pages ?? this.pages,
    );
  }
}
