import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/feature/home/v2/widgets/contribute_card.dart';
import 'package:deehelp/feature/home/v2/widgets/waze_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppUI {
  static const bg = Color(0xFFF7F8FC);
  static const surface = Colors.white;
  static const primary = Color(0xFF2B5BEE);
  static const primaryDark = Color(0xFF1F49CC);
  static const primarySoft = Color(0xFFEAF1FF);

  static const textPrimary = Color(0xFF151A28);
  static const textSecondary = Color(0xFF697386);
  static const textTertiary = Color(0xFF8B95A7);

  static const line = Color(0xFFE9EEF6);

  static const dangerSoft = Color(0xFFFFEEEE);
  static const dangerText = Color(0xFFC53D3D);

  static const warningSoft = Color(0xFFFFF6E8);
  static const warningText = Color(0xFFC98312);

  static const infoSoft = Color(0xFFEEF4FF);
  static const infoText = Color(0xFF2B5BEE);

  static const successSoft = Color(0xFFEAF8F0);
  static const successText = Color(0xFF1E8E5A);

  static const double radiusSm = 12;
  static const double radiusMd = 16;
  static const double radiusLg = 20;
  static const double radiusXl = 24;
}

// final events = [
//   EventModel(
//     title: "Roubo de carro reportado na Av. dos Autonomistas",
//     date: "Hoje • 08:14",
//     subtitle: "Osasco • Próximo ao Centro",
//     confirmations: 18,
//     imageUrl: "https://images.unsplash.com/photo-1503376780353-7e6692767b70",
//     avatars: [
//       "https://i.pravatar.cc/100?img=1",
//       "https://i.pravatar.cc/100?img=2",
//       "https://i.pravatar.cc/100?img=3",
//       "https://i.pravatar.cc/100?img=4",
//     ],
//   ),
// ];

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  String selectedTab = 'alertas';

  final List<CommunityReportModel> reports = const [
    CommunityReportModel(
      type: CommunityReportType.robbery,
      title: "Roubo de carro reportado na Av. dos Autonomistas",
      date: "Hoje • 08:14",
      location: "Osasco • Próximo ao Centro",
      confirmations: 18,
      imageUrl: "https://images.unsplash.com/photo-1503376780353-7e6692767b70",
      avatars: [
        "https://i.pravatar.cc/100?img=1",
        "https://i.pravatar.cc/100?img=2",
        "https://i.pravatar.cc/100?img=3",
      ],
    ),
    CommunityReportModel(
      type: CommunityReportType.robbery,
      title: "Moto levada por assalto na região da Vila Yara",
      date: "Hoje • 09:02",
      location: "Osasco • Vila Yara",
      confirmations: 11,
      imageUrl: "https://images.unsplash.com/photo-1558981806-ec527fa84c39",
      avatars: [
        "https://i.pravatar.cc/100?img=5",
        "https://i.pravatar.cc/100?img=6",
        "https://i.pravatar.cc/100?img=7",
      ],
    ),
    CommunityReportModel(
      type: CommunityReportType.robbery,
      title: "Celular roubado em ponto de ônibus",
      date: "Hoje • 09:47",
      location: "Carapicuíba • Próximo à Av. Inocêncio Seráfico",
      confirmations: 26,
      imageUrl: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
      avatars: [
        "https://i.pravatar.cc/100?img=8",
        "https://i.pravatar.cc/100?img=9",
        "https://i.pravatar.cc/100?img=10",
      ],
    ),
    CommunityReportModel(
      type: CommunityReportType.robbery,
      title: "Celular roubado em ponto de ônibus",
      date: "Hoje • 09:47",
      location: "Carapicuíba • Próximo à Av. Inocêncio Seráfico",
      confirmations: 26,
      imageUrl: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
      avatars: [
        "https://i.pravatar.cc/100?img=8",
        "https://i.pravatar.cc/100?img=9",
        "https://i.pravatar.cc/100?img=10",
      ],
    ),
    CommunityReportModel(
      type: CommunityReportType.robbery,
      title: "Celular roubado em ponto de ônibus",
      date: "Hoje • 09:47",
      location: "Carapicuíba • Próximo à Av. Inocêncio Seráfico",
      confirmations: 26,
      imageUrl: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
      avatars: [
        "https://i.pravatar.cc/100?img=8",
        "https://i.pravatar.cc/100?img=9",
        "https://i.pravatar.cc/100?img=10",
      ],
    ),
    CommunityReportModel(
      type: CommunityReportType.robbery,
      title: "Celular roubado em ponto de ônibus",
      date: "Hoje • 09:47",
      location: "Carapicuíba • Próximo à Av. Inocêncio Seráfico",
      confirmations: 26,
      imageUrl: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
      avatars: [
        "https://i.pravatar.cc/100?img=8",
        "https://i.pravatar.cc/100?img=9",
        "https://i.pravatar.cc/100?img=10",
      ],
    ),
    CommunityReportModel(
      type: CommunityReportType.robbery,
      title: "Celular roubado em ponto de ônibus",
      date: "Hoje • 09:47",
      location: "Carapicuíba • Próximo à Av. Inocêncio Seráfico",
      confirmations: 26,
      imageUrl: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
      avatars: [
        "https://i.pravatar.cc/100?img=8",
        "https://i.pravatar.cc/100?img=9",
        "https://i.pravatar.cc/100?img=10",
      ],
    ),
    CommunityReportModel(
      type: CommunityReportType.robbery,
      title: "Celular roubado em ponto de ônibus",
      date: "Hoje • 09:47",
      location: "Carapicuíba • Próximo à Av. Inocêncio Seráfico",
      confirmations: 26,
      imageUrl: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
      avatars: [
        "https://i.pravatar.cc/100?img=8",
        "https://i.pravatar.cc/100?img=9",
        "https://i.pravatar.cc/100?img=10",
      ],
    ),
    CommunityReportModel(
      type: CommunityReportType.robbery,
      title: "Celular roubado em ponto de ônibus",
      date: "Hoje • 09:47",
      location: "Carapicuíba • Próximo à Av. Inocêncio Seráfico",
      confirmations: 26,
      imageUrl: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
      avatars: [
        "https://i.pravatar.cc/100?img=8",
        "https://i.pravatar.cc/100?img=9",
        "https://i.pravatar.cc/100?img=10",
      ],
    ),
    CommunityReportModel(
      type: CommunityReportType.robbery,
      title: "Celular roubado em ponto de ônibus",
      date: "Hoje • 09:47",
      location: "Carapicuíba • Próximo à Av. Inocêncio Seráfico",
      confirmations: 26,
      imageUrl: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
      avatars: [
        "https://i.pravatar.cc/100?img=8",
        "https://i.pravatar.cc/100?img=9",
        "https://i.pravatar.cc/100?img=10",
      ],
    ),
    CommunityReportModel(
      type: CommunityReportType.robbery,
      title: "Celular roubado em ponto de ônibus",
      date: "Hoje • 09:47",
      location: "Carapicuíba • Próximo à Av. Inocêncio Seráfico",
      confirmations: 26,
      imageUrl: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
      avatars: [
        "https://i.pravatar.cc/100?img=8",
        "https://i.pravatar.cc/100?img=9",
        "https://i.pravatar.cc/100?img=10",
      ],
    ),
    CommunityReportModel(
      type: CommunityReportType.flood,
      title: "Alagamento deixando trânsito lento",
      date: "Hoje • 10:05",
      location: "Osasco • Km 18",
      confirmations: 34,
      imageUrl: "https://images.unsplash.com/photo-1515694346937-94d85e41e6f0",
      avatars: [
        "https://i.pravatar.cc/100?img=12",
        "https://i.pravatar.cc/100?img=13",
        "https://i.pravatar.cc/100?img=14",
      ],
    ),
    CommunityReportModel(
      type: CommunityReportType.blockedRoad,
      title: "Rua parcialmente interditada após ocorrência",
      date: "Hoje • 10:21",
      location: "Barueri • Divisa com Osasco",
      confirmations: 9,
      imageUrl: "https://images.unsplash.com/photo-1504307651254-35680f356dfd",
      avatars: [
        "https://i.pravatar.cc/100?img=15",
        "https://i.pravatar.cc/100?img=16",
        "https://i.pravatar.cc/100?img=17",
      ],
    ),
    CommunityReportModel(
      type: CommunityReportType.suspicious,
      title: "Alerta de atividade suspeita em estacionamento",
      date: "Hoje • 10:38",
      location: "Osasco • Vila Campesina",
      confirmations: 14,
      imageUrl: "https://images.unsplash.com/photo-1516321318423-f06f85e504b3",
      avatars: [
        "https://i.pravatar.cc/100?img=18",
        "https://i.pravatar.cc/100?img=19",
        "https://i.pravatar.cc/100?img=20",
      ],
    ),
    CommunityReportModel(
      type: CommunityReportType.massRobberyRisk,
      title: "Risco de arrastão alertado por moradores",
      date: "Hoje • 11:02",
      location: "Carapicuíba • Próximo ao viaduto",
      confirmations: 21,
      imageUrl: "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab",
      avatars: [
        "https://i.pravatar.cc/100?img=21",
        "https://i.pravatar.cc/100?img=22",
        "https://i.pravatar.cc/100?img=23",
        "https://i.pravatar.cc/100?img=24",
      ],
    ),
  ];

  List<CommunityReportModel> get filteredReports {
    if (selectedTab == 'roubos') {
      return reports
          .where((e) => e.type == CommunityReportType.robbery)
          .toList();
    }
    return reports.where((e) => e.type != CommunityReportType.robbery).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUI.bg,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                HomeToolbar(
                  userName: 'Paulo Henrique',
                  city: 'Osasco • SP',
                  onProfileTap: () {},
                ),
                const HomeQuickMenuScrollable(),
              ],
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: TabsHeaderDelegate(
              topPadding: 20,
              builder: (isPinned) {
                return Container(
                  color: AppUI.bg,
                  alignment: Alignment.centerLeft,
                  child: HomeChips(
                    selected: selectedTab,
                    isPinned: isPinned,
                    onChanged: (value) {
                      setState(() {
                        selectedTab = value;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 24),
            sliver: SliverList.separated(
              itemCount: filteredReports.length,
              itemBuilder: (context, index) {
                final item = filteredReports[index];

                if (index == filteredReports.length) {
                  return ContributePrimaryCard(onContribute: () {});
                }

                return CommunityReportCardPremium2(
                  report: item,
                  onTap: () {},
                  onShareTap: () {},
                  onSaveTap: () {},
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeToolbar extends StatelessWidget {
  final String title;
  final String userName;
  final String city;
  final String? avatarUrl;
  final VoidCallback? onProfileTap;

  const HomeToolbar({
    super.key,
    this.title = 'Início',
    required this.userName,
    required this.city,
    this.avatarUrl,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        left: 16,
        right: 16,
        bottom: 14,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF6F3FF),
            Color(0xFFF7F7FA),
            //V2
            // Color(0xFFe3daff),
            // Color(0xFFF6F3FF),
            //v3
            // Color(0xFFe8ecf9),
            // Color(0xFFe8ecf9),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ToolbarTitle(title: title),
          const SizedBox(height: 14),
          _ProfileCard(
            userName: userName,
            city: city,
            avatarUrl: avatarUrl,
            onTap: onProfileTap,
          ),
        ],
      ),
    );
  }
}

class _ToolbarTitle extends StatelessWidget {
  final String title;

  const _ToolbarTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFF202124),
              letterSpacing: -0.8,
            ),
          ),
        ],
      ),
    );
  }
}

