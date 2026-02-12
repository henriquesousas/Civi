import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class ImageViewDialog extends StatefulWidget {
  final List<ImageProvider> photos;
  final int initialIndex;

  const ImageViewDialog({
    super.key,
    required this.photos,
    required this.initialIndex,
  });

  @override
  State<ImageViewDialog> createState() => _ImageViewDialogState();
}

class _ImageViewDialogState extends State<ImageViewDialog> {
  late final PageController _ctrl;
  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
    _ctrl = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          PageView.builder(
            controller: _ctrl,
            itemCount: widget.photos.length,
            onPageChanged: (i) => setState(() => index = i),
            itemBuilder: (_, i) {
              return InteractiveViewer(
                minScale: 1.0,
                maxScale: 4.0,
                child: Center(
                  child: Image(image: widget.photos[i], fit: BoxFit.contain),
                ),
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 14,
            right: 14,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SpacingSize.lg,
                    vertical: SpacingSize.xs,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(99),
                    border:
                        Border.all(color: Colors.white.withValues(alpha: 0.18)),
                  ),
                  child: Text(
                    '${index + 1}/${widget.photos.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
