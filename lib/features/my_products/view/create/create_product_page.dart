import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/theme/dimens.dart';
import 'package:deehelp/core/widgets/buttons/ui_elevated_button.dart';
import 'package:deehelp/core/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/my_products/view/create/create_product_cubit.dart';
import 'package:deehelp/features/my_products/view/create/steps/step_choose_type_product.dart';
import 'package:deehelp/features/my_products/view/create/steps/step_add_info_detal.dart';
import 'package:deehelp/features/my_products/view/create/steps/step_add_obs.dart';
import 'package:deehelp/features/my_products/view/create/steps/step_add_photo.dart';
import 'package:deehelp/features/my_products/view/create/state/create_product_state.dart';
import 'package:deehelp/features/my_products/view/create/steps/create_product_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({Key? key}) : super(key: key);

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageChangeListener);
    context.read<CreateProductCubit>().loadTypes();
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
  Widget build(BuildContext context) {
    return BlocConsumer<CreateProductCubit, CreateProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return UICustomScaffold(
          padding: EdgeInsets.zero,
          onBackButtonTap: () {
            if (_currentPage != 0) {
              _previousPage();
            } else {
              // controller.clearCreationData();
              // Get.back();
            }
          },
          pageTitle: "Criar novo produto",
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              if (index == 0) context.read<CreateProductCubit>().loadTypes();
            },
            children: [
              StepChooseTypeProduct(
                press: () => _nextPage(goToPage: 1),
              ),
              const CreateProductSteps()
            ],
          ),
        );
      },
    );
  }
}
