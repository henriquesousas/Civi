import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      padding: const EdgeInsets.all(RadiusSize.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(RadiusSize.lg),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          const ProfileImageWithUploadButtonWidget(
            imageAlt: "Joao silva",
          ),
          const SizedBox(width: SpacingSize.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'João da Silva',
                  style: context.appText.headermd.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: SpacingSize.xxs),
                Text(
                  'joao@email.com',
                  style: context.appText.bodySmall.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // const Icon(Icons.chevron_right, color: Color(0xFF8A96C8)),
        ],
      ),
    );
  }
}
