import 'package:flutter/material.dart';

class TestBadgePage extends StatelessWidget {
  const TestBadgePage({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredBadges = [
      BadgeItem(
        title: 'Active\nStarter',
        icon: Icons.rocket_launch_rounded,
        color: const Color(0xFF3B82F6),
        unlocked: true,
      ),
      BadgeItem(
        title: 'High\nAchiever',
        icon: Icons.sports_football_rounded,
        color: const Color(0xFF3B82F6),
        unlocked: true,
      ),
      BadgeItem(
        title: 'Eager\nLearner',
        icon: Icons.menu_book_rounded,
        color: Colors.grey,
        unlocked: false,
      ),
      BadgeItem(
        title: 'Serious\nLearner',
        icon: Icons.gavel_rounded,
        color: Colors.grey,
        unlocked: false,
      ),
      BadgeItem(
        title: 'Confident\nReader',
        icon: Icons.flag_rounded,
        color: const Color(0xFF3B82F6),
        unlocked: true,
        isNew: true,
      ),
      BadgeItem(
        title: 'Error Police',
        icon: Icons.star_rounded,
        color: const Color(0xFF3B82F6),
        unlocked: true,
      ),
    ];

    final weeklyBadges = [
      BadgeItem(
        title: 'Hot Week',
        icon: Icons.local_fire_department_rounded,
        color: const Color(0xFFFACC15),
        unlocked: true,
        level: 1,
      ),
      BadgeItem(
        title: 'Super Week',
        icon: Icons.campaign_rounded,
        color: const Color(0xFFFACC15),
        unlocked: true,
        level: 2,
      ),
      BadgeItem(
        title: 'Super Week',
        icon: Icons.pets_rounded,
        color: Colors.grey,
        unlocked: false,
        level: 3,
        showProgress: true,
      ),
      BadgeItem(
        title: 'Champion',
        icon: Icons.cloud_rounded,
        color: Colors.grey,
        unlocked: false,
        level: 4,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            onPressed: () {},
            icon: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFF1A2234),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Badges',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            _buildSection(
              title: 'Featured',
              badges: featuredBadges,
            ),
            const SizedBox(height: 30),
            _buildSection(
              title: 'Weekly Achievement',
              badges: weeklyBadges,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<BadgeItem> badges,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        const SizedBox(height: 18),
        GridView.builder(
          itemCount: badges.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            return BadgeCard(item: badges[index]);
          },
        ),
      ],
    );
  }
}

class BadgeCard extends StatelessWidget {
  final BadgeItem item;

  const BadgeCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final isLocked = !item.unlocked;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF131B2E),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.04),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.22),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 6),
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: isLocked
                        ? [
                            const Color(0xFF3B4252),
                            const Color(0xFF2E3440),
                          ]
                        : [
                            item.color.withOpacity(0.25),
                            item.color.withOpacity(0.10),
                          ],
                  ),
                ),
                child: Icon(
                  item.icon,
                  size: 34,
                  color: isLocked ? Colors.grey.shade500 : item.color,
                ),
              ),
              const Spacer(),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.25,
                  fontWeight: FontWeight.w700,
                  color: isLocked ? Colors.grey.shade500 : Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              if (item.showProgress)
                Container(
                  width: double.infinity,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.55,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF8B5CF6),
                            Color(0xFFA855F7),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (item.isNew)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFF59E0B),
                      Color(0xFFFACC15),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'NEW',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          if (item.level != null)
            Positioned(
              bottom: 40,
              right: 0,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: item.unlocked
                      ? const Color(0xFF22C55E)
                      : Colors.grey.shade700,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '${item.level}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class BadgeItem {
  final String title;
  final IconData icon;
  final Color color;
  final bool unlocked;
  final bool isNew;
  final int? level;
  final bool showProgress;

  BadgeItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.unlocked,
    this.isNew = false,
    this.level,
    this.showProgress = false,
  });
}
