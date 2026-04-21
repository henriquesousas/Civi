import 'package:deehelp/v2/core/widgets/image/app_network_image.dart';
import 'package:deehelp/v2/feature/feed/domain/feed_post.dart';
import 'package:flutter/material.dart';

class FeedImagePreview extends StatelessWidget {
  final FeedPost post;

  const FeedImagePreview({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppNetworkImage(imageUrl: post.imageUrl)
        // if (post.isVideo)
        //   Positioned(
        //     top: 12,
        //     right: 12,
        //     child: Container(
        //       width: 42,
        //       height: 42,
        //       decoration: BoxDecoration(
        //         color: Colors.black.withOpacity(.45),
        //         shape: BoxShape.circle,
        //       ),
        //       child: const Icon(
        //         Icons.volume_off,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // if (post.showCarouselDots)
        //   Positioned(
        //     bottom: 16,
        //     left: 0,
        //     right: 0,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: List.generate(5, (index) {
        //         final bool isActive = index == 0;
        //         return Container(
        //           margin: const EdgeInsets.symmetric(horizontal: 4),
        //           width: isActive ? 10 : 8,
        //           height: isActive ? 10 : 8,
        //           decoration: BoxDecoration(
        //             color: isActive ? Colors.white : Colors.white38,
        //             shape: BoxShape.circle,
        //           ),
        //         );
        //       }),
        //     ),
        //   ),
      ],
    );
  }
}