// class HomeToolbar extends StatelessWidget {
//   final String title;
//   final String userName;
//   final String city;
//   final String? avatarUrl;
//   final VoidCallback? onProfileTap;

//   const HomeToolbar({
//     super.key,
//     this.title = 'Início',
//     required this.userName,
//     required this.city,
//     this.avatarUrl,
//     this.onProfileTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.only(
//         top: MediaQuery.of(context).padding.top + 8,
//         left: 16,
//         right: 16,
//         bottom: 8,
//       ),
//       color: AppUI.bg,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 26,
//               fontWeight: FontWeight.w700,
//               color: AppUI.textPrimary,
//               letterSpacing: -0.6,
//             ),
//           ),
//           const SizedBox(height: 12),
//           _ProfileCard(
//             userName: userName,
//             city: city,
//             avatarUrl: avatarUrl,
//             onTap: onProfileTap,
//           ),
//         ],
//       ),
//     );
//   }
// }

class _ProfileCard extends StatelessWidget {
  final String userName;
  final String city;
  final String? avatarUrl;
  final VoidCallback? onTap;

  const _ProfileCard({
    required this.userName,
    required this.city,
    this.avatarUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppUI.radiusLg),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: AppUI.surface,
            borderRadius: BorderRadius.circular(AppUI.radiusLg),
            border: Border.all(color: const Color(0xFFF0F3F8)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x06000000),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              _UserAvatar(avatarUrl: avatarUrl),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppUI.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      city,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppUI.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.chevron_right_rounded,
                size: 21,
                color: AppUI.textTertiary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final String? avatarUrl;

  const _UserAvatar({this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFEFF2F8),
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: ClipOval(
        child: avatarUrl != null && avatarUrl!.isNotEmpty
            ? Image.network(
                avatarUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.person_rounded,
                  size: 19,
                  color: Color(0xFF7E7E7E),
                ),
              )
            : const Icon(
                Icons.person_rounded,
                size: 19,
                color: Color(0xFF7E7E7E),
              ),
      ),
    );
  }
}

