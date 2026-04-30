import 'package:deehelp/v2/core/extensions/theme_colors_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/feature/feed/domain/feed_post_fake_data.dart';
import 'package:deehelp/v2/feature/feed/presentation/widgets/feed_post_card.dart';
import 'package:deehelp/v2/feature/feed/presentation/widgets/silver_app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = posts;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            elevation: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: 64.h,
            titleSpacing: SizeLayoutSpacing.m,
            title: const SilverAppTitle(),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Divider(
                height: 1,
                thickness: 1,
                color: context.themeColor.outlineVariant,
              ),
            ),
          ),
          SliverList.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return FeedPostCard(post: data[index]);
            },
          )
        ],
      ),
    );
  }
}
