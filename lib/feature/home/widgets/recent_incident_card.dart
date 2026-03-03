import 'package:flutter/material.dart';

enum IncidentKind { robbery, theft, recovered }

enum ItemKind { car, motorcycle, phone }

class RecentIncidentItem {
  final String imageUrl;
  final String title;
  final String location;

  const RecentIncidentItem({
    required this.imageUrl,
    required this.title,
    required this.location,
  });
}

class RecentIncidentsCard extends StatelessWidget {
  final List<RecentIncidentItem> items;

  const RecentIncidentsCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE8EEFF)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header do card
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          //   child: Row(
          //     children: [
          //       const Text(
          //         'Recentes incidentes',
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.w900,
          //           color: Color(0xFF111827),
          //         ),
          //       ),
          //       const Spacer(),
          //       TextButton(
          //         onPressed: () {},
          //         style: TextButton.styleFrom(
          //           foregroundColor: AppColors.primaryColor,
          //           padding:
          //               const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(999),
          //           ),
          //         ),
          //         child: const Text(
          //           'Ver todos',
          //           style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // Lista dentro do card + dividers
          for (int i = 0; i < items.length; i++) ...[
            if (i == 0)
              const Divider(height: 1, thickness: 1, color: Color(0xFFE8EEFF))
            else
              const Divider(height: 1, thickness: 1, color: Color(0xFFE8EEFF)),
            _RecentIncidentRow(item: items[i]),
          ],

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _RecentIncidentRow extends StatelessWidget {
  final RecentIncidentItem item;

  const _RecentIncidentRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            _VehicleThumb(url: item.imageUrl),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF111827),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.location,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6B7280),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.chevron_right_rounded, color: Color(0xFF6B7280)),
          ],
        ),
      ),
    );
  }
}

class _VehicleThumb extends StatelessWidget {
  final String url;

  const _VehicleThumb({required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 52,
        height: 52,
        color: Color(0xFFF5F7FD),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Center(
            child: Icon(Icons.directions_car_rounded, color: Color(0xFF6B7280)),
          ),
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          },
        ),
      ),
    );
  }
}

// class _Pill extends StatelessWidget {
//   final String label;
//   final Color bg;
//   final Color fg;

//   const _Pill({required this.label, required this.bg, required this.fg});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       decoration: BoxDecoration(
//         color: bg,
//         borderRadius: BorderRadius.circular(999),
//       ),
//       child: Text(
//         label,
//         style: TextStyle(
//           color: fg,
//           fontSize: 12,
//           fontWeight: FontWeight.w800,
//         ),
//       ),
//     );
//   }
// }

// class _ItemThumb extends StatelessWidget {
//   final String? imageUrl;
//   final bool showPhonePlaceholder;
//   final IconData fallbackIcon;

//   const _ItemThumb({
//     required this.imageUrl,
//     required this.showPhonePlaceholder,
//     required this.fallbackIcon,
//   });

//   bool get _hasImage => (imageUrl != null) && imageUrl!.trim().isNotEmpty;

//   @override
//   Widget build(BuildContext context) {
//     final radius = BorderRadius.circular(16);

//     return ClipRRect(
//       borderRadius: radius,
//       child: Container(
//         width: 64,
//         height: 64,
//         decoration: BoxDecoration(
//           color: const Color(0xFFF2F4F8),
//           borderRadius: radius,
//           border: Border.all(color: Color(0xFFE9EEF8)),
//         ),
//         child: _hasImage
//             ? Image.network(
//                 imageUrl!,
//                 fit: BoxFit.cover,
//                 errorBuilder: (_, __, ___) =>
//                     _ThumbFallback(icon: fallbackIcon),
//               )
//             : showPhonePlaceholder
//                 ? const _ThumbFallback(icon: Icons.smartphone_rounded)
//                 : _ThumbFallback(icon: fallbackIcon),
//       ),
//     );
//   }
// }

// class _ThumbFallback extends StatelessWidget {
//   final IconData icon;
//   const _ThumbFallback({required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Icon(icon, color: const Color(0xFF9AA3B2), size: 30),
//     );
//   }
// }
