import 'package:animations/animations.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/features/profile/presentation/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'core/ui/assets/resources.dart';
import 'core/ui/theme/constants.dart';
import 'features/my_products/presentation/listing/listing_my_products_provider.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final List _pages = [
    // HomeView(),
    // MeusVeiculosPage(),
    // FaqProvider.page,
    // TestPage(),
    SizedBox(),
    SizedBox(),
    const ListingMyProductsProvider(),
    const ProfilePage(),
  ];
  int _currentIndex = 0;

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
                        : 1,
                  ),
          BlendMode.srcIn,
        ),
      );
    }

    return Scaffold(
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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent, // Remove o splash geral
          highlightColor: Colors.grey, // Remove o highlight geral
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            // selectedItemColor: AppColors.primaryColor,
            // type: BottomNavigationBarType.fixed,
            // showSelectedLabels: true,
            // showUnselectedLabels: true,
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.primaryColor,
          enableFeedback: false,
          onTap: (index) {
            if (index != _currentIndex) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: svgIcon(R.images.svgLocation),
              activeIcon: svgIcon(
                R.images.svgLocationActive,
                color: AppColors.primaryColor,
              ),
              label: "Explorar",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(R.images.svgOccurrenceInactive),
              activeIcon: svgIcon(
                R.images.svgOccurrenceActive,
                color: AppColors.primaryColor,
              ),
              label: "Ocorrencias",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(R.images.svgStatementInactive),
              activeIcon: svgIcon(R.images.svgStatementActive,
                  color: AppColors.primaryColor),
              label: "Meus bens",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(
                R.images.svgProfileInactive,
                color: AppColors.primaryColor,
              ),
              activeIcon: svgIcon(
                R.images.svgProfile,
                color: AppColors.primaryColor,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
