import 'package:deehelp/v2/core/theme/app_colors.dart';
import 'package:deehelp/v2/feature/post/domain/feed_post_fake_data.dart';
import 'package:deehelp/v2/feature/post/widgets/feed_post_card.dart';
import 'package:deehelp/v2/feature/post/widgets/silver_app_title.dart';
import 'package:flutter/material.dart';

class FeedPostPage extends StatelessWidget {
  const FeedPostPage({super.key});

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
            toolbarHeight: 72,
            titleSpacing: 16,
            title: const SilverAppTitle(),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Divider(
                height: 1,
                thickness: 1,
                color: context.appColor.outlineVariant,
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
