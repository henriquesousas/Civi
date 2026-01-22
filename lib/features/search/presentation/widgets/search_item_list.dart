import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/features/search/presentation/widgets/topo_search.dart';
import 'package:flutter/material.dart';

class SearchItemList extends StatelessWidget {
  final List<SearchResult> results;
  const SearchItemList({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final result = results[index];
        return ListTile(
          leading: const Icon(
            Icons.search,
            color: AppColors.textColorBody,
          ),
          trailing: const Icon(
            Icons.arrow_right_alt_outlined,
            color: AppColors.textSecondary,
          ),
          title: Text(
            result.title,
            style: context.appTextStyles.bodyTextStyle2,
          ),
          subtitle: Text(
            result.subtitle,
            style: context.appTextStyles.caption2Style.copyWith(
              color: AppColors.textColorBody,
            ),
          ),
          onTap: () {
            // Navegar para detalhes do item
            // _navigateToDetails(context, result);
          },
        );
      },
    );
  }
}
