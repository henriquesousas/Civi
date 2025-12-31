import 'package:deehelp/core/base/base_page.dart';
import 'package:deehelp/features/products/presentation/views/add/steps/step_select_product_type.dart';
import 'package:deehelp/features/products/presentation/views/add/steps/add_product_steps_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddProductPage extends BasePage {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends BasePageState<AddProductPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageChangeListener);
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageChangeListener);
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage({int? goToPage}) {
    setState(() {
      _pageController.animateToPage(
        goToPage ?? ++_currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeIn,
      );
    });
  }

  void _previousPage({int? goToPage}) {
    setState(() {
      _pageController.animateToPage(
        goToPage ?? --_currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeIn,
      );
    });
  }

  void _pageChangeListener() {
    int newPage = _pageController.page?.round() ?? 0;
    if (newPage != _currentPage) {
      setState(() {
        _currentPage = newPage;
      });
    }
  }

  @override
  VoidCallback? onBackPress() {
    return () {
      if (_currentPage != 0) {
        _previousPage();
      } else {
        context.pop();
      }
    };
  }

  @override
  String? pageTitle() => "Novo bem";

  @override
  EdgeInsetsGeometry? padding() => EdgeInsets.zero;

  @override
  Widget buildPage(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (index) {},
      children: [
        StepSelectProductType(
          onContinue: () => _nextPage(goToPage: 1),
        ),
        const AddProductStepPage()
      ],
    );
  }
}
