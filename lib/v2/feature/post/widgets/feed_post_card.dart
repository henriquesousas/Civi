import 'package:deehelp/v2/core/extensions/text_extension.dart';
import 'package:deehelp/v2/core/theme/app_colors.dart';
import 'package:deehelp/v2/core/theme/size_spacing.dart';
import 'package:deehelp/v2/feature/post/domain/feed_post.dart';
import 'package:deehelp/v2/feature/post/widgets/feed_action.dart';
import 'package:deehelp/v2/feature/post/widgets/feed_image_preview.dart';
import 'package:flutter/material.dart';

class FeedPostCard extends StatelessWidget {
  final FeedPost post;

  const FeedPostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              if (post.author != 'Nationwide') ...[
                const SizedBox(height: SizeSpacing.xxs),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      backgroundColor: Color(0xFF7A5A3A),
                      child: Icon(
                        Icons.person,
                        size: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      post.author,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: SizeSpacing.xxs)
              ],
              Text(
                post.title,
                style: context.appText.header
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              Text(
                '${post.timeAgo} · ${post.location} · ${post.distance}',
                style: context.appText.caption.copyWith(
                  color: context.appColor.secundaryTextColor,
                ),
              ),
              Text(
                post.description,
                style: context.appText.subtitle,
              ),
              const SizedBox(height: SizeSpacing.s),
              FeedAction(post: post),
              const SizedBox(height: SizeSpacing.s),
            ],
          ),
        ),
        // AppNetworkImage(imageUrl: post.imageUrl),
        FeedImagePreview(post: post),
        Divider(
          height: 1,
          thickness: 1,
          color: context.appColor.outline,
        ),
      ],
    );
  }
}
