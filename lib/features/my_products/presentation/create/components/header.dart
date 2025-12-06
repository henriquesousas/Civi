import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;
  const Header({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          // style: Theme.of(context).textTheme.titleLarge?.copyWith(
          //       fontWeight: FontWeight.bold,
          //     ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          // style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
