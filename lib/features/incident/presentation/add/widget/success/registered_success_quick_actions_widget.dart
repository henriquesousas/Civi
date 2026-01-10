import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/features/incident/presentation/add/widget/success/quick_action_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisteredSuccessQuickActionsWidget extends StatelessWidget {
  const RegisteredSuccessQuickActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.size20.w),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(Dimens.size20.w),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.25),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          QuickActionTileWidget(
            icon: Icons.people_alt_rounded,
            value: 'Compartilhar',
            label: 'Amigos',
            press: () {
              debugPrint("Amigos");
            },
          ),
          Container(
            width: 1,
            height: Dimens.size40.h,
            color: Colors.white.withValues(alpha: 0.3),
          ),
          QuickActionTileWidget(
            icon: Icons.local_police,
            value: 'Polícia',
            label: 'Ligar',
            press: () {},
          ),
          Container(
            width: 1,
            height: Dimens.size40.h,
            color: Colors.white.withValues(alpha: 0.3),
          ),
          QuickActionTileWidget(
            icon: Icons.shield,
            value: '100%',
            label: 'Confiabilidade',
            press: () {},
          ),
        ],
      ),
    );
  }
}
