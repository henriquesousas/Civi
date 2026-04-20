import 'package:flutter/material.dart';

class TestMapaDetail extends StatelessWidget {
  const TestMapaDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _DetailMapHeader(),
                _DetailHeaderCard(),
                // _MediaSection(),
                _MediaSection2(
                  images: [
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrWiHzTRTryiZ_rqe_ntQSQZiG1ZPlttn1xQ&s',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7LjPNOGgJyuAhhqsTB_VOTSoFGB3Nsn3frg&s',
                    'https://www.estadao.com.br/resizer/v2/SQSY3VV5NFIU3MI5UFZMKHBBLA.jpg?quality=80&auth=091167d4400fea315e8beb4b23310262935671b2b87a47270ab8a659ebb40afb&width=380',
                  ],
                ),
                _SummarySection(),
                SizedBox(height: 120),
              ],
            ),
          ),
          const _FloatingChatBar(),
        ],
      ),
    );
  }
}

class _DetailMapHeader extends StatelessWidget {
  const _DetailMapHeader();

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return SizedBox(
      height: 420,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1A2A34),
                  Color(0xFF223640),
                  Color(0xFF17242C),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: CustomPaint(
              painter: _MapGridPainter(),
            ),
          ),
          Positioned(
            top: topPadding + 14,
            left: 16,
            child: _CircleMapButton(
              icon: Icons.arrow_back_ios_new,
              size: 22,
            ),
          ),
          Positioned(
            top: topPadding + 14,
            right: 16,
            child: Column(
              children: const [
                _CircleMapButton(icon: Icons.fullscreen, size: 26),
                SizedBox(height: 12),
                _CircleMapButton(icon: Icons.crop_3_2, label: '2D'),
              ],
            ),
          ),
          Positioned(
            left: 16,
            top: 150,
            child: Container(
              width: 82,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.videocam, size: 15, color: Colors.white),
                      SizedBox(width: 6),
                      Text(
                        '18',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Videos',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(height: 18),
                  Text(
                    '727',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Users\nwithin\n0.3 mi',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VehicleImageSection extends StatelessWidget {
  const _VehicleImageSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF161616),
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Vehicle',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: Image.network(
                'https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=1400&auto=format&fit=crop',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    color: const Color(0xFF232323),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.directions_car_outlined,
                      size: 56,
                      color: Colors.white54,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'White Chevrolet SUV',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Reported vehicle involved in the incident.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class IncidentDetailPage extends StatelessWidget {
  final String vehicleImageUrl;
  final String vehicleTitle;
  final String vehicleSubtitle;

  const IncidentDetailPage({
    super.key,
    required this.vehicleImageUrl,
    required this.vehicleTitle,
    required this.vehicleSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _DetailMapHeader(),
                const _DetailHeaderCard(),
                _VehicleImageSection(),
                const _SummarySection(),
                const SizedBox(height: 120),
              ],
            ),
          ),
          const _FloatingChatBar(),
        ],
      ),
    );
  }
}

