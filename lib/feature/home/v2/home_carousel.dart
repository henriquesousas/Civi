import 'package:flutter/material.dart';

class HomeCarousel extends StatefulWidget {
  final List<Widget> cards;

  /// altura do carrossel
  final double height;

  const HomeCarousel({
    super.key,
    required this.cards,
    this.height = 220,
  });

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  final _controller = PageController(viewportFraction: 0.92);
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cards.isEmpty) return const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.cards.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (context, i) {
              // padding lateral pra “respirar”
              return Padding(
                padding: EdgeInsets.only(
                  left: i == 0 ? 0 : 8,
                  right: i == widget.cards.length - 1 ? 0 : 8,
                ),
                child: widget.cards[i],
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        _DotsIndicator(
          count: widget.cards.length,
          index: _index,
        ),
      ],
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  final int count;
  final int index;

  const _DotsIndicator({
    required this.count,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    const active = Color(0xFF2B5BEE);
    const inactive = Color(0xFFE6EAF6);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 6,
          width: isActive ? 18 : 6,
          decoration: BoxDecoration(
            color: isActive ? active : inactive,
            borderRadius: BorderRadius.circular(999),
          ),
        );
      }),
    );
  }
}
