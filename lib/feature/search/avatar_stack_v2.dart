import 'package:flutter/material.dart';

class AvatarStackV2 extends StatelessWidget {
  final int count;

  const AvatarStackV2({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    final displayCount = count > 4 ? 4 : count;

    return SizedBox(
      height: 28,
      width: 28 + (displayCount - 1) * 18,
      child: Stack(
        children: [
          for (int i = 0; i < displayCount; i++)
            Positioned(
              left: i * 10,
              child: _AvatarItem(index: i),
            ),
        ],
      ),
    );
  }
}

class _AvatarItem extends StatelessWidget {
  final int index;

  const _AvatarItem({required this.index});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.blueGrey,
      Colors.deepPurple,
      Colors.indigo,
      Colors.teal,
    ];

    return CircleAvatar(
      radius: 8,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 12,
        backgroundColor: colors[index % colors.length],
        child: const Icon(
          Icons.person,
          size: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
