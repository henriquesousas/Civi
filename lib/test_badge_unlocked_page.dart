import 'package:flutter/material.dart';

class TestBadgeUnlockedPage extends StatelessWidget {
  const TestBadgeUnlockedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Stack(
          children: [
            // Background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF1677FF),
                    Color(0xFF0F5EFF),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),

            // Decorative circles
            Positioned(
              top: 120,
              left: -20,
              child: _circle(
                size: 80,
                color: Colors.white.withOpacity(.08),
              ),
            ),

            Positioned(
              top: 180,
              right: -10,
              child: _circle(
                size: 60,
                color: Colors.white.withOpacity(.06),
              ),
            ),

            Positioned(
              bottom: 180,
              left: 20,
              child: _circle(
                size: 100,
                color: Colors.white.withOpacity(.05),
              ),
            ),

            // Confetti
            ...List.generate(
              20,
              (index) => Positioned(
                top: 100.0 + (index * 25),
                left: (index * 18).toDouble(),
                child: Transform.rotate(
                  angle: .4,
                  child: Container(
                    width: 10,
                    height: 18,
                    decoration: BoxDecoration(
                      color: [
                        Colors.yellow,
                        Colors.red,
                        Colors.green,
                        Colors.orange,
                        Colors.white,
                      ][index % 5],
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ),

            Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Title
                const Text(
                  "Unlocked New Badges 🎉",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const Spacer(),

                // Badge Card
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 28),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 32,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(34),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.18),
                        blurRadius: 30,
                        offset: const Offset(0, 15),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Badge
                      Container(
                        width: 170,
                        height: 170,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF1677FF),
                              Color(0xFF3B82F6),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(42),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.rocket_launch_rounded,
                            color: Colors.white,
                            size: 90,
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      const Text(
                        "Active Starter",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        "You've conquered your first\ndaily goal!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.4,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Bottom Button Area
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF4FF),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(
                          Icons.share_rounded,
                          color: Color(0xFF1677FF),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: SizedBox(
                          height: 58,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color(0xFF1677FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _circle({
    required double size,
    required Color color,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