class _DetailHeaderCard extends StatelessWidget {
  const _DetailHeaderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF161616),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '6129.3 mi · 44C5+7G Azusa',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Shots Fired in Armed Standoff, Traffic Stopped on I-210',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              height: 1.1,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Reported 12 hours ago · 72.3K notified · 103.8K views',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 22),
          Row(
            children: const [
              Expanded(
                child: _ActionPillButton(
                  icon: Icons.reply,
                  label: 'Share',
                ),
              ),
              SizedBox(width: 14),
              Expanded(
                child: _ActionPillButton(
                  icon: Icons.notifications,
                  label: 'Follow',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MediaSection extends StatelessWidget {
  const _MediaSection();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 11,
          child: Container(
            color: const Color(0xFF111111),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF0E0B0A),
                        Color(0xFF221717),
                        Color(0xFF372221),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Positioned(
                  left: 18,
                  top: 18,
                  child: Row(
                    children: const [
                      Icon(Icons.remove_red_eye, color: Colors.white, size: 22),
                      SizedBox(width: 8),
                      Text(
                        '3,659',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  left: 18,
                  bottom: 56,
                  child: Text(
                    '07:51 AM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Positioned(
                  left: 18,
                  bottom: 30,
                  child: Text(
                    '717 W Baseline Rd',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
                const Positioned(
                  left: 18,
                  bottom: 8,
                  child: Text(
                    'anzaUser2061998007',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 18,
                  child: Row(
                    children: [
                      _MiniCircleIcon(
                        icon: Icons.volume_off,
                        onTap: () {},
                      ),
                      const SizedBox(width: 10),
                      _MiniCircleIcon(
                        icon: Icons.more_horiz,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.55),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      '2/6',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SummarySection extends StatelessWidget {
  const _SummarySection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF161616),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 36),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Summary',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 22),
          Text(
            'A police standoff occurred on a freeway in Azusa, California, involving a suspect in a white truck who displayed a firearm during the pursuit. The standoff remained active for hours and caused significant traffic disruption on I-210 while officers secured the area.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 17,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingChatBar extends StatelessWidget {
  const _FloatingChatBar();

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;

    return Positioned(
      left: 18,
      right: 18,
      bottom: bottom + 14,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 68,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: const Color(0xFF242424),
                borderRadius: BorderRadius.circular(34),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 14,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Chat · 803',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Container(
            width: 68,
            height: 68,
            decoration: const BoxDecoration(
              color: Color(0xFF2B2B2B),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.send,
              color: Colors.white54,
              size: 30,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.campaign,
                color: Colors.white,
                size: 36,
              ),
              SizedBox(height: 6),
              Text(
                '4,333',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CircleMapButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final String? label;

  const _CircleMapButton({
    required this.icon,
    this.size = 24,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final child = label != null
        ? Text(
            label!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          )
        : Icon(icon, color: Colors.white, size: size);

    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.32),
        shape: BoxShape.circle,
      ),
      child: Center(child: child),
    );
  }
}

class _ActionPillButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionPillButton({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(27),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniCircleIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _MiniCircleIcon({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.45),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = Colors.white.withOpacity(.36)
      ..strokeWidth = 2;

    final minorPaint = Paint()
      ..color = Colors.white.withOpacity(.10)
      ..strokeWidth = 1.1;

    for (double x = -80; x < size.width + 120; x += 55) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x - 80, size.height),
        roadPaint,
      );
    }

    for (double y = 40; y < size.height; y += 62) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y + 70),
        minorPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MediaSection2 extends StatefulWidget {
  final List<String> images;

  const _MediaSection2({
    super.key,
    required this.images,
  });

  @override
  State<_MediaSection2> createState() => _MediaSectionState();
}

class _MediaSectionState extends State<_MediaSection2> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasMultiple = widget.images.length > 1;

    return Container(
      color: const Color(0xFF161616),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // opcional: título
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 18, 20, 12),
            child: Text(
              'Veículo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 10,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: widget.images.length,
                  onPageChanged: (index) {
                    setState(() => currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      widget.images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                ),
              ),

              // 👁 views (igual ao exemplo)
              const Positioned(
                left: 16,
                top: 16,
                child: Row(
                  children: [
                    Icon(Icons.remove_red_eye, color: Colors.white, size: 20),
                    SizedBox(width: 6),
                    Text(
                      '3,659',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // 🔇 mute + menu
              Positioned(
                right: 12,
                top: 12,
                child: Row(
                  children: [
                    _MiniCircleIcon2(icon: Icons.volume_off),
                    const SizedBox(width: 8),
                    _MiniCircleIcon2(icon: Icons.more_horiz),
                  ],
                ),
              ),

              // 📍 infos inferiores
              const Positioned(
                left: 16,
                bottom: 50,
                child: Text(
                  '07:51 AM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Positioned(
                left: 16,
                bottom: 26,
                child: Text(
                  '717 W Baseline Rd',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),

              const Positioned(
                left: 16,
                bottom: 6,
                child: Text(
                  'usuario123',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ),

              // 🔢 contador (1/3)
              if (hasMultiple)
                Positioned(
                  right: 14,
                  bottom: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.55),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '${currentIndex + 1}/${widget.images.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 16),

          // 📝 info do veículo (muito importante pro Civi)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'CG Titan 150',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 6),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Cor preta · Placa final 3241',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _MiniCircleIcon2 extends StatelessWidget {
  final IconData icon;

  const _MiniCircleIcon2({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.45),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }
}
