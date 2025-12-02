import 'package:flutter/material.dart';

class RegisterAccountHeaderTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const RegisterAccountHeaderTitle(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
        ),
      ],
    );
  }
}
