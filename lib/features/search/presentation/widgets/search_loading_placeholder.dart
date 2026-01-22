import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SearchLoadingPlaceholder extends StatelessWidget {
  final String query;
  const SearchLoadingPlaceholder({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Buscando "$query"...',
                  style: context.appTextStyles.bodyTextStyle2.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Placeholder para resultados
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Opacity(
                opacity: 0.5,
                child: ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey[200],
                  ),
                  title: Container(
                    height: 16,
                    color: Colors.grey[200],
                    margin: const EdgeInsets.only(right: 100),
                  ),
                  subtitle: Container(
                    height: 12,
                    color: Colors.grey[200],
                    margin: const EdgeInsets.only(right: 50, top: 8),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
