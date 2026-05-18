import 'package:deehelp/old_core/ui/widgets/image/export_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// AJUSTES PRINCIPAIS:
/// - Redução geral de paddings
/// - Fontes menores
/// - Cards mais compactos
/// - BottomNavigation menor
/// - Ícones ajustados
/// - Melhor proporção para celulares

class TestProfileV2 extends StatelessWidget {
  const TestProfileV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // bottomNavigationBar: const _BottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),

              ProfileImageWithUploadButtonWidget(
                imageAlt: "A",
                width: 90,
                height: 90,
                radius: 999,
                imageUrl:
                    "https://img.freepik.com/fotos-gratis/retrato-de-homem-branco-isolado_53876-40306.jpg?semt=ais_hybrid&w=740&q=80",
              ),

              const SizedBox(height: 18),

              /// PREMIUM CARD
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: Colors.white.withOpacity(.06),
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF111827),
                      Color(0xFF0B1220),
                      Colors.black,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xFF6B8DFF),
                        ),
                      ),
                      child: const Icon(
                        CupertinoIcons.sparkles,
                        color: Color(0xFF7DA2FF),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upgrade to Premium',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Gain access to all of Citizen.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Learn More',
                            style: TextStyle(
                              color: Color(0xFF6C8FFF),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              /// ACHIEVEMENTS
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF121212),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My Achievements',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 22),

                    /// BADGES
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildBadge(
                          color: Colors.greenAccent,
                          scale: .82,
                        ),
                        Transform.translate(
                          offset: const Offset(-10, 0),
                          child: _buildBadge(
                            color: Colors.deepPurpleAccent,
                            scale: 1,
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-20, 0),
                          child: _buildBadge(
                            color: Colors.orangeAccent,
                            scale: .82,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    const Center(
                      child: Text(
                        'Achieve your first badge!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Center(
                      child: Text(
                        'Achieve badges by alerting your\ncommunity of incidents or good vibes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'May Challenge',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '30 days left',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white24,
                            ),
                          ),
                          child: const Icon(
                            CupertinoIcons.lock_fill,
                            color: Colors.white70,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Alert your community 1 time\n',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Community Helper',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4D0912),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                            side: const BorderSide(
                              color: Colors.red,
                              width: 1.6,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.video_camera_solid,
                          color: Colors.red,
                          size: 20,
                        ),
                        label: const Text(
                          'Alert Community',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _buildMenuTile(
                icon: CupertinoIcons.person_3_fill,
                title: 'Meus itens',
                value: '2',
              ),

              _buildMenuTile(
                icon: CupertinoIcons.location_solid,
                title: 'Meus alertas',
                value: '3',
              ),

              _buildMenuTile(
                icon: CupertinoIcons.person_2_fill,
                title: 'Friends',
                value: '0',
              ),
              _buildMenuTile(
                icon: CupertinoIcons.person_2_fill,
                title: 'Friends',
                value: '0',
              ),
              _buildMenuTile(
                icon: CupertinoIcons.person_2_fill,
                title: 'Friends',
                value: '0',
              ),
              _buildMenuTile(
                icon: CupertinoIcons.person_2_fill,
                title: 'Friends',
                value: '0',
              ),
              _buildMenuTile(
                icon: CupertinoIcons.person_2_fill,
                title: 'Friends',
                value: '0',
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildBadge({
    required Color color,
    double scale = 1,
  }) {
    return Transform.scale(
      scale: scale,
      child: Container(
        width: 74,
        height: 74,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: color,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(.2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            CupertinoIcons.waveform_circle_fill,
            color: color,
            size: 26,
          ),
        ),
      ),
    );
  }

  static Widget _buildMenuTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(.06),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: Color(0xFF111111),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            CupertinoIcons.chevron_right,
            color: Colors.white54,
            size: 18,
          ),
        ],
      ),
    );
  }
}
