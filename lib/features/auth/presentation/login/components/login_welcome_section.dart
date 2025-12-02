import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';

class LoginWelcomeSection extends StatelessWidget {
  const LoginWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const PrimaryIcon(
        //   icon: Icon(
        //     Icons.directions_car_rounded,
        //     color: Colors.white,
        //     size: 32,
        //   ),
        // ),
        const SizedBox(height: 24),
        Text(
          R.strings.welcome,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          R.strings.loginInfo,
          // style: Theme.of(context).textTheme.labelMedium?.copyWith(
          //       color: AppColorsV2.textSecondary,
          //     ),
        ),
      ],
    );
  }
}
