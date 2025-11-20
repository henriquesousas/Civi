import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/features/profile/components/profile_box_decoration.dart';
import 'package:deehelp/features/profile/components/profile_menu_item_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/resources/resources.dart';

class ProfilePreferenceCard extends StatelessWidget {
  const ProfilePreferenceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            R.strings.preferences,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          ProfileBoxDecoration(
            child: Column(
              children: [
                ProfileMenuListTile(
                  text: R.strings.myProducts,
                  svgSrc: R.images.svgOrder,
                  press: () =>
                      context.push(RouterConstant.myItems, extra: true),
                ),
                ProfileMenuListTile(
                  text: R.strings.lastOccurrences,
                  svgSrc: R.images.svgLock,
                  press: () {},
                ),
                ProfileMenuListTile(
                  text: R.strings.favorites,
                  svgSrc: R.images.svgWishlist,
                  press: () {},
                ),
                ProfileMenuListTile(
                  text: R.strings.search,
                  svgSrc: R.images.svgSearch,
                  press: () {},
                  isShowDivider: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
