import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/dimens.dart';
import 'package:deehelp/core/widgets/buttons/ui_elevated_button.dart';
import 'package:deehelp/core/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/core/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/my_products/view/create/create_product_step_choose_type_page.dart';
import 'package:deehelp/features/my_products/view/create/header_text_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/text-field/ui_text_field_rounded.dart';

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
        children: [
          CreateProductStepChooseTypePage(
            press: () => _nextPage(goToPage: 1),
          ),
          _buildForm(),
        ],
      ),
    );
  }

  WidgetStateColor _connectoControls() {
    return WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      }
      if (states.contains(WidgetState.disabled)) {
        return AppColors.primaryColor.withValues(alpha: 0.5);
      }
      return AppColors.lightGreyColor20;
    });
  }

  void _onStepCancel() {
    // if (controller.currentStep > 0) {
    //   controller.setCurrentStep(
    //     controller.currentStep - 1,
    //     steps.length,
    //   );
    // }
  }

  Widget _controlsBuilder(BuildContext context, ControlsDetails details) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          // controller.currentStep > 0
          if (true)
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  end: 16,
                ),
                child: UIElevatedButton(
                  radius: Dimens.defaultRadius,
                  borderColor: AppColors.lightGreyColor20,
                  bgColor: AppColors.whiteColor,
                  textColor: AppColors.textColorBody,
                  text: "Previous",
                  onTap: details.onStepCancel ?? () {},
                ),
              ),
            ),
          Expanded(
            child: UIElevatedButton(
              radius: Dimens.defaultRadius,
              bgColor: AppColors.primaryColor,
              text: "Confirm",
              // text: controller.currentStep == steps.length - 1
              //     ? MyStrings.confirm
              //     : MyStrings.next,
              // isLoading: controller.currentStep == steps.length - 1
              //     ? controller.isCardCreateLoadings
              //     : false,
              isLoading: false,
              onTap: details.onStepContinue ?? () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _formDetails() {
    return UICustomAppCard(
      child: Column(
        children: [
          HeaderTextCard(
            header: "sasasas",
            text: "sasasas",
          ),
          UITextFieldRounded(
            isRequired: true,
            showLabelText: false,
            instructions: "Instruction",
            labelText: "label",
            hintText: "hint",
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              // controller.selectedCardHolder?.name = value;
            },
            validator: (value) {
              // controller.selectedCardHolder?.name = value;
              // if (value.toString().trim().isEmpty) {
              //   return MyStrings.kNameNullError.tr;
              // } else {
              //   return null;
              // }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    final steps = [
      Step(
        title: Text("sasas"),
        content: _formDetails(),
      ),
      Step(
        title: Text("sasas"),
        content: Column(
          children: [
            Text("2 dsadsasas "),
            Text("2 dsadsasas"),
            Text("2 dsadsasas"),
          ],
        ),
      ),
    ];
    return Column(
      children: [
        Expanded(
          child: Stepper(
            connectorColor: _connectoControls(),
            onStepCancel: () => _onStepCancel(),
            controlsBuilder: (context, details) =>
                _controlsBuilder(context, details),
            type: StepperType.vertical,
            currentStep: 0,
            steps: steps,
          ),
        )
      ],
    );
  }
}
