import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/image/export_image.dart';
import 'package:deehelp/v2/feature/occurrence/detail/presentation/widgets/counter_badge.dart';
import 'package:flutter/material.dart';

class SectionMedia extends StatefulWidget {
  final List<String> images;

  const SectionMedia({
    super.key,
    required this.images,
  });

  @override
  State<SectionMedia> createState() => _MediaSectionState();
}

class _MediaSectionState extends State<SectionMedia> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasMultiple = widget.images.length > 1;

    return Container(
      color: context.themeColor.primaryBgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: SizeSpacing.m),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SizeLayoutSpacing.m,
            ),
            child: Text(
              'Veículo',
              style: context.appText.title.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: SizeSpacing.m),
          Stack(
            children: [
              AspectRatio(
                aspectRatio: AspectRatioType.video.value,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: widget.images.length,
                  onPageChanged: (index) {
                    setState(() => currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return CustomNetworkImage(
                      imageUrl: widget.images[index],
                      boxFit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Positioned(
                left: 16,
                top: 16,
                child: Row(
                  spacing: 6,
                  children: [
                    const Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                      size: SizeIcon.s,
                    ),
                    Text(
                      '3,659',
                      style: context.appText.subtitle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 16,
                bottom: 50,
                child: Text(
                  '07:51 AM',
                  style: context.appText.subtitle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 16,
                bottom: 26,
                child: Text(
                  '717 W Baseline Rd',
                  style: context.appText.subtitle.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                left: 16,
                bottom: 6,
                child: Text(
                  'usuario123',
                  style: context.appText.subtitle.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              if (hasMultiple)
                Positioned(
                  right: 14,
                  bottom: 14,
                  child: CounterBadge(
                    currentIndex: currentIndex + 1,
                    length: widget.images.length,
                  ),
                ),
            ],
          ),
          const SizedBox(height: SizeSpacing.m),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SizeLayoutSpacing.m,
            ),
            child: Text(
              'CG Titan 150',
              style: context.appText.title.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: SizeSpacing.s),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SizeLayoutSpacing.m),
            child: Text(
              'Cor preta · Placa final 3241',
              style: context.appText.subtitle.copyWith(
                color: context.themeColor.secundaryTextColor,
              ),
            ),
          ),
          const SizedBox(height: SizeSpacing.xl),
        ],
      ),
    );
  }
}
