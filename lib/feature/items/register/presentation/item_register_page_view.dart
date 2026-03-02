import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/items/register/presentation/item_register_infomation.dart';
import 'package:deehelp/feature/items/register/presentation/item_register_photo.dart';
import 'package:deehelp/feature/items/register/presentation/item_register_type.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/wizard_bottom_bar.dart';
import 'package:deehelp/feature/items/register/viewmodel/add_product_state.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:deehelp/module/item/di/item_viewmodel_provider.dart';
import 'package:deehelp/old_core/ui/extensions/dialog_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum PageStep { item, info, photo }

class ItemRegisterPageView extends ConsumerStatefulWidget {
  const ItemRegisterPageView({super.key});

  @override
  ConsumerState<ItemRegisterPageView> createState() =>
      _ItemRegisterPageViewState();
}

class _ItemRegisterPageViewState extends ConsumerState<ItemRegisterPageView> {
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

  void _nextSpecificPage(WidgetRef ref, int goToPage) {
    _currentPage = goToPage;
    setState(() {
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    });
  }

  void _nextPage(WidgetRef ref, {int? goToPage}) {
    if (_currentPage == PageStep.info.index) {
      if (ref.watch(registerItemViewModelProvider).type == ItemType.phone) {
        final userId = ref.read(authenticatedUserProvider)!.id;
        ref.watch(registerItemViewModelProvider.notifier).save(userId);
        return;
      } else {
        ref.watch(registerItemViewModelProvider.notifier).validate();
        return;
      }
    }

    if (_currentPage == PageStep.photo.index) {
      final userId = ref.read(authenticatedUserProvider)!.id;
      ref.watch(registerItemViewModelProvider.notifier).save(userId);
      return;
    }

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

  void listener() {
    ref.listen<AddProductState>(
      registerItemViewModelProvider,
      (oldState, currentState) {
        if (oldState == currentState) return;
        if (currentState.isValidateApi) {
          ref.watch(registerItemViewModelProvider.notifier).reset();
          _nextSpecificPage(ref, 2);
        }
        if (currentState.isSuccess) {
          context.pushReplacement(ItemsRouter.success);
          return;
        }

        if (currentState.errorMessage != null &&
            oldState?.errorMessage != currentState.errorMessage) {
          context.showSnackBar(
            currentState.errorMessage!,
            type: DialogType.error,
          );
        }
      },
    );
  }

  bool _buttonState(AddProductState state) {
    if (_currentPage == PageStep.item.index) {
      return state.hasProductTypeSelected;
    }
    if (_currentPage == PageStep.info.index) {
      return state.stepAddProductInfoDetailValid ?? false;
    }

    if (_currentPage == PageStep.photo.index) {
      return state.stepAddPhotoValid;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerItemViewModelProvider);
    listener();
    return Scaffold(
      bottomNavigationBar: WizardBottomBar(
        step: _currentPage,
        loading: state.isLoading,
        press: _buttonState(state) ? () => _nextPage(ref) : null,
        nextLabel:
            (_currentPage == PageStep.photo.index ? 'Concluir' : 'Continuar'),
      ),
      appBar: DefaultAppBar(
        title: "Cadastrar",
        showBackButton: true,
        // leading: const Icon(Icons.close),
        press: () {
          if (_currentPage == 0) context.pop();
          if (_currentPage > 0) _previousPage();
        },
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {},
        children: const [
          ItemRegisterType(),
          ItemRegisterInfomation(),
          ItemRegisterPhoto(),
        ],
      ),
    );
  }
}
