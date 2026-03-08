import 'package:flutter/material.dart';

class CardBottom extends StatelessWidget {
  const CardBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          height: 170,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              MeetupMiniCard(
                organizer: 'Datadog User Group',
                title: 'Meetup São Paulo',
                subtitle: 'qui., mar. 20 • 18:30\npor Datadog User Gro...',
                groupAvatarUrl: 'https://i.pravatar.cc/100?img=11',
                coverImageUrl:
                    'https://images.unsplash.com/photo-1511578314322-379afb476865?w=400',
                participants: 93,
                participantAvatarUrls: [
                  'https://i.pravatar.cc/100?img=1',
                  'https://i.pravatar.cc/100?img=2',
                  'https://i.pravatar.cc/100?img=3',
                ],
              ),
              MeetupMiniCard(
                organizer: 'Datadog User Group',
                title: 'Meetup São Paulo',
                subtitle: 'qui., mar. 20 • 18:30\npor Datadog User Gro...',
                groupAvatarUrl: 'https://i.pravatar.cc/100?img=11',
                coverImageUrl:
                    'https://images.unsplash.com/photo-1511578314322-379afb476865?w=400',
                participants: 93,
                participantAvatarUrls: [
                  'https://i.pravatar.cc/100?img=1',
                  'https://i.pravatar.cc/100?img=2',
                  'https://i.pravatar.cc/100?img=3',
                ],
              ),
              MeetupMiniCard(
                organizer: 'Datadog User Group',
                title: 'Meetup São Paulo',
                subtitle: 'qui., mar. 20 • 18:30\npor Datadog User Gro...',
                groupAvatarUrl: 'https://i.pravatar.cc/100?img=11',
                coverImageUrl:
                    'https://images.unsplash.com/photo-1511578314322-379afb476865?w=400',
                participants: 93,
                participantAvatarUrls: [
                  'https://i.pravatar.cc/100?img=1',
                  'https://i.pravatar.cc/100?img=2',
                  'https://i.pravatar.cc/100?img=3',
                ],
              ),
              MeetupMiniCard(
                organizer: 'Datadog User Group',
                title: 'Meetup São Paulo',
                subtitle: 'qui., mar. 20 • 18:30\npor Datadog User Gro...',
                groupAvatarUrl: 'https://i.pravatar.cc/100?img=11',
                coverImageUrl:
                    'https://images.unsplash.com/photo-1511578314322-379afb476865?w=400',
                participants: 93,
                participantAvatarUrls: [
                  'https://i.pravatar.cc/100?img=1',
                  'https://i.pravatar.cc/100?img=2',
                  'https://i.pravatar.cc/100?img=3',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MeetupMiniCard extends StatelessWidget {
  final String organizer;
  final String title;
  final String subtitle;
  final String groupAvatarUrl;
  final String coverImageUrl;
  final int participants;
  final List<String> participantAvatarUrls;
  final VoidCallback? onTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onBookmarkTap;

  const MeetupMiniCard({
    super.key,
    required this.organizer,
    required this.title,
    required this.subtitle,
    required this.groupAvatarUrl,
    required this.coverImageUrl,
    required this.participants,
    required this.participantAvatarUrls,
    this.onTap,
    this.onShareTap,
    this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xFFE9E9EE),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// topo
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(groupAvatarUrl),
                  backgroundColor: const Color(0xFFF2F2F7),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      organizer,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6B7280),
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    coverImageUrl,
                    width: 66,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// titulo
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
                height: 1.2,
              ),
            ),

            const SizedBox(height: 4),

            /// subtitulo
            Text(
              subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11.5,
                color: Color(0xFF9CA3AF),
                height: 1.3,
              ),
            ),

            const Spacer(),

            /// rodape
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _ParticipantsStack(
                        avatarUrls: participantAvatarUrls,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          '$participants participantes',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11.5,
                            color: Color(0xFF6B7280),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _MiniActionButton(
                  icon: Icons.upload_outlined,
                  onTap: onShareTap,
                ),
                const SizedBox(width: 6),
                _MiniActionButton(
                  icon: Icons.bookmark_border_rounded,
                  onTap: onBookmarkTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ParticipantsStack extends StatelessWidget {
  final List<String> avatarUrls;

  const _ParticipantsStack({
    required this.avatarUrls,
  });

  @override
  Widget build(BuildContext context) {
    final items = avatarUrls.take(3).toList();

    return SizedBox(
      width: 46,
      height: 20,
      child: Stack(
        clipBehavior: Clip.none,
        children: List.generate(items.length, (index) {
          return Positioned(
            left: index * 12,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.6),
              ),
              child: CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(items[index]),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _MiniActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _MiniActionButton({
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Icon(
          icon,
          size: 18,
          color: const Color(0xFF6B7280),
        ),
      ),
    );
  }
}
