import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapCustomSlidingUp extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final Function(double) onPanelSlide;
  final PanelController controller;
  final PanelState panelState;
  final double minHeight;
  final double maxHeight;
  final bool isDraggable;
  final Widget panel;
  const MapCustomSlidingUp({
    super.key,
    required this.onPanelSlide,
    required this.controller,
    required this.minHeight,
    required this.maxHeight,
    required this.panel,
    this.borderRadius,
    this.panelState = PanelState.CLOSED,
    this.isDraggable = true,
  });

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      defaultPanelState: panelState,
      controller: controller,
      minHeight: minHeight, //120.w,
      isDraggable: isDraggable,
      maxHeight: maxHeight,
      borderRadius: borderRadius,
      panel: panel,
      onPanelSlide: (position) => onPanelSlide(position),
    );
  }
}
