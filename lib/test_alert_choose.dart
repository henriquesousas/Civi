import 'package:flutter/material.dart';

class TestAlertHomePage extends StatefulWidget {
  const TestAlertHomePage({super.key});

  @override
  State<TestAlertHomePage> createState() => _TestAlertHomePageState();
}

class _TestAlertHomePageState extends State<TestAlertHomePage> {
  String? selectedCategory;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _onCategorySelected(String label) {
    setState(() {
      if (selectedCategory == label) {
        selectedCategory = null;
        _descriptionController.clear();
      } else {
        selectedCategory = label;
      }
    });
  }

  Future<void> _onStartAlertPressed() async {
    final description = _descriptionController.text.trim();

    if (selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecione uma categoria')),
      );
      return;
    }

    if (description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Digite uma descrição')),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => _CountdownAlertDialog(
        category: selectedCategory!,
        description: description,
      ),
    );

    if (confirmed == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Alerta enviado: $selectedCategory'),
        ),
      );

      setState(() {
        selectedCategory = null;
        _descriptionController.clear();
      });
    }
  }

  void _onMicPressed() {
    // Aqui você pode integrar speech_to_text depois.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Microfone clicado'),
      ),
    );
  }

  void _onSubmitAlert() {
    final description = _descriptionController.text.trim();

    if (selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecione uma categoria')),
      );
      return;
    }

    if (description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Digite uma descrição')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Alerta enviado: $selectedCategory - $description',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            const _BackgroundGlow(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    const _TopBar(),
                    const SizedBox(height: 40),
                    const _HeaderSection(),
                    const SizedBox(height: 28),
                    _CategorySection(
                      selectedCategory: selectedCategory,
                      onSelected: _onCategorySelected,
                    ),
                    const SizedBox(height: 24),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: selectedCategory == null
                          ? const SizedBox.shrink()
                          : _DescriptionSection(
                              key: ValueKey(selectedCategory),
                              selectedCategory: selectedCategory!,
                              controller: _descriptionController,
                              onMicPressed: _onMicPressed,
                              onChanged: (_) => setState(() {}),
                            ),
                    ),
                    const SizedBox(height: 28),
                    // const _StartAlertButton(),
                    _StartAlertButton(
                      onTap: _onStartAlertPressed,
                    ),
                    const SizedBox(height: 40),
                    const _BottomActions(),
                    // const SizedBox(height: 20),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     onPressed: _onSubmitAlert,
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: const Color(0xFFFF2D55),
                    //       foregroundColor: Colors.white,
                    //       padding: const EdgeInsets.symmetric(vertical: 18),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(18),
                    //       ),
                    //     ),
                    //     child: const Text(
                    //       'Send Alert',
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w700,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            color: const Color(0xFFFF9500),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          '\$0',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Container(
          width: 46,
          height: 46,
          decoration: const BoxDecoration(
            color: Color(0xFFE7E7E7),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black,
            size: 28,
          ),
        ),
      ],
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "What's happening?",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 34,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.6,
          ),
        ),
        SizedBox(height: 6),
        Text(
          '16 alerts created today',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _CategorySection extends StatelessWidget {
  final String? selectedCategory;
  final ValueChanged<String> onSelected;

  const _CategorySection({
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      ('🚓', 'Police'),
      ('🔥', 'Fire'),
      ('🚑', 'EMS'),
      ('🚧', 'Collision'),
      ('🐾', 'Missing Pet'),
      ('🤝', 'Local Event'),
      ('⌄', 'More'),
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      runSpacing: 14,
      children: items
          .map(
            (item) => _CategoryChip(
              emoji: item.$1,
              label: item.$2,
              isSelected: selectedCategory == item.$2,
              onTap: () => onSelected(item.$2),
            ),
          )
          .toList(),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String emoji;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.emoji,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF2D55) : const Color(0xFF161616),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? Colors.white24 : Colors.transparent,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  final String selectedCategory;
  final TextEditingController controller;
  final VoidCallback onMicPressed;
  final ValueChanged<String> onChanged;

  const _DescriptionSection({
    super.key,
    required this.selectedCategory,
    required this.controller,
    required this.onMicPressed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Describe the $selectedCategory alert',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Add details so people nearby can better understand what is happening.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: controller,
            onChanged: onChanged,
            maxLength: 300,
            minLines: 4,
            maxLines: 8,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Type the description here...',
              hintStyle: const TextStyle(color: Colors.white38),
              filled: true,
              fillColor: const Color(0xFF1A1A1A),
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              counterStyle: const TextStyle(color: Colors.white54),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: onMicPressed,
                  icon: const Icon(
                    Icons.mic_rounded,
                    color: Colors.white,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFFFF2D55),
                  ),
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                minHeight: 48,
                minWidth: 56,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StartAlertButton extends StatefulWidget {
  final VoidCallback onTap;
  const _StartAlertButton({
    required this.onTap,
  });

  @override
  State<_StartAlertButton> createState() => _StartAlertButtonState();
}

class _StartAlertButtonState extends State<_StartAlertButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _glow;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scale = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _glow = Tween<double>(begin: 20, end: 40).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Transform.scale(
            scale: _scale.value,
            child: Container(
              width: 176,
              height: 176,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.redAccent.withOpacity(0.6),
                    blurRadius: _glow.value,
                    spreadRadius: 8,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFF1F3A),
                      Color(0xFFE00017),
                    ],
                  ),
                  border: Border.all(
                    color: const Color(0xFF9D0011),
                    width: 4,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 142,
                    height: 142,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white70,
                        width: 3,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Start\nAlert',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 24,
                          height: 1.15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BottomActions extends StatelessWidget {
  const _BottomActions();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _BottomIcon(icon: Icons.mic_none_rounded),
        SizedBox(width: 36),
        _BottomIcon(icon: Icons.refresh_rounded),
        SizedBox(width: 36),
        _BottomIcon(icon: Icons.bolt_rounded),
      ],
    );
  }
}

class _BottomIcon extends StatelessWidget {
  final IconData icon;

  const _BottomIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.white,
      size: 34,
    );
  }
}

class _BackgroundGlow extends StatelessWidget {
  const _BackgroundGlow();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Color(0xFF020202),
              Colors.black,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 200,
              left: -40,
              right: -40,
              child: Container(
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withOpacity(0.05),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CountdownAlertDialog extends StatefulWidget {
  final String category;
  final String description;

  const _CountdownAlertDialog({
    required this.category,
    required this.description,
  });

  @override
  State<_CountdownAlertDialog> createState() => _CountdownAlertDialogState();
}

class _CountdownAlertDialogState extends State<_CountdownAlertDialog> {
  int secondsLeft = 5;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  Future<void> _startCountdown() async {
    for (int i = 5; i > 0; i--) {
      if (!mounted) return;

      setState(() {
        secondsLeft = i;
      });

      await Future.delayed(const Duration(seconds: 1));
    }

    if (!mounted) return;
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF111111),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0x22FF2D55),
                border: Border.all(
                  color: const Color(0x44FF2D55),
                ),
              ),
              child: Center(
                child: Text(
                  '$secondsLeft',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Sending alert...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.category,
              style: const TextStyle(
                color: Color(0xFFFF2D55),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white12),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
