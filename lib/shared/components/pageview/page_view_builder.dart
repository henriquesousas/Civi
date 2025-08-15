import 'package:flutter/material.dart';

class PageViewBuilder extends StatefulWidget {
  // final PageController? pageController;
  final ValueChanged<int>? onPageChanged;
  final Widget? Function(
    BuildContext context,
    int index,
    PageController controller,
  ) itemBuilder;
  final int itemCount;
  final int initialPage;
  const PageViewBuilder(
      {super.key,
      this.onPageChanged,
      required this.itemCount,
      required this.itemBuilder,
      required this.initialPage});

  @override
  State<PageViewBuilder> createState() => _PageViewBuilderState();
}

class _PageViewBuilderState extends State<PageViewBuilder> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: widget.onPageChanged,
      itemCount: widget.itemCount,
      itemBuilder: (context, index) {
        return widget.itemBuilder(context, index, _pageController);
      },
    );
  }
}
