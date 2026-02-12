import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/feature/items/register/item_register_infomation.dart';
import 'package:deehelp/feature/items/register/item_register_photo.dart';
import 'package:deehelp/feature/items/register/item_register_type.dart';
import 'package:deehelp/feature/items/register/widgets/wizard_bottom_bar.dart';
import 'package:flutter/material.dart';

class ItemRegisterPageView extends StatefulWidget {
  const ItemRegisterPageView({super.key});

  @override
  State<ItemRegisterPageView> createState() => _ItemRegisterPageViewState();
}

class _ItemRegisterPageViewState extends State<ItemRegisterPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage({int? goToPage}) {
    final page = goToPage ?? ++_currentPage;
    setState(() {
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    });
  }

  void _previousPage({int? goToPage}) {
    final page = goToPage ?? --_currentPage;
    setState(() {
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: WizardBottomBar(
        step: _currentPage,
        loading: false,
        press: false ? null : _nextPage,
        nextLabel: _currentPage == 1
            ? 'Cadastrar item'
            : (_currentPage == 2 ? 'Concluir' : 'Continuar'),
      ),
      appBar: DefaultAppBar(
        title: "Cadastrar",
        // leading: const Icon(Icons.close),
        press: () {
          if (_currentPage > 0) {
            _previousPage();
          }
        },
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {},
        children: [
          ItemRegisterType(press: () => _nextPage()),
          ItemRegisterInfomation(press: () => _nextPage()),
          ItemRegisterPhoto(),
        ],
      ),
    );
  }
}
