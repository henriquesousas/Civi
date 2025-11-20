import 'package:animations/animations.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/itens/presentation/list/list_product_provider.dart';
import 'package:deehelp/features/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'core/resources/resources.dart';
import 'core/theme/constants.dart';
import 'features/home/home_view.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final List _pages = const [
    HomeView(),
    ListProductProvider(),
    ProfilePage(),
  ];
  int _currentIndex = 0;

  String _geTitleTopBar() {
    if (_currentIndex == 1) {
      return "Meus Produtos";
    }

    if (_currentIndex == 2) {
      return "Profile";
    }
    return "Explorar";
  }

  @override
  Widget build(BuildContext context) {
    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 24,
        colorFilter: ColorFilter.mode(
            color ??
                Theme.of(context).iconTheme.color!.withValues(
                    alpha: Theme.of(context).brightness == Brightness.dark
                        ? 0.3
                        : 1),
            BlendMode.srcIn),
      );
    }

    return Scaffold(
      // appBar: UIAppBar(
      //   title: _geTitleTopBar(),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: SvgPicture.asset(
      //         R.images.svgSearch,
      //         height: 24,
      //         colorFilter: ColorFilter.mode(
      //             Theme.of(context).textTheme.bodyLarge!.color!,
      //             BlendMode.srcIn),
      //       ),
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: SvgPicture.asset(
      //         R.images.svgNotification,
      //         height: 24,
      //         colorFilter: ColorFilter.mode(
      //             Theme.of(context).textTheme.bodyLarge!.color!,
      //             BlendMode.srcIn),
      //       ),
      //     ),
      //   ],
      // ),
      body: PageTransitionSwitcher(
        duration: defaultDuration,
        transitionBuilder: (child, animation, secondAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondAnimation,
            child: child,
          );
        },
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: defaultPadding / 2),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF101015),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index != _currentIndex) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : const Color(0xFF101015),
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          selectedFontSize: 13,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.transparent,
          enableFeedback: true,
          items: [
            BottomNavigationBarItem(
              icon: svgIcon(R.images.svgCategory),
              activeIcon:
                  svgIcon(R.images.svgCategory, color: AppColors.primaryColor),
              label: R.strings.bottomBarHome,
            ),
            BottomNavigationBarItem(
              icon: svgIcon(R.images.svgOrder),
              activeIcon:
                  svgIcon(R.images.svgOrder, color: AppColors.primaryColor),
              label: R.strings.myProducts,
            ),
            BottomNavigationBarItem(
              icon: svgIcon(R.images.svgProfile),
              activeIcon:
                  svgIcon(R.images.svgProfile, color: AppColors.primaryColor),
              label: R.strings.bottomBarProfile,
            ),
          ],
        ),
      ),
    );
  }
}
