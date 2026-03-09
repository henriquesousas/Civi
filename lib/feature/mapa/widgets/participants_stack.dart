import 'package:flutter/material.dart';

class ParticipantsStack extends StatelessWidget {
  final List<String> avatarUrls;

  const ParticipantsStack({
    super.key,
    required this.avatarUrls,
  });

  @override
  Widget build(BuildContext context) {
    final items = avatarUrls.take(3).toList();

    return SizedBox(
      width: 46,
      height: 20,
      child: Stack(
        clipBehavior: Clip.none,
        children: List.generate(items.length, (index) {
          return Positioned(
            left: index * 12,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.6),
              ),
              child: CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(items[index]),
              ),
            ),
          );
        }),
      ),
    );
  }
}
