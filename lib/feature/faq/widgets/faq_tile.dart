import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/feature/faq/faq_item.dart';

import 'faq_leading_icon.dart';
import 'package:flutter/material.dart';

class FaqTile extends StatefulWidget {
  final FaqItem item;
  final Color accentColor;

  const FaqTile({super.key, required this.item, required this.accentColor});

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(RadiusSize.lg),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RadiusSize.lg),
            ),
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RadiusSize.lg),
            ),
            initiallyExpanded: false,
            onExpansionChanged: (v) => setState(() => expanded = v),
            tilePadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
            backgroundColor: Colors.transparent,
            collapsedBackgroundColor: Colors.transparent,
            leading: LeadingIcon(
              color: widget.accentColor,
              expanded: expanded,
            ),
            title: Text(
              widget.item.question,
              style: context.appText.bodySmall.copyWith(
                color: context.onSurface,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
            trailing: Icon(
              expanded ? Icons.remove : Icons.add,
              color: context.secondaryColor,
            ),
            children: [
              Text(
                widget.item.answer,
                style: context.appText.bodySmall.copyWith(
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
