import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/features/incident/domain/incident.dart';
import 'package:deehelp/features/map/presentation/data.dart';
import 'package:deehelp/features/map/presentation/widget/incident_modal.dart';
import 'package:deehelp/features/map/widgets/map_bottom_content.dart';
import 'package:deehelp/features/map/widgets/map_custom_sliding_up.dart';
import 'package:deehelp/features/map/widgets/map_floating_button.dart';
import 'package:deehelp/features/map/widgets/map_top_menu_button.dart';
import 'package:deehelp/features/map/widgets/osm.dart';
import 'package:deehelp/features/map/widgets/sliding_occurrences_panel.dart';
import 'package:deehelp/features/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../core/ui/theme/dimens.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  static const LatLng _initialLocation = LatLng(-23.5107, -46.8764);
  static const double _initialZoom = 13.0;

  final MapController _mapController = MapController();
  final PanelController _panelController = PanelController();
  late AnimationController _menuAnimationController;
  double _panelPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  @override
  void dispose() {
    _menuAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Stack(
          children: [
            _buildMap(),
            _buildOccurrencesPanel(),
            _buildProfilePanel(),
            _buildTopMenuButton(),
            _buildLocationButton(),
            _buildBottomContent(),
          ],
        ),
      ),
    );
  }

  void _initializeAnimations() {
    _menuAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: 1.0,
    );
  }

  Widget _buildMap() {
    return Osm(
      controller: _mapController,
      initial: _initialLocation,
      item: fakeIncidents,
      press: _showIncidentModal,
    );
  }

  void _showIncidentModal(Incident incident) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) => const IncidentModal(),
    );
  }

  Widget _buildOccurrencesPanel() {
    return MapCustomSlidingUp(
      controller: _panelController,
      minHeight: Dimens.size125.w,
      maxHeight: context.percentHeight(0.9),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      panel: SlidingOccurrencesPanel(
        occurrences: fakeIncidents,
        panelPosition: _panelPosition,
      ),
      onPanelSlide: _handleOccurrencesPanelSlide,
    );
  }

  void _handleOccurrencesPanelSlide(double position) {
    setState(() {
      _panelPosition = position;
      _updateMenuAnimation(position);
    });
  }

  void _updateMenuAnimation(double position) {
    final animationValue = (1 - (position / 0.80)).clamp(0.0, 1.0);
    _menuAnimationController.value = animationValue;
  }

  Widget _buildProfilePanel() {
    return MapCustomSlidingUp(
      controller: _panelController,
      minHeight: 0,
      maxHeight: context.screenHeight,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      panel: ProfilePage(
        onBackButtonPress: _panelController.close,
      ),
      onPanelSlide: _handleProfilePanelSlide,
    );
  }

  void _handleProfilePanelSlide(double position) {
    setState(() {
      _panelPosition = position;
      if (_panelPosition >= 0.15) {
        _menuAnimationController.reverse();
      } else {
        _menuAnimationController.forward();
      }
    });
  }

  Widget _buildTopMenuButton() {
    return MapTopMenuButton(
      animationMenuController: _menuAnimationController,
      press: _panelController.open,
    );
  }

  Widget _buildLocationButton() {
    return MapFloatButton(
      bottom: Dimens.size140.h,
      right: Dimens.size16.w,
      offset: _getLocationButtonOffset(),
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.whiteColor,
      press: _moveToInitialLocation,
      child: Icon(Icons.explore, size: 18.w),
    );
  }

  Offset _getLocationButtonOffset() {
    return _panelPosition >= 0.01 ? const Offset(2.0, 0) : Offset.zero;
  }

  void _moveToInitialLocation() {
    _mapController.move(_initialLocation, _initialZoom);
  }

  Widget _buildBottomContent() {
    return MapBottomContent(
      onNewBemPress: _navigateToMyItems,
      onSinalizePress: _handleSinalizePress,
    );
  }

  void _navigateToMyItems() {
    context.push(RouterConstant.myItems);
  }

  void _handleSinalizePress() {
    // TODO: Implementar funcionalidade de sinalização
  }
}
