import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  final VoidCallback press;
  const EmptyStateWidget({super.key, required this.press});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.primaryColor.withValues(alpha: 0.1);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 1),
              ),
              child: Icon(
                Icons.inventory_2_outlined,
                size: 50,
                color: AppColors.primaryColor.withValues(alpha: 0.9),
              ),
            ),
            Text(
              "R.strings.productNoFound",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "R.strings.productMessageEmpty",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: context.percentWidth(0.6),
              child: ElevatedButton.icon(
                onPressed: press,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                icon: const Icon(Icons.add, size: 16),
                label: Text("R.strings.add"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
