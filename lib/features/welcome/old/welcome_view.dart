import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yousafe/app/router/router_config.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/app/theme/size_config.dart';
import 'package:yousafe/features/welcome/old/components/ui_footer.dart';
import 'package:yousafe/features/welcome/old/components/ui_page_view_section.dart';
import 'package:yousafe/features/welcome/old/state/welcome_bloc.dart';
import 'package:yousafe/features/welcome/old/state/welcome_events.dart';
import 'package:yousafe/features/welcome/old/state/welcome_state.dart';
import 'package:yousafe/features/welcome/old/welcome.dart';

class WelcomeView extends StatelessWidget {
  final Welcome welcome;
  const WelcomeView({super.key, required this.welcome});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    void navigateLogin() {
      context.push(Routes.profile);
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
          backgroundColor: AppColors.backgroundColor,
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
