import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> vehicleImages = [
  "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7",
  "https://images.unsplash.com/photo-1503376780353-7e6692767b70",
  "https://images.unsplash.com/photo-1553440569-bcc63803a83d",
  "https://images.unsplash.com/photo-1502877338535-766e1452684a",
  "https://images.unsplash.com/photo-1544636331-e26879cd4d9b",
  "https://images.unsplash.com/photo-1511919884226-fd3cad34687c",
];

final List<String> vehicleTitles = [
  "BMW M4",
  "Audi RS7",
  "Porsche",
  "Mustang",
  "Mercedes",
  "Lamborghini",
];

//glassmorphism é o  do gradiente
class SocialProfileScreen extends StatefulWidget {
  const SocialProfileScreen({super.key});

  @override
  State<SocialProfileScreen> createState() => _SocialProfileScreenState();
}

class _SocialProfileScreenState extends State<SocialProfileScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _premiumController;

  @override
  void initState() {
    super.initState();

    _premiumController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _premiumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B141A),
      body: Stack(
        children: [
          // BACKGROUND GRADIENTS
          Positioned(
            top: -120,
            left: -80,
            child: _blurCircle(
              size: 260,
              color: Colors.blue.withOpacity(0.16),
            ),
          ),

          Positioned(
            bottom: -140,
            right: -100,
            child: _blurCircle(
              size: 300,
              color: Colors.purple.withOpacity(0.16),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 12, 18, 0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Perfil",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        _circleIcon(CupertinoIcons.share),
                        const SizedBox(width: 10),
                        _circleIcon(CupertinoIcons.settings),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // AVATAR
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF3CA7FF),
                                Color(0xFF1E5EFF),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.35),
                                blurRadius: 24,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(3),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF16232C),
                            ),
                            child: const Icon(
                              CupertinoIcons.person_fill,
                              size: 54,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        // VERIFIED
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.lightBlueAccent,
                            border: Border.all(
                              color: const Color(0xFF0B141A),
                              width: 3,
                            ),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // NAME
                  const Center(
                    child: Text(
                      "Paulo Soares",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Center(
                    child: Text(
                      "paulo@gmail.com",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.55),
                        fontSize: 14,
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  // BIO
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: _glassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _sectionTitle("MISSÃO"),
                          const SizedBox(height: 10),
                          Text(
                            "Desenvolvedor mobile apaixonado por Flutter, UI/UX e tecnologia. Criando experiências modernas e intuitivas.",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.82),
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),
                  // STATS
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        _statItem("3", "Items"),
                        const SizedBox(width: 32),
                        _statItem("1", "Alerta"),
                        const SizedBox(width: 32),
                        _statItem("8", "Seguidores"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  // REPUTATION
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 18),
                  //   child: Container(
                  //     padding: const EdgeInsets.all(18),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(24),
                  //       gradient: const LinearGradient(
                  //         colors: [
                  //           Color(0xFF16314A),
                  //           Color(0xFF10202E),
                  //         ],
                  //       ),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.blue.withOpacity(0.18),
                  //           blurRadius: 18,
                  //         ),
                  //       ],
                  //     ),
                  //     child: Column(
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Container(
                  //               width: 52,
                  //               height: 52,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(16),
                  //                 color: Colors.amber.withOpacity(0.12),
                  //               ),
                  //               child: const Icon(
                  //                 Icons.workspace_premium_rounded,
                  //                 color: Colors.amber,
                  //                 size: 28,
                  //               ),
                  //             ),
                  //             const SizedBox(width: 14),
                  //             const Expanded(
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     "Nível 8",
                  //                     style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 20,
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   SizedBox(height: 4),
                  //                   Text(
                  //                     "Protetor da Cidade",
                  //                     style: TextStyle(
                  //                       color: Colors.white70,
                  //                       fontSize: 13,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             const Text(
                  //               "1250 XP",
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         const SizedBox(height: 18),
                  //         ClipRRect(
                  //           borderRadius: BorderRadius.circular(20),
                  //           child: LinearProgressIndicator(
                  //             value: 0.72,
                  //             minHeight: 8,
                  //             backgroundColor: Colors.white.withOpacity(0.06),
                  //             valueColor: const AlwaysStoppedAnimation(
                  //               Colors.lightBlueAccent,
                  //             ),
                  //           ),
                  //         ),
                  //         const SizedBox(height: 10),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               "720 / 1000 XP",
                  //               style: TextStyle(
                  //                 color: Colors.white.withOpacity(0.55),
                  //                 fontSize: 12,
                  //               ),
                  //             ),
                  //             const Text(
                  //               "Próximo nível",
                  //               style: TextStyle(
                  //                 color: Colors.lightBlueAccent,
                  //                 fontSize: 12,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // const SizedBox(height: 22),

                  const SizedBox(height: 28),

                  // BADGES TITLE
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: _sectionTitle("BADGES"),
                  ),
                  // BadgeSection(),
                  // Image.asset(
                  //   "assets/images/badge_verified.png",
                  //   width: 120,
                  //   height: 120,
                  // ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 5,
                      children: [
                        //Primeiro item cadastrado (carro,moto,celular)

                        Image.asset(
                          "assets/images/badge_first_item.png",
                          height: 90,
                          fit: BoxFit.cover,
                        ),

                        //Primeiro alerta
                        // Image.asset(
                        //   "assets/images/badge_level_up.png",
                        //   // width: 120,
                        //   height: 90,
                        //   fit: BoxFit.cover,
                        // ),
                        Image.asset(
                          "assets/images/item4_processed.png",
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/images/patrulheiro_processed.png",
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/images/badge_verified.png",
                          // width: 120,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/images/badge_hero.png",
                          // width: 120,
                          height: 90,
                          fit: BoxFit.cover,
                        ),

                        Image.asset("assets/images/sherifi_badge.png",
                            // width: 120,
                            height: 90,
                            fit: BoxFit.cover),
                      ],
                    ),
                  ),

                  // ColorFiltered(
                  //   colorFilter: const ColorFilter.matrix([
                  //     0.2126,
                  //     0.7152,
                  //     0.0722,
                  //     0,
                  //     0,
                  //     0.2126,
                  //     0.7152,
                  //     0.0722,
                  //     0,
                  //     0,
                  //     0.2126,
                  //     0.7152,
                  //     0.0722,
                  //     0,
                  //     0,
                  //     0,
                  //     0,
                  //     0,
                  //     1,
                  //     0,
                  //   ]),
                  //   child: Opacity(
                  //     opacity: 0.35,
                  //     child: Image.asset(
                  //       "assets/images/badge_verified.png",
                  //       width: 120,
                  //       height: 120,
                  //     ),
                  //   ),
                  // ),

                  const SizedBox(height: 28),

                  // FRIENDS TITLE
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: _sectionTitle("SUGESTÕES DE AMIGOS"),
                  ),

                  const SizedBox(height: 14),

                  // FRIENDS
                  SizedBox(
                    height: 200,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      scrollDirection: Axis.horizontal,
                      children: const [
                        FriendCard(
                          image: "https://i.pravatar.cc/300?img=12",
                          name: "Jorisa Santos",
                        ),
                        FriendCard(
                          image: "https://i.pravatar.cc/300?img=32",
                          name: "Marcela Oliveira",
                        ),
                        FriendCard(
                          image: "https://i.pravatar.cc/300?img=52",
                          name: "Felipe Rocha",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  //TESTE
                  const SizedBox(height: 28),

// PRODUCTS TITLE
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _sectionTitle("MEUS FAVORITOS"),
                        Text(
                          "Ver todos",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.45),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

// PRODUCTS GRID
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: vehicleImages.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.82,
                      ),
                      itemBuilder: (context, index) {
                        return VehicleGridItem(
                          image: vehicleImages[index],
                          title: vehicleTitles[index],
                        );
                      },
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

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white.withOpacity(0.45),
        fontWeight: FontWeight.bold,
        fontSize: 16,
        letterSpacing: 1,
      ),
    );
  }

  Widget _statCard(
    String value,
    String label,
    IconData icon,
  ) {
    return _glassCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.lightBlueAccent,
            size: 22,
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.55),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIcon(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }

  Widget _glassCard({
    required Widget child,
    EdgeInsets? padding,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          padding: padding ?? const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withOpacity(0.06),
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _blurCircle({
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
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 120,
          sigmaY: 120,
        ),
        child: Container(),
      ),
    );
  }
}

