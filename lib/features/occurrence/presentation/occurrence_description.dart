import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OccurrenceDescription extends StatelessWidget {
  final String description;
  const OccurrenceDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.percentWidth(0.5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.description_rounded, size: 16, color: Colors.grey[500]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              description,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[700],
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
