import 'dart:ui';

import 'faq_item.dart';

class FaqSection {
  final String title;
  final Color accentColor;
  final List<FaqItem> items;

  const FaqSection({
    required this.title,
    required this.accentColor,
    required this.items,
  });

  FaqSection copyWith({List<FaqItem>? items}) {
    return FaqSection(
      title: title,
      accentColor: accentColor,
      items: items ?? this.items,
    );
  }
}
