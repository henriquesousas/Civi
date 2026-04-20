import 'package:flutter/material.dart';

class TestMapa extends StatefulWidget {
  const TestMapa({super.key});

  @override
  State<TestMapa> createState() => _TestMapaState();
}

class _TestMapaState extends State<TestMapa> {
  int currentIndex = 1;

  final List<IncidentItem> incidents = [
    IncidentItem(
      distance: '4770.1 mi',
      place: 'Times Square - 42 St Station',
      title: 'Report of Man Armed With Knife at Times Square Station',
      description:
          'Police have received a report of a man possibly armed with a knife at Times Square Station on the northbound 1, 2, and 3 lines.',
      updatedAt: 'Updated 1h ago',
      views: '237 views',
      icon: '🔪',
    ),
    IncidentItem(
      distance: '4770.1 mi',
      place: 'Times Square-42 St Station',
      title: 'Person Dropped Phone on Train Tracks',
      description:
          'Transit staff responded after a passenger reported dropping a phone onto the tracks near the platform edge.',
      updatedAt: 'Updated 2h ago',
      views: '102 views',
      icon: '📱',
    ),
    IncidentItem(
      distance: '4771.0 mi',
      place: 'Garment District',
      title: 'Fire Reported Near Intersection',
      description:
          'Crews were dispatched to investigate smoke seen coming from a commercial building in the Garment District.',
      updatedAt: 'Updated 3h ago',
      views: '421 views',
      icon: '🔥',
    ),
    IncidentItem(
      distance: '4769.8 mi',
      place: 'Penn Station',
      title: 'Suspicious Activity Report',
      description:
          'Police are investigating suspicious behavior reported by commuters near an entrance to Penn Station.',
      updatedAt: 'Updated 4h ago',
      views: '188 views',
      icon: '⚠️',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavHeight = 92.0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const _FakeMapBackground(),
          // const _TopOverlayBar(),
          Positioned(
            right: 16,
            top: 170,
            child: Column(
              children: [
                _MapFloatingButton(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.circle, color: Colors.red, size: 16),
                      SizedBox(height: 8),
                      Icon(Icons.circle, color: Colors.red, size: 16),
                      SizedBox(height: 8),
                      Icon(Icons.keyboard_arrow_down,
                          color: Colors.white, size: 24),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                _MapFloatingButton(
                  child: const Icon(Icons.my_location,
                      color: Colors.black, size: 22),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
          const IncidentsTopBar(),
          DraggableScrollableSheet(
            initialChildSize: 0.26,
            minChildSize: 0.18,
            maxChildSize: 0.82,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 20,
                      offset: Offset(0, -4),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 52,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: EdgeInsets.only(
                          left: 0,
                          right: 0,
                          bottom: bottomNavHeight + 20,
                        ),
                        children: [
                          const _BottomSheetHeader(),
                          const Divider(
                            color: Color(0xFF181818),
                            height: 1,
                          ),
                          ...incidents.map((e) => IncidentCard(item: e)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
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

class _TopOverlayBar extends StatelessWidget {
  const _TopOverlayBar();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 12,
      left: 16,
      right: 16,
      child: Row(
        children: [
          const Icon(Icons.layers_outlined, color: Colors.white, size: 24),
          const SizedBox(width: 12),
          const Text(
            'Incidents',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 24),
          const Spacer(),
          _CircleIconButton(
            icon: Icons.search,
            onTap: () {},
          ),
          const SizedBox(width: 12),
          _CircleIconButton(
            icon: Icons.person_outline,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _BottomSheetHeader extends StatelessWidget {
  const _BottomSheetHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'scholl',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    height: 1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                height: 46,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: const Color(0xFF171717),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Center(
                  child: Text(
                    'Edit Alert Zone',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            '48 alerts past 4w',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class IncidentCard extends StatelessWidget {
  final IncidentItem item;

  const IncidentCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${item.distance} · ${item.place}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFFF0C24C),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        height: 1.15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      item.description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              Container(
                width: 92,
                height: 92,
                decoration: BoxDecoration(
                  color: const Color(0xFF0F1420),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: const Color(0xFFF0C24C),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        item.icon,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(
                item.updatedAt,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Text(
                item.views,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.reply, color: Colors.white, size: 20),
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
          const SizedBox(height: 4),
          const Divider(
            color: Color(0xFF181818),
            height: 28,
          ),
        ],
      ),
    );
  }
}

class IncidentItem {
  final String distance;
  final String place;
  final String title;
  final String description;
  final String updatedAt;
  final String views;
  final String icon;

  IncidentItem({
    required this.distance,
    required this.place,
    required this.title,
    required this.description,
    required this.updatedAt,
    required this.views,
    required this.icon,
  });
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(.10),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 52,
          height: 52,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}

class _MapFloatingButton extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const _MapFloatingButton({
    required this.child,
    this.backgroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(31),
        border: Border.all(color: Colors.white24),
      ),
      child: Center(child: child),
    );
  }
}

class _FakeMapBackground extends StatelessWidget {
  const _FakeMapBackground();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1D2B34),
                Color(0xFF243640),
                Color(0xFF17242C),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        CustomPaint(
          size: Size.infinite,
          painter: _MapGridPainter(),
        ),
        const Positioned(
          left: 220,
          top: 320,
          child: _MapMarker(
            emoji: '🔪',
            ringColor: Color(0xFFF0C24C),
          ),
        ),
        const Positioned(
          left: 130,
          top: 220,
          child: _MapMarker(
            emoji: '🔥',
          ),
        ),
        const Positioned(
          left: 330,
          top: 190,
          child: _MapMarker(
            emoji: '🔫',
          ),
        ),
        const Positioned(
          left: 70,
          top: 420,
          child: _MapMarker(
            emoji: '⚠️',
          ),
        ),
        const Positioned(
          left: 310,
          top: 560,
          child: _MapMarker(
            emoji: '📣',
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 38,
          top: 360,
          child: Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(999),
              boxShadow: const [
                BoxShadow(color: Colors.black45, blurRadius: 10),
              ],
            ),
            child: const Icon(
              Icons.location_on_outlined,
              color: Colors.black,
              size: 34,
            ),
          ),
        ),
      ],
    );
  }
}

class _MapMarker extends StatelessWidget {
  final String emoji;
  final Color ringColor;

  const _MapMarker({
    required this.emoji,
    this.ringColor = Colors.white24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: ringColor, width: 2),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 8),
        ],
      ),
      child: Center(
        child: Text(
          emoji,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = Colors.white.withOpacity(.45)
      ..strokeWidth = 2;

    final minorPaint = Paint()
      ..color = Colors.white.withOpacity(.14)
      ..strokeWidth = 1.2;

    for (double x = -100; x < size.width + 120; x += 42) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x - 120, size.height),
        roadPaint,
      );
    }

    for (double y = 60; y < size.height; y += 58) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y + 120),
        minorPaint,
      );
    }

    final dotPaint = Paint()..color = Colors.white.withOpacity(.75);
    for (double x = 40; x < size.width; x += 110) {
      for (double y = 90; y < size.height; y += 120) {
        canvas.drawCircle(Offset(x, y), 5, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
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
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(color: Color(0xFF181818)),
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
                            selected ? FontWeight.w600 : FontWeight.w400,
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

class IncidentsTopBar extends StatelessWidget {
  const IncidentsTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          top: topPadding + 12,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000), // preto forte
              Color(0xE6000000), // preto com leve transparência
              Color(0x99000000), // fade
              Colors.transparent, // dissolve no mapa
            ],
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.layers_outlined, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            const Text(
              'Incidents',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.keyboard_arrow_down,
                color: Colors.white, size: 24),
            const Spacer(),
            _circleButton(Icons.search),
            const SizedBox(width: 10),
            _circleButton(Icons.person_outline),
          ],
        ),
      ),
    );
  }

  Widget _circleButton(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
