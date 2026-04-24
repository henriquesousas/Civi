import 'package:deehelp/core/extension/size_extension.dart';
import 'package:deehelp/v2/feature/location_disable/presentation/widgets/location_content.dart';
import 'package:deehelp/v2/feature/location_disable/presentation/widgets/top_placeholder.dart';
import 'package:flutter/material.dart';

class LocationDisablePage extends StatefulWidget {
  const LocationDisablePage({super.key});

  @override
  State<LocationDisablePage> createState() => _LocationDisablePageState();
}

class _LocationDisablePageState extends State<LocationDisablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  const TopPlaceholder(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: context.percentHeight(0.10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.0),
                            Colors.black.withValues(alpha: 0.75),
                            Colors.black,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const LocationContent(),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
