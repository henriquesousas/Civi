import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yousafe/shared/components/buttons/secondary_outline_button.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/app/theme/size_config.dart';
import 'package:yousafe/app/localization/string_config.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';
import 'package:yousafe/app/router/router_config.dart';
import 'package:yousafe/features/profile/components/ui_card.dart';
import 'package:yousafe/features/profile/components/ui_card_switch.dart';
import 'package:yousafe/features/profile/components/ui_header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const personalItems = [
    {'title': StringConfig.myVehicles, 'route': Routes.terms},
    {'title': StringConfig.myOcorrences, 'route': Routes.terms},
    {'title': StringConfig.addAddress, 'route': Routes.terms},
    {'title': StringConfig.favourites, 'route': Routes.favorites},
  ];

  static const legalItems = [
    {'title': StringConfig.questions, 'route': Routes.faq},
    {'title': StringConfig.profileTerms, 'route': Routes.terms},
    {'title': StringConfig.privacyPolicy, 'route': Routes.privacyPolicy},
  ];

  @override
  Widget build(BuildContext context) {
    void navigate(List<Map<String, String>> items, int index) {
      final router = items[index]['route'] as String;
      context.push(router);
    }

    List<String> getItems(List<Map<String, String>> items) {
      return items.map((e) => e['title'] as String).toList();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(
            top: SizeConfig.padding10,
            left: SizeConfig.padding10,
            right: SizeConfig.padding10,
          ),
          child: Text(
            StringConfig.profile,
            style: context.getTextStyle.medium,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
          top: SizeConfig.padding24,
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: SizeConfig.height16,
            children: [
              GestureDetector(
                  onTap: () => context.push(Routes.myProfile),
                  child: UIHeader(fullName: StringConfig.fakeName)),
              UICard(
                titles: getItems(personalItems),
                onTap: (index) => navigate(personalItems, index),
              ),
              UICardSwitch(title: StringConfig.darkMode),
              UICard(
                titles: getItems(legalItems),
                onTap: (index) => navigate(legalItems, index),
              ),
              UICard(
                titles: [StringConfig.aboutUs],
                onTap: (item) => context.push(Routes.aboutUs),
              ),
              const SizedBox(height: SizeConfig.height08),
              SecondaryOutlineButton(
                text: StringConfig.logout,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
