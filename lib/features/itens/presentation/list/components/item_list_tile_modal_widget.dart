import 'package:flutter/material.dart';

class ItemListTileModalWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const ItemListTileModalWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w400),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}
