import 'package:flutter/material.dart';

class PrimaryProgressIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPage;
  final Color? selectedColor;
  final Color? unselectedColor;
  const PrimaryProgressIndicator({
    super.key,
    required this.currentPage,
    required this.totalPage,
    this.selectedColor = Colors.white,
    this.unselectedColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPage,
        (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            margin: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            width: currentPage == index ? 32 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: currentPage == index ? selectedColor : unselectedColor,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        },
      ),
    );
  }
}
