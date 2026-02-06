import 'package:app_core/app_core.dart';
import 'package:app_feature/src/home/presentation/widgets/home_search_field.dart';
import 'package:flutter/material.dart';

class RecentIncidenList extends StatelessWidget {
  final List<RecentIncidentItem> items;

  const RecentIncidenList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final capped = items.length.clamp(0, 5);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Text(
          "Recentes incidentes na sua região",
          style: context.appText.body.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: capped,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = items[index];
            return SurfaceCard(
              onTap: item.onTap,
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  CustomNetworkImage(imageUrl: item.imageUrl),
                  const SizedBox(width: SpacingSize.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.appText.headersm.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: SpacingSize.sm),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: IconSizes.xs,
                              color: AppColors.grey,
                            ),
                            const SizedBox(width: SpacingSize.xs),
                            Expanded(
                              child: Text(
                                item.location,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.appText.body,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: SpacingSize.xs),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.grey,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class RecentIncidentItem {
  final String title;
  final String location;
  final String imageUrl;
  final VoidCallback? onTap;

  RecentIncidentItem({
    required this.title,
    required this.location,
    required this.imageUrl,
    this.onTap,
  });
}
