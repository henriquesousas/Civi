import 'package:animations/animations.dart';
import 'package:deehelp/core/components/test_page.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/occurrence/occurrence_page.dart';
import 'package:deehelp/features/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'core/resources/resources.dart';
import 'core/theme/constants.dart';
import 'features/product/presentation/listing/list_product_provider.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final List _pages = [
    // HomeView(),
    // MeusVeiculosPage(),
    TestPage(),
    OccurrencePage(),
    const ListProductProvider(),
    const ProfilePage(),
  ];
  int _currentIndex = 0;

  // String _geTitleTopBar() {
  //   if (_currentIndex == 1) {
  //     return "Meus Produtos";
  //   }
  //
  //   if (_currentIndex == 2) {
  //     return "Profile";
  //   }
  //   return "Explorar";
  // }

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
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w300),
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
              activeIcon:
                  svgIcon(R.images.svgLocation, color: AppColors.primaryColor),
              label: R.strings.bottomBarExplore,
            ),
            BottomNavigationBarItem(
              icon: svgIcon(R.images.svgCategory),
              activeIcon:
                  svgIcon(R.images.svgCategory, color: AppColors.primaryColor),
              label: R.strings.bottomBarOccurrence,
            ),
            BottomNavigationBarItem(
              icon: svgIcon(R.images.svgProduct),
              activeIcon:
                  svgIcon(R.images.svgProduct, color: AppColors.primaryColor),
              label: R.strings.bottomBarMyProducts,
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
