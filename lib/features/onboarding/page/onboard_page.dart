import 'dart:async';

import 'package:deehelp/core/providers/view_models_provider.dart';
import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/ui/extensions/dialog_extension.dart';
import 'package:deehelp/features/auth/domain/services/operation_status.dart';
import 'package:deehelp/features/auth/presentation/state/auth_state.dart';
import 'package:deehelp/features/onboarding/page/components/onboard_content.dart';
import 'package:deehelp/features/onboarding/page/onboard_item.dart';
import 'package:deehelp/features/onboarding/page/onboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnboardPage extends ConsumerStatefulWidget {
  const OnboardPage({super.key});

  @override
  ConsumerState<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends ConsumerState<OnboardPage> {
  late PageController _pageController;
  Timer? _timer;
  int _currentPage = 1000;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _taskChangePage();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _taskChangePage() {
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
    _taskChangePage();
  }

  void _loginWithGoogle() {
    ref.watch(authViewViewModelProvider.notifier).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authViewViewModelProvider);
    final pages = OnboardItem.pages();

    listeners();

    return Scaffold(
      body: Stack(
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
          state.maybeWhen(
            loading: () => _buildView(isLoading: true),
            orElse: () => _buildView(),
          ),
        ],
      ),
    );
  }

  void listeners() {
    ref.listen<AuthState>(
      authViewViewModelProvider,
      (previousState, currentState) {
        if (currentState is AuthStateError &&
            previousState is! AuthStateError) {
          if (currentState.status != OperationStatus.canceled) {
            context.showSnackBar(
              type: DialogType.error,
              currentState.error,
            );
          }
        }

        if (currentState is AuthStateAuthenticated) {
          context.push(
            RouterConstant.addNickname,
            extra: currentState.userName,
          );
        }
      },
    );
  }

  Widget _buildView({bool isLoading = false}) {
    return OnboardView(
      currentPage: _currentPage % OnboardItem.pages().length,
      pressLoginWithGoogle: () => _loginWithGoogle(),
      pressEnterWithoutLogin: () {},
      isLoading: isLoading,
    );
  }
}
