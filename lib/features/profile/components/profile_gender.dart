import 'package:flutter/material.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

import '../../../app/theme/app_colors.dart';

class ProfileGender extends StatefulWidget {
  const ProfileGender({super.key});

  @override
  State<ProfileGender> createState() => _ProfileGenderState();
}

class _ProfileGenderState extends State<ProfileGender>
    with TickerProviderStateMixin {
  String _selectedGender = 'Masculino';

  final List<String> _genderOptions = [
    'Masculino',
    'Feminino',
  ];

  void _selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
      // _hasChanges = true;
    });
    // HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gênero',
          style: context.getTextStyle.mediumSmall.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: _genderOptions.map((gender) {
              final isSelected = _selectedGender == gender;
              return Expanded(
                child: GestureDetector(
                  onTap: () => _selectGender(gender),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      gender,
                      style: context.getTextStyle.small.copyWith(
                        color:
                            isSelected ? Colors.white : AppColors.textSecondary,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