// class HomeHeroCard extends StatelessWidget {
//   const HomeHeroCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: () {},
//           borderRadius: BorderRadius.circular(AppUI.radiusXl),
//           child: Ink(
//             padding: const EdgeInsets.all(18),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(AppUI.radiusXl),
//               gradient: const LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Color(0xFFF1F5FF),
//                   Color(0xFFE7EEFF),
//                 ],
//               ),
//               border: Border.all(color: const Color(0xFFDCE6FF)),
//             ),
//             child: Row(
//               children: [
//                 // Container(
//                 //   width: 46,
//                 //   height: 46,
//                 //   decoration: BoxDecoration(
//                 //     color: Colors.white.withOpacity(.72),
//                 //     borderRadius: BorderRadius.circular(16),
//                 //   ),
//                 //   child: const Icon(
//                 //     Icons.campaign_rounded,
//                 //     color: AppUI.primary,
//                 //     size: 24,
//                 //   ),
//                 // ),
//                 // const SizedBox(width: 14),
//                 // const Expanded(
//                 //   child: Column(
//                 //     crossAxisAlignment: CrossAxisAlignment.start,
//                 //     children: [
//                 //       Text(
//                 //         "Ajude a comunidade",
//                 //         style: TextStyle(
//                 //           fontSize: 15.5,
//                 //           fontWeight: FontWeight.w700,
//                 //           color: AppUI.textPrimary,
//                 //         ),
//                 //       ),
//                 //       SizedBox(height: 3),
//                 //       Text(
//                 //         "Envie um alerta para ajudar outras pessoas da sua região.",
//                 //         style: TextStyle(
//                 //           fontSize: 12.8,
//                 //           height: 1.35,
//                 //           fontWeight: FontWeight.w500,
//                 //           color: AppUI.textSecondary,
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 // Container(
//                 //   width: 36,
//                 //   height: 36,
//                 //   decoration: BoxDecoration(
//                 //     color: Colors.white.withOpacity(.9),
//                 //     borderRadius: BorderRadius.circular(12),
//                 //   ),
//                 //   child: const Icon(
//                 //     Icons.arrow_forward_rounded,
//                 //     size: 18,
//                 //     color: AppUI.primary,
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class QuickActionsPremiumRefined extends StatelessWidget {
//   const QuickActionsPremiumRefined({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: Row(
//         children: [
//           Expanded(
//             child: QuickActionPremiumRefinedCard(
//               title: "Reportar",
//               subtitle: "Informar ocorrência",
//               icon: Icons.notification_important_rounded,
//               highlighted: true,
//             ),
//           ),
//           SizedBox(width: 12),
//           Expanded(
//             child: QuickActionPremiumRefinedCard(
//               title: "Meus itens",
//               subtitle: "Carro, moto e celular",
//               icon: Icons.directions_car_filled_rounded,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class QuickActionPremiumRefinedCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final IconData icon;
//   final bool highlighted;
//   final VoidCallback? onTap;

//   const QuickActionPremiumRefinedCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.icon,
//     this.highlighted = false,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isHighlighted = highlighted;

//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(AppUI.radiusLg),
//         child: Ink(
//           padding: const EdgeInsets.all(14),
//           decoration: BoxDecoration(
//             color: isHighlighted ? AppUI.primary : AppUI.surface,
//             borderRadius: BorderRadius.circular(AppUI.radiusLg),
//             border: Border.all(
//               color: isHighlighted ? AppUI.primary : AppUI.line,
//             ),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color(0x08000000),
//                 blurRadius: 12,
//                 offset: Offset(0, 6),
//               ),
//             ],
//           ),
//           child: SizedBox(
//             height: 96,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 42,
//                       height: 42,
//                       decoration: BoxDecoration(
//                         color: isHighlighted
//                             ? Colors.white.withOpacity(.15)
//                             : AppUI.primarySoft,
//                         borderRadius: BorderRadius.circular(14),
//                       ),
//                       child: Icon(
//                         icon,
//                         size: 22,
//                         color: isHighlighted ? Colors.white : AppUI.primary,
//                       ),
//                     ),
//                     const Spacer(),
//                     Container(
//                       width: 30,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         color: isHighlighted
//                             ? Colors.white.withOpacity(.14)
//                             : const Color(0xFFF5F7FC),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Icon(
//                         Icons.arrow_forward_rounded,
//                         size: 17,
//                         color:
//                             isHighlighted ? Colors.white : AppUI.textSecondary,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 Text(
//                   title,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                     color: isHighlighted ? Colors.white : AppUI.textPrimary,
//                   ),
//                 ),
//                 const SizedBox(height: 3),
//                 Text(
//                   subtitle,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 12.4,
//                     fontWeight: FontWeight.w500,
//                     height: 1.25,
//                     color: isHighlighted
//                         ? Colors.white.withOpacity(.82)
//                         : AppUI.textSecondary,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class QuickActionsPremiumRefined extends StatelessWidget {
//   const QuickActionsPremiumRefined({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: Row(
//         children: [
//           Expanded(
//             child: QuickActionPremiumRefinedCard(
//               title: "Reportar",
//               subtitle: "Informar ocorrência",
//               icon: Icons.notification_important_rounded,
//               highlighted: true,
//             ),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: QuickActionPremiumRefinedCard(
//               title: "Meus itens",
//               subtitle: "Carro, moto e celular",
//               icon: Icons.directions_car_filled_rounded,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class QuickActionPremiumRefinedCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final IconData icon;
//   final bool highlighted;
//   final VoidCallback? onTap;

//   const QuickActionPremiumRefinedCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.icon,
//     this.highlighted = false,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isHighlighted = highlighted;

//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(18),
//         child: Ink(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: isHighlighted ? AppUI.primary : AppUI.surface,
//             borderRadius: BorderRadius.circular(18),
//             border: Border.all(
//               color: isHighlighted ? AppUI.primary : AppUI.line,
//             ),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color(0x06000000),
//                 blurRadius: 10,
//                 offset: Offset(0, 4),
//               ),
//             ],
//           ),
//           child: SizedBox(
//             height: 78,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 36,
//                       height: 36,
//                       decoration: BoxDecoration(
//                         color: isHighlighted
//                             ? Colors.white.withOpacity(.14)
//                             : AppUI.primarySoft,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Icon(
//                         icon,
//                         size: 19,
//                         color: isHighlighted ? Colors.white : AppUI.primary,
//                       ),
//                     ),
//                     const Spacer(),
//                     Container(
//                       width: 26,
//                       height: 26,
//                       decoration: BoxDecoration(
//                         color: isHighlighted
//                             ? Colors.white.withOpacity(.12)
//                             : const Color(0xFFF5F7FC),
//                         borderRadius: BorderRadius.circular(9),
//                       ),
//                       child: Icon(
//                         Icons.arrow_forward_rounded,
//                         size: 15,
//                         color:
//                             isHighlighted ? Colors.white : AppUI.textSecondary,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 Text(
//                   title,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                     color: isHighlighted ? Colors.white : AppUI.textPrimary,
//                     height: 1.1,
//                   ),
//                 ),
//                 const SizedBox(height: 2),
//                 Text(
//                   subtitle,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 11.5,
//                     fontWeight: FontWeight.w500,
//                     height: 1.2,
//                     color: isHighlighted
//                         ? Colors.white.withOpacity(.8)
//                         : AppUI.textSecondary,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class QuickActionsPremiumRefined extends StatelessWidget {
  const QuickActionsPremiumRefined({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: QuickActionPremiumRefinedCard(
              title: "Ajude a comunidade",
              subtitle: "Informar ocorrência",
              icon: Icons.notification_important_rounded,
              highlighted: true,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: QuickActionPremiumRefinedCard(
              title: "Meus itens",
              subtitle: "Carro, moto e celular",
              icon: Icons.directions_car_filled_rounded,
            ),
          ),
        ],
      ),
    );
  }
}

class QuickActionPremiumRefinedCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool highlighted;
  final VoidCallback? onTap;

  const QuickActionPremiumRefinedCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.highlighted = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isHighlighted = highlighted;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            // color: isHighlighted ? const Color(0xFFEAF1FF) : AppUI.surface,
            color: isHighlighted ? const Color(0xFFEAF1FF) : AppUI.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isHighlighted ? const Color(0xFFD7E4FF) : AppUI.line,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x05000000),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SizedBox(
            height: 74,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: isHighlighted
                            ? Colors.white.withOpacity(.75)
                            : AppUI.primarySoft,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Icon(
                        icon,
                        size: 18,
                        color: AppUI.primary,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isHighlighted
                            ? Colors.white.withOpacity(.75)
                            : const Color(0xFFF5F7FC),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        size: 14,
                        color: AppUI.primary,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: AppUI.textPrimary,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11.2,
                    fontWeight: FontWeight.w500,
                    color: AppUI.textSecondary,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class TabsHeaderDelegate extends SliverPersistentHeaderDelegate {
//   final double topPadding;
//   final Widget child;

//   TabsHeaderDelegate({
//     required this.topPadding,
//     required this.child,
//   });

//   final double _chipsHeight = 58.h;

//   @override
//   double get minExtent => topPadding + _chipsHeight;

//   @override
//   double get maxExtent => topPadding + _chipsHeight;

//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     return Container(
//       color: AppUI.bg,
//       child: Padding(
//         padding: EdgeInsets.only(top: topPadding),
//         child: Container(
//           decoration: BoxDecoration(
//             color: AppUI.bg,
//             boxShadow: overlapsContent
//                 ? const [
//                     BoxShadow(
//                       color: Color(0x0A000000),
//                       blurRadius: 10,
//                       offset: Offset(0, 3),
//                     ),
//                   ]
//                 : null,
//           ),
//           alignment: Alignment.centerLeft,
//           child: child,
//         ),
//       ),
//     );
//   }

//   @override
//   bool shouldRebuild(covariant TabsHeaderDelegate oldDelegate) {
//     return oldDelegate.topPadding != topPadding || oldDelegate.child != child;
//   }
// }

class TabsHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double topPadding;
  final Widget Function(bool isPinned) builder;

  TabsHeaderDelegate({
    required this.topPadding,
    required this.builder,
  });

  final double _chipsHeight = 64.h;

  @override
  double get minExtent => topPadding + _chipsHeight;

  @override
  double get maxExtent => topPadding + _chipsHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // final isPinned = overlapsContent;
    final isPinned = shrinkOffset > 0;
    debugPrint("PINNED $isPinned");

    return Container(
      color: AppUI.bg,
      child: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          decoration: BoxDecoration(
            color: AppUI.bg,
            boxShadow: isPinned
                ? const [
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.centerLeft,
          child: builder(isPinned),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant TabsHeaderDelegate oldDelegate) {
    return oldDelegate.topPadding != topPadding ||
        oldDelegate.builder != builder;
  }
}

// class HomeChips extends StatelessWidget {
//   final String selected;
//   final ValueChanged<String> onChanged;

//   const HomeChips({
//     super.key,
//     required this.selected,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
//       child: Row(
//         children: [
//           _Chip(
//             label: "Alertas da comunidade",
//             selected: selected == "alertas",
//             onTap: () => onChanged("alertas"),
//           ),
//           const SizedBox(width: 10),
//           _Chip(
//             label: "Roubos",
//             selected: selected == "roubos",
//             onTap: () => onChanged("roubos"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomeChips extends StatelessWidget {
//   final String selected;
//   final ValueChanged<String> onChanged;

//   const HomeChips({
//     super.key,
//     required this.selected,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
//       child: Row(
//         children: [
//           _UnderlineTab(
//             label: "Alertas da comunidade",
//             selected: selected == "alertas",
//             onTap: () => onChanged("alertas"),
//           ),
//           const SizedBox(width: 20),
//           _UnderlineTab(
//             label: "Roubos",
//             selected: selected == "roubos",
//             onTap: () => onChanged("roubos"),
//           ),
//         ],
//       ),
//     );
//   }
// }

class HomeChips extends StatelessWidget {
  final String selected;
  final bool isPinned;
  final ValueChanged<String> onChanged;

  const HomeChips({
    super.key,
    required this.selected,
    required this.isPinned,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeOut,
      child: isPinned
          ? _PinnedChips(
              key: const ValueKey('pinned-chips'),
              selected: selected,
              onChanged: onChanged,
            )
          : _UnderlineTabs(
              key: const ValueKey('underline-tabs'),
              selected: selected,
              onChanged: onChanged,
            ),
    );
  }
}

class _UnderlineTabs extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const _UnderlineTabs({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Row(
        children: [
          _UnderlineTab(
            label: "Alertas da comunidade",
            selected: selected == "alertas",
            onTap: () => onChanged("alertas"),
          ),
          const SizedBox(width: 20),
          _UnderlineTab(
            label: "Roubos",
            selected: selected == "roubos",
            onTap: () => onChanged("roubos"),
          ),
        ],
      ),
    );
  }
}

class _UnderlineTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _UnderlineTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selected ? AppUI.primary : Colors.transparent,
              width: 2.4,
            ),
          ),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 180),
          style: TextStyle(
            fontSize: 14,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
            color: selected ? AppUI.textPrimary : AppUI.textSecondary,
            letterSpacing: -0.1,
          ),
          child: Text(
            label,
            style: context.appText.bodymd.copyWith(
              fontWeight: FontWeight.w600,
              color: context.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class _PinnedChips extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const _PinnedChips({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
      child: Row(
        children: [
          _FilledChip(
            label: "Alertas da comunidade",
            selected: selected == "alertas",
            onTap: () => onChanged("alertas"),
          ),
          const SizedBox(width: 10),
          _FilledChip(
            label: "Roubos",
            selected: selected == "roubos",
            onTap: () => onChanged("roubos"),
          ),
        ],
      ),
    );
  }
}

class _FilledChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilledChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          color: selected ? AppUI.primary : AppUI.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected ? AppUI.primary : AppUI.line,
          ),
          boxShadow: selected
              ? const [
                  BoxShadow(
                    color: Color(0x142B5BEE),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: selected ? Colors.white : AppUI.textPrimary,
          ),
        ),
      ),
    );
  }
}

