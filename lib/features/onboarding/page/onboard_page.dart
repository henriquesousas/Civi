import 'dart:async';

import 'package:deehelp/core/components/dialogs/dialog_extension.dart';
import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/dimens.dart';
import 'package:deehelp/core/widgets/buttons/ui_elevated_button.dart';
import 'package:deehelp/features/onboarding/page/components/onboard_content.dart';
import 'package:deehelp/features/onboarding/page/components/onboard_page_indicator.dart';
import 'package:deehelp/features/onboarding/page/onboard_cubit.dart';
import 'package:deehelp/features/onboarding/page/onboard_item.dart';
import 'package:deehelp/features/onboarding/page/onboard_view.dart';
import 'package:deehelp/features/onboarding/page/state/onboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources/resources.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  late PageController _pageController;
  Timer? _timer;
  int _currentPage = 1000;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scheduleChangePageAutomatically();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _scheduleChangePageAutomatically() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _currentPage++;
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
    _scheduleChangePageAutomatically();
  }

  void _loginWithGoogle() {
    context.read<OnboardCubit>().loginWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    final pages = OnboardItem.pages();
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                final realIndex = index % pages.length;
                final page = pages[realIndex];
                return OnboardContent(page: page);
              },
            ),
            BlocConsumer<OnboardCubit, OnboardState>(
              listener: (context, state) {
                state.maybeMap(
                  loginError: (value) {
                    context.showSnackBar(
                      type: DialogType.error,
                      "Não foi possível se autenticar com o google !",
                    );
                  },
                  loginSuccess: (value) {},
                  orElse: () => const SizedBox.shrink(),
                );
              },
              builder: (context, state) {
                return OnboardView(
                  currentPage: _currentPage % OnboardItem.pages().length,
                  pressLoginWithGoogle: () => _loginWithGoogle(),
                  pressEnterWithoutLogin: () => {
                    context.showSnackBar(
                      type: DialogType.success,
                      "Não foi possível se autenticar com o google!",
                    )
                  },
                  isLoading: false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
