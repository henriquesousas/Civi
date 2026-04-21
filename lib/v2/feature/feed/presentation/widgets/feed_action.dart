import 'package:deehelp/v2/feature/feed/domain/feed_post.dart';
import 'package:deehelp/v2/feature/feed/presentation/widgets/action_tile.dart';
import 'package:deehelp/v2/feature/feed/presentation/widgets/share_icon.dart';
import 'package:flutter/material.dart';

class FeedAction extends StatelessWidget {
  final FeedPost post;
  const FeedAction({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 18,
      children: [
        ActionTile(
          icon: Icons.remove_red_eye_outlined,
          title: post.views,
        ),
        ActionTile(
          icon: Icons.mode_comment_outlined,
          title: '${post.comments}',
        ),
        const Spacer(),
        const ShareIcon(),
      ],
    );
  }
}