// class _UnderlineTab extends StatelessWidget {
//   final String label;
//   final bool selected;
//   final VoidCallback onTap;

//   const _UnderlineTab({
//     required this.label,
//     required this.selected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       behavior: HitTestBehavior.opaque,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 180),
//         curve: Curves.easeOut,
//         padding: const EdgeInsets.only(bottom: 10),
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: selected ? AppUI.primary : Colors.transparent,
//               width: 2.4,
//             ),
//           ),
//         ),
//         child: AnimatedDefaultTextStyle(
//           duration: const Duration(milliseconds: 180),
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
//             color: selected ? AppUI.textPrimary : AppUI.textSecondary,
//             letterSpacing: -0.1,
//           ),
//           child: Text(label),
//         ),
//       ),
//     );
//   }
// }

// class _Chip extends StatelessWidget {
//   final String label;
//   final bool selected;
//   final VoidCallback onTap;

//   const _Chip({
//     required this.label,
//     required this.selected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 180),
//         curve: Curves.easeOut,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
//         decoration: BoxDecoration(
//           color: selected ? AppUI.primary : AppUI.surface,
//           borderRadius: BorderRadius.circular(24),
//           border: Border.all(
//             color: selected ? AppUI.primary : AppUI.line,
//           ),
//           boxShadow: selected
//               ? const [
//                   BoxShadow(
//                     color: Color(0x142B5BEE),
//                     blurRadius: 10,
//                     offset: Offset(0, 5),
//                   ),
//                 ]
//               : null,
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             fontSize: 13,
//             fontWeight: FontWeight.w600,
//             color: selected ? Colors.white : AppUI.textPrimary,
//           ),
//         ),
//       ),
//     );
//   }
// }

