import 'package:flutter/material.dart';

class TestBottom extends StatefulWidget {
  const TestBottom({super.key});

  @override
  State<TestBottom> createState() => _TestBottomState();
}

class _TestBottomState extends State<TestBottom> {
  int currentIndex = 2;

  final List<String> labels = [
    'News',
    'Home',
    'Go Live',
    'Alerts',
    'Profile',
  ];

  final List<IconData> icons = [
    Icons.public,
    Icons.navigation_outlined,
    Icons.crop_square_outlined,
    Icons.notifications_none,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          'Conteúdo da tela',
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: Container(
        height: 92,
        decoration: const BoxDecoration(
          color: Colors.black,
          border: Border(
            top: BorderSide(
              color: Color(0xFF1C1C1E),
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(labels.length, (index) {
              final bool isSelected = currentIndex == index;

              return Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildIcon(index, isSelected),
                      const SizedBox(height: 6),
                      Text(
                        labels[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white54,
                          fontSize: 12,
                          fontWeight:
                              isSelected ? FontWeight.w500 : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(int index, bool isSelected) {
    if (index == 2) {
      return Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white54,
            width: 1.4,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Icon(
            icons[index],
            size: 20,
            color: isSelected ? Colors.white : Colors.white54,
          ),
        ),
      );
    }

    return Icon(
      icons[index],
      size: 28,
      color: isSelected ? Colors.white : Colors.white54,
    );
  }
}
