import 'package:deehelp/app/theme/app_colors_v2.dart';
import 'package:deehelp/app/theme/size_config.dart';
import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/features/welcome/old/components/ui_footer.dart';
import 'package:deehelp/features/welcome/old/components/ui_page_view_section.dart';
import 'package:deehelp/features/welcome/old/state/welcome_bloc.dart';
import 'package:deehelp/features/welcome/old/state/welcome_events.dart';
import 'package:deehelp/features/welcome/old/state/welcome_state.dart';
import 'package:deehelp/features/welcome/old/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WelcomeView extends StatelessWidget {
  final Welcome welcome;
  const WelcomeView({super.key, required this.welcome});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    void navigateLogin() {
      context.push(RouterConstant.profile);
    }

    void navigatePage(int page) {
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (ctx, state) {
        return Scaffold(
          backgroundColor: AppColorsV2.backgroundColor,
          bottomNavigationBar: UIFooter(
            onTap: () {
              final currentPage = state.page;
              final nextPage = currentPage + 1;
              final isLastPage = currentPage == Welcome.getPages.length - 1;

              isLastPage ? navigateLogin() : navigatePage(nextPage);
            },
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: SizeConfig.padding24,
              right: SizeConfig.padding24,
              bottom: SizeConfig.padding30,
              top: SizeConfig.padding59,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // UIHeader(),
                UIPageViewSection(
                  pageController: pageController,
                  welcome: welcome,
                  onPageChanged: (index) {
                    context.read<WelcomeBloc>().add(PageChangedEvent(index));
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