class _Chip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _Chip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : const Color(0xFFF5F7FB),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected ? const Color(0xFFDCE4F2) : const Color(0xFFE9EEF6),
          ),
          boxShadow: selected
              ? const [
                  BoxShadow(
                    color: Color(0x08000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (selected) ...[
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: AppUI.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                color: AppUI.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum CommunityReportType {
  robbery,
  suspicious,
  flood,
  blockedRoad,
  massRobberyRisk,
}

class CommunityReportModel {
  final CommunityReportType type;
  final String title;
  final String date;
  final String location;
  final int confirmations;
  final String imageUrl;
  final List<String> avatars;

  const CommunityReportModel({
    required this.type,
    required this.title,
    required this.date,
    required this.location,
    required this.confirmations,
    required this.imageUrl,
    required this.avatars,
  });
}

// class CommunityReportCardPremium extends StatelessWidget {
//   final CommunityReportModel report;
//   final VoidCallback? onTap;
//   final VoidCallback? onShareTap;
//   final VoidCallback? onSaveTap;

//   const CommunityReportCardPremium({
//     super.key,
//     required this.report,
//     this.onTap,
//     this.onShareTap,
//     this.onSaveTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final badge = _badgeData(report.type);

//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(AppUI.radiusLg),
//         child: Ink(
//           padding: const EdgeInsets.all(14),
//           decoration: BoxDecoration(
//             color: AppUI.surface,
//             // color: Colors.white70,
//             borderRadius: BorderRadius.circular(AppUI.radiusLg),
//             border: Border.all(color: const Color(0xFFF0F3F8)),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color(0x07000000),
//                 blurRadius: 12,
//                 offset: Offset(0, 6),
//               ),
//             ],
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: SizedBox(
//                   // height: 200,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _TypeBadge(
//                         label: badge.label,
//                         bgColor: badge.bgColor,
//                         textColor: badge.textColor,
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         report.title,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontSize: 15.5,
//                           fontWeight: FontWeight.w600,
//                           color: AppUI.textPrimary,
//                           height: 1.3,
//                           letterSpacing: -0.1,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         "${report.date}  •  ${report.location}",
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w500,
//                           color: AppUI.textSecondary,
//                           height: 1.35,
//                         ),
//                       ),
//                       const SizedBox(height: 14),
//                       Row(
//                         children: [
//                           AvatarsStackV2(avatars: report.avatars),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: Text(
//                               "${report.confirmations} confirmações",
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                 fontSize: 13.2,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppUI.textPrimary,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 14),
//               Column(
//                 children: [
//                   _CardImage(imageUrl: report.imageUrl),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       _CircleIconButton(
//                         icon: Icons.ios_share_outlined,
//                         onTap: onShareTap,
//                       ),
//                       const SizedBox(width: 8),
//                       _CircleIconButton(
//                         icon: Icons.bookmark_border_rounded,
//                         onTap: onSaveTap,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _ReportBadgeData _badgeData(CommunityReportType type) {
//     switch (type) {
//       case CommunityReportType.robbery:
//         return const _ReportBadgeData(
//           label: "Roubo",
//           bgColor: AppUI.dangerSoft,
//           textColor: AppUI.dangerText,
//         );
//       case CommunityReportType.suspicious:
//         return const _ReportBadgeData(
//           label: "Atividade suspeita",
//           bgColor: AppUI.infoSoft,
//           textColor: AppUI.infoText,
//         );
//       case CommunityReportType.flood:
//         return const _ReportBadgeData(
//           label: "Alagamento",
//           bgColor: AppUI.infoSoft,
//           textColor: AppUI.infoText,
//         );
//       case CommunityReportType.blockedRoad:
//         return const _ReportBadgeData(
//           label: "Rua interditada",
//           bgColor: AppUI.warningSoft,
//           textColor: AppUI.warningText,
//         );
//       case CommunityReportType.massRobberyRisk:
//         return const _ReportBadgeData(
//           label: "Risco de arrastão",
//           bgColor: AppUI.warningSoft,
//           textColor: AppUI.warningText,
//         );
//     }
//   }
// }

class _ReportBadgeData {
  final String label;
  final Color bgColor;
  final Color textColor;

  const _ReportBadgeData({
    required this.label,
    required this.bgColor,
    required this.textColor,
  });
}

class _TypeBadge extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Color textColor;

  const _TypeBadge({
    required this.label,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11.4,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  final String imageUrl;

  const _CardImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppUI.radiusMd),
      child: SizedBox(
        width: 112,
        height: 82,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return Container(
              color: const Color(0xFFEFF3FA),
              alignment: Alignment.center,
              child: const Icon(
                Icons.image_outlined,
                color: Color(0xFF8A93A8),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _CircleIconButton({
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(99),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F7FB),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          size: 16.5,
          color: AppUI.textSecondary,
        ),
      ),
    );
  }
}

class AvatarsStackV2 extends StatelessWidget {
  final List<String> avatars;
  final double size;
  final double overlap;
  final int maxVisible;

  const AvatarsStackV2({
    super.key,
    required this.avatars,
    this.size = 24,
    this.overlap = 8,
    this.maxVisible = 3,
  });

  @override
  Widget build(BuildContext context) {
    final visibleAvatars = avatars.take(maxVisible).toList();
    final extraCount = avatars.length - visibleAvatars.length;
    final totalItems = visibleAvatars.length + (extraCount > 0 ? 1 : 0);

    final width =
        totalItems <= 1 ? size : size + ((totalItems - 1) * (size - overlap));

    return SizedBox(
      width: width,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < visibleAvatars.length; i++)
            Positioned(
              left: i * (size - overlap),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x12000000),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: const Color(0xFFE8EAF3),
                  backgroundImage: NetworkImage(visibleAvatars[i]),
                ),
              ),
            ),
          if (extraCount > 0)
            Positioned(
              left: visibleAvatars.length * (size - overlap),
              child: Container(
                width: size,
                height: size,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F3F8),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.8),
                ),
                child: Text(
                  "+$extraCount",
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppUI.textSecondary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class EventModel {
  final String title;
  final String date;
  final String subtitle;
  final int confirmations;
  final String imageUrl;
  final List<String> avatars;
  final bool isSaved;

  const EventModel({
    required this.title,
    required this.date,
    required this.subtitle,
    required this.confirmations,
    required this.imageUrl,
    required this.avatars,
    this.isSaved = false,
  });
}

class CommunityReportCardPremium2 extends StatelessWidget {
  final CommunityReportModel report;
  final VoidCallback? onTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onSaveTap;

  const CommunityReportCardPremium2({
    super.key,
    required this.report,
    this.onTap,
    this.onShareTap,
    this.onSaveTap,
  });

  @override
  Widget build(BuildContext context) {
    final badge = _badgeData(report.type);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Ink(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppUI.surface,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFFEAEFF6)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A101828),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TypeBadge(
                      label: badge.label,
                      bgColor: badge.bgColor,
                      textColor: badge.textColor,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      report.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w800,
                        color: AppUI.textPrimary,
                        height: 1.25,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _MetaLine(
                      icon: Icons.schedule_rounded,
                      text: report.date,
                    ),
                    const SizedBox(height: 6),
                    _MetaLine(
                      icon: Icons.place_rounded,
                      text: report.location,
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Flexible(
                          child: _ConfirmationsPill(
                            avatars: report.avatars,
                            confirmations: report.confirmations,
                          ),
                        ),
                        const SizedBox(width: 8),
                        _ActionIcon(
                          icon: Icons.ios_share_outlined,
                          onTap: onShareTap,
                        ),
                        const SizedBox(width: 8),
                        _ActionIcon(
                          icon: Icons.bookmark_border_rounded,
                          onTap: onSaveTap,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              _PremiumThumb(imageUrl: report.imageUrl),
            ],
          ),
        ),
      ),
    );
  }

  _ReportBadgeData _badgeData(CommunityReportType type) {
    switch (type) {
      case CommunityReportType.robbery:
        return const _ReportBadgeData(
          label: "Roubo",
          bgColor: AppUI.dangerSoft,
          textColor: AppUI.dangerText,
        );
      case CommunityReportType.suspicious:
        return const _ReportBadgeData(
          label: "Atividade suspeita",
          bgColor: AppUI.infoSoft,
          textColor: AppUI.infoText,
        );
      case CommunityReportType.flood:
        return const _ReportBadgeData(
          label: "Alagamento",
          bgColor: AppUI.infoSoft,
          textColor: AppUI.infoText,
        );
      case CommunityReportType.blockedRoad:
        return const _ReportBadgeData(
          label: "Rua interditada",
          bgColor: AppUI.warningSoft,
          textColor: AppUI.warningText,
        );
      case CommunityReportType.massRobberyRisk:
        return const _ReportBadgeData(
          label: "Risco de arrastão",
          bgColor: AppUI.warningSoft,
          textColor: AppUI.warningText,
        );
    }
  }
}