class FriendCard extends StatelessWidget {
  final String image;
  final String name;

  const FriendCard({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(image),
          ),
          const SizedBox(height: 14),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "4 amigos em comum",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.45),
              fontSize: 11,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 34,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Adicionar",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _statItem(String value, String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        value,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        label,
        style: TextStyle(
          color: Colors.white.withOpacity(0.55),
          fontSize: 13,
        ),
      ),
    ],
  );
}

// ADICIONE ESTE WIDGET NO FINAL DO ARQUIVO

class VehicleGridItem extends StatelessWidget {
  final String image;
  final String title;

  const VehicleGridItem({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Stack(
        children: [
          // IMAGE
          Positioned.fill(
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),

          // DARK OVERLAY
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.55),
                  ],
                ),
              ),
            ),
          ),

          // FAVORITE
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.35),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),

          // BOTTOM INFO
          Positioned(
            left: 12,
            right: 12,
            bottom: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_rounded,
                      color: Colors.white.withOpacity(0.75),
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "2.3k",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BadgeItem2 {
  final String title;
  final IconData icon;
  final Color color;
  final bool isNew;
  final int? level;

  const BadgeItem2({
    required this.title,
    required this.icon,
    required this.color,
    this.isNew = false,
    this.level,
  });
}

class BadgeSection extends StatelessWidget {
  const BadgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final badges = [
      const BadgeItem2(
        title: "Confident\nReader",
        icon: Icons.rocket_launch_rounded,
        color: Color(0xFF4A90FF),
        isNew: true,
      ),
      const BadgeItem2(
        title: "Responsible\nReader",
        icon: Icons.pets_rounded,
        color: Color(0xFFFFC83D),
        level: 3,
      ),
      const BadgeItem2(
        title: "Serious\nLearner",
        icon: Icons.science_rounded,
        color: Color(0xFF325D88),
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(text: "Badges "),
                    TextSpan(
                      text: "12",
                      style: TextStyle(color: Color(0xFF3B82F6)),
                    ),
                    TextSpan(
                      text: "/62",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "View all",
                        style: TextStyle(
                          color: Color(0xFF3B82F6),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 18,
                        color: Color(0xFF3B82F6),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// BADGES
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: badges.map((badge) => BadgeWidget(badge: badge)).toList(),
          ),
        ],
      ),
    );
  }
}

class BadgeWidget extends StatelessWidget {
  final BadgeItem2 badge;

  const BadgeWidget({
    super.key,
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            /// HEXAGON BACKGROUND
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: badge.color,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: badge.color.withOpacity(.25),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Icon(
                badge.icon,
                size: 34,
                color: Colors.white,
              ),
            ),

            /// NEW LABEL
            if (badge.isNew)
              Positioned(
                top: -8,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "New",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            /// LEVEL
            if (badge.level != null)
              Positioned(
                right: -2,
                bottom: -2,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    badge.level.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 90,
          child: Text(
            badge.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              height: 1.2,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
