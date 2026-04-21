import 'package:flutter/material.dart';

class TestPost extends StatefulWidget {
  const TestPost({super.key});

  @override
  State<TestPost> createState() => _TestPostState();
}

class _TestPostState extends State<TestPost> {
  int currentIndex = 0;

  final List<FeedPostOld> posts = [
    FeedPostOld(
      author: 'Nationwide',
      title: 'Escaped Prisoner Near Playground',
      timeAgo: '3 hours',
      location: 'Corona, New York',
      distance: '4766.5 mi',
      description:
          'Police are actively searching for an escaped prisoner in Corona, New York, last seen wearing an orange outfit.',
      views: '30.2K',
      videos: 3,
      audios: 2,
      comments: 82,
      imageUrl:
          'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?q=80&w=1200&auto=format&fit=crop',
      isVideo: true,
      showCarouselDots: true,
    ),
    FeedPostOld(
      author: 'newyorkUser2253570007',
      title: 'Fire on 16th Floor of Building',
      timeAgo: '2 hours',
      location: 'New York, New York',
      distance: '4771.7 mi',
      description:
          'Firefighters responded to a fire on the 16th floor of a building at 2400 2nd Ave in New York, with reports of smoke and road blockage in the area.',
      views: '17.5K',
      videos: 12,
      audios: 4,
      comments: 30,
      imageUrl:
          'https://images.unsplash.com/photo-1519003722824-194d4455a60c?q=80&w=1200&auto=format&fit=crop',
      isVideo: false,
      showCarouselDots: false,
    ),
    FeedPostOld(
      author: 'communityReporter',
      title: 'Road Blocked After Crash',
      timeAgo: '1 hour',
      location: 'Brooklyn, New York',
      distance: '4770.1 mi',
      description:
          'Traffic is being diverted after a collision involving two vehicles. Avoid the area and use alternative routes.',
      views: '9.3K',
      videos: 1,
      audios: 0,
      comments: 14,
      imageUrl:
          'https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=1200&auto=format&fit=crop',
      isVideo: false,
      showCarouselDots: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            floating: false,
            elevation: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: 72,
            titleSpacing: 16,
            title: Row(
              children: [
                const Icon(Icons.public, color: Colors.white, size: 24),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Nationwide',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Past 24h',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Color(0xFF1B1B1B),
              ),
            ),
          ),
          SliverList.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return FeedPostCard(post: posts[index]);
            },
          ),
        ],
      ),
      bottomNavigationBar: _BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
      ),
    );
  }
}

class FeedPostOld {
  final String author;
  final String title;
  final String timeAgo;
  final String location;
  final String distance;
  final String description;
  final String views;
  final int videos;
  final int audios;
  final int comments;
  final String imageUrl;
  final bool isVideo;
  final bool showCarouselDots;

  FeedPostOld({
    required this.author,
    required this.title,
    required this.timeAgo,
    required this.location,
    required this.distance,
    required this.description,
    required this.views,
    required this.videos,
    required this.audios,
    required this.comments,
    required this.imageUrl,
    required this.isVideo,
    required this.showCarouselDots,
  });
}

class FeedPostCard extends StatelessWidget {
  final FeedPostOld post;

  const FeedPostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (post.author != 'Nationwide') ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: const Color(0xFF7A5A3A),
                    child: const Icon(
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
            ),
          ],
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Text(
              post.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                height: 1.12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Text(
              '${post.timeAgo} · ${post.location} · ${post.distance}',
              style: const TextStyle(
                color: Color(0xFF9C9C9C),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Text(
              post.description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.3,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Row(
              children: [
                const Icon(Icons.remove_red_eye_outlined,
                    size: 18, color: Color(0xFFB3B3B3)),
                const SizedBox(width: 4),
                Text(
                  post.views,
                  style: const TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 18),
                const Icon(Icons.videocam_outlined,
                    size: 18, color: Color(0xFFB3B3B3)),
                const SizedBox(width: 4),
                Text(
                  '${post.videos}',
                  style: const TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 18),
                const Icon(Icons.graphic_eq,
                    size: 18, color: Color(0xFFB3B3B3)),
                const SizedBox(width: 4),
                Text(
                  '${post.audios}',
                  style: const TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 18),
                const Icon(Icons.mode_comment_outlined,
                    size: 18, color: Color(0xFFB3B3B3)),
                const SizedBox(width: 4),
                Text(
                  '${post.comments}',
                  style: const TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 13,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.reply, size: 20, color: Colors.white),
                const SizedBox(width: 6),
                const Text(
                  'Share',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          _MediaPreview(post: post),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFF101010),
          ),
        ],
      ),
    );
  }
}

class _MediaPreview extends StatelessWidget {
  final FeedPostOld post;

  const _MediaPreview({required this.post});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            post.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (_, __, ___) {
              return Container(
                color: const Color(0xFF1B1B1B),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.white54,
                  size: 40,
                ),
              );
            },
          ),
        ),
        if (post.isVideo)
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.45),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.volume_off,
                color: Colors.white,
              ),
            ),
          ),
        if (post.showCarouselDots)
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final bool isActive = index == 0;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 10 : 8,
                  height: isActive ? 10 : 8,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.white : Colors.white38,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _BottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = <_BottomNavItemData>[
      const _BottomNavItemData(
        icon: Icons.public,
        label: 'News',
      ),
      const _BottomNavItemData(
        icon: Icons.navigation_outlined,
        label: 'Home',
      ),
      const _BottomNavItemData(
        icon: Icons.crop_square_outlined,
        label: 'Go Live',
        isCenter: true,
      ),
      const _BottomNavItemData(
        icon: Icons.notifications_none,
        label: 'Alerts',
      ),
      const _BottomNavItemData(
        icon: Icons.person_outline,
        label: 'Profile',
      ),
    ];

    return Container(
      height: 86,
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(color: Color(0xFF1B1B1B)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: List.generate(items.length, (index) {
            final item = items[index];
            final selected = currentIndex == index;

            return Expanded(
              child: InkWell(
                onTap: () => onTap(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (item.isCenter)
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selected ? Colors.white : Colors.white54,
                            width: 1.4,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          item.icon,
                          color: selected ? Colors.white : Colors.white54,
                          size: 20,
                        ),
                      )
                    else
                      Icon(
                        item.icon,
                        color: selected ? Colors.white : Colors.white54,
                        size: 28,
                      ),
                    const SizedBox(height: 6),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: selected ? Colors.white : Colors.white54,
                        fontSize: 12,
                        fontWeight:
                            selected ? FontWeight.w500 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _BottomNavItemData {
  final IconData icon;
  final String label;
  final bool isCenter;

  const _BottomNavItemData({
    required this.icon,
    required this.label,
    this.isCenter = false,
  });
}