class _PremiumThumb extends StatelessWidget {
  final String imageUrl;

  const _PremiumThumb({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 88,
        height: 116,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F4FA),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  color: const Color(0xFFEFF3FA),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_outlined,
                    color: Color(0xFF8A93A8),
                  ),
                );
              },
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0x16000000),
                    Color(0x00000000),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetaLine extends StatelessWidget {
  final IconData icon;
  final String text;

  const _MetaLine({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: AppUI.textTertiary,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12.8,
              fontWeight: FontWeight.w500,
              color: AppUI.textSecondary,
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}

class _ConfirmationsPill extends StatelessWidget {
  final List<String> avatars;
  final int confirmations;

  const _ConfirmationsPill({
    required this.avatars,
    required this.confirmations,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 6, 10, 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F8FC),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFE8EDF5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AvatarsStackV2(
            avatars: avatars,
            size: 22,
            overlap: 8,
            maxVisible: 3,
          ),
          const SizedBox(width: 8),
          Text(
            "$confirmations confirmações",
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppUI.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _ActionIcon({
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7FB),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          size: 17,
          color: AppUI.textSecondary,
        ),
      ),
    );
  }
}

class HomeQuickMenuScrollable extends StatelessWidget {
  final VoidCallback? onReportTap;
  final VoidCallback? onItemsTap;
  final VoidCallback? onTipsTap;
  final VoidCallback? onNearbyTap;

  const HomeQuickMenuScrollable({
    super.key,
    this.onReportTap,
    this.onItemsTap,
    this.onTipsTap,
    this.onNearbyTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
        scrollDirection: Axis.horizontal,
        children: [
          _QuickMenuCard(
            title: "Reportar",
            subtitle: "Nova ocorrência",
            icon: Icons.notification_important_rounded,
            highlighted: true,
            onTap: () {
              WazeAlertController.instance.show(
                const WazeAlertState(title: "", subtitle: ""),
              );
              AlertVibrationStrong.vibrateStrong();
            },
          ),
          const SizedBox(width: 12),
          _QuickMenuCard(
            title: "Meus itens",
            subtitle: "Carro, moto e celular",
            icon: Icons.directions_car_filled_rounded,
            onTap: onItemsTap,
          ),
          const SizedBox(width: 12),
          _QuickMenuCard(
            title: "Dicas",
            subtitle: "Avisos da comunidade",
            icon: Icons.lightbulb_rounded,
            onTap: onTipsTap,
          ),
          const SizedBox(width: 12),
          _QuickMenuCard(
            title: "Próximos",
            subtitle: "Ver incidentes perto",
            icon: Icons.near_me_rounded,
            onTap: onNearbyTap,
          ),
        ],
      ),
    );
  }
}

class _QuickMenuCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool highlighted;
  final VoidCallback? onTap;

  const _QuickMenuCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.highlighted = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = highlighted ? AppUI.primary : AppUI.surface;
    final titleColor = highlighted ? Colors.white : AppUI.textPrimary;
    final subtitleColor =
        highlighted ? Colors.white.withOpacity(.78) : AppUI.textSecondary;
    final iconBg =
        highlighted ? Colors.white.withOpacity(.16) : const Color(0xFFF3F6FB);
    final iconColor = highlighted ? Colors.white : AppUI.primary;
    final borderColor = highlighted ? AppUI.primary : const Color(0xFFE9EEF6);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Ink(
          width: 184,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: borderColor),
            boxShadow: [
              BoxShadow(
                color: highlighted
                    ? const Color(0x1A2B5BEE)
                    : const Color(0x08101828),
                blurRadius: highlighted ? 18 : 12,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: iconBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      size: 20,
                      color: iconColor,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.more_horiz_rounded,
                    size: 18,
                    color: highlighted
                        ? Colors.white.withOpacity(.78)
                        : AppUI.textTertiary,
                  ),
                ],
              ),
              const Spacer(),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: titleColor,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12.2,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                  color: subtitleColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
