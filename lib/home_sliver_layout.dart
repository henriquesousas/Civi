import 'package:deehelp/test_page.dart';
import 'package:flutter/material.dart';

// ===============================
// Sliver Home Layout
// ===============================
class HomeSliverLayout extends StatelessWidget {
  final Widget toolbar;
  final Widget locationBanner;
  final Widget searchField;
  final Widget gridSection;
  final Widget listSection;

  const HomeSliverLayout({
    super.key,
    required this.toolbar,
    required this.locationBanner,
    required this.searchField,
    required this.gridSection,
    required this.listSection,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // ===============================
        // Toolbar
        // ===============================
        // SliverAppBar(
        //   pinned: true,
        //   expandedHeight: 140,
        //   elevation: 8,
        //   flexibleSpace: FlexibleSpaceBar(
        //     background: Padding(
        //       padding: const EdgeInsets.fromLTRB(20, 72, 20, 16),
        //       child: CollapsibleLocationBanner(
        //         location: 'Você está em Osasco, São Paulo',
        //       ),
        //     ),
        //   ),
        // ),

        // ===============================
        // Body Content
        // ===============================
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Location banner
              locationBanner,

              const SizedBox(height: 20),

              // Search field
              searchField,

              const SizedBox(height: 28),

              // Grid section
              gridSection,

              const SizedBox(height: 32),

              // List section
              listSection,
            ]),
          ),
        ),
      ],
    );
  }
}
