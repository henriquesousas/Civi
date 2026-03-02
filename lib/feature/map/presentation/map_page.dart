import 'package:deehelp/core/extension/size_extension.dart';
import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/widgets/avatar/profile_image_with_upload_button_widget.dart';
import 'package:deehelp/feature/map/presentation/ui_custom_app_card.dart';
import 'package:deehelp/module/incident/domain/entity/incident.dart';
import 'package:deehelp/feature/map/widgets/map_custom_sliding_up.dart';
import 'package:deehelp/feature/map/widgets/map_floating_button.dart';
import 'package:deehelp/feature/map/widgets/osm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../old_core/ui/theme/dimens.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  static const LatLng _initialLocation = LatLng(-23.5107, -46.8764);
  static const double _initialZoom = 13.0;
  bool _showOverlay = true;

  final MapController _mapController = MapController();
  late final AnimatedMapController animatedMapController;
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
            // _buildOccurrencesPanel(),
            // _buildProfilePanel(),
            _buildSearch(),
            _buildCardListProduct(
              [
                "https://img0.icarros.com/dbimg/imgnoticia/4/22491_1",
                "https://t2.tudocdn.net/635883?w=824&h=494",
                "https://cdn.motor1.com/images/mgl/P3GNnX/s3/renault-kwid-outsider-2023.jpg",
                "https://www.webmotors.com.br/wp-content/uploads/2023/06/06130127/Renault-Kwid-Zen-1.0-SCe-Flex-0477-scaled-e1661954263615.webp",
                "",
              ],
            ),
            // _buildTopMenuButton(),
            _buildLocationButton(),
            _buildOccurrencesPanel(context),
            // _buildBottomContent(),
          ],
        ),
      ),
    );
  }

  void _initializeAnimations() {
    animatedMapController =
        AnimatedMapController(mapController: _mapController, vsync: this);
    _menuAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: 1.0,
    );
  }

  Widget _buildMap() {
    return Osm(
      controller: _mapController,
      animatedMapController: animatedMapController,
      initial: _initialLocation,
      item: [],
      press: (value) {
        setState(() {
          // _mapController.move(
          //   LatLng(value.local!.latitue!, value.local!.longitude!),
          //   17.0,
          // );
          animatedMapController.animateTo(
            dest: LatLng(value.local!.latitue!, value.local!.longitude!),
            zoom: 17.0,
            curve: Curves.easeInOut,
            duration: const Duration(seconds: 1),
          );
          _showOverlay = true;
        });
      },
      // press: _showIncidentModal,
      onMapEventMove: () {
        setState(() {
          _showOverlay = false;
        });
      },
    );
  }

  void _showIncidentModal(Incident incident) {
    // showModalBottomSheet(
    //   context: context,
    //   isScrollControlled: true,
    //   useSafeArea: true,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    //   ),
    //   builder: (context) => Container(
    //     color: const Color(0xFFF8FAFC),
    //     child: const IncidentModal(),
    //   ),
    // );
  }

  Widget _buildOccurrencesPanel(BuildContext context) {
    return MapCustomSlidingUp(
      controller: _panelController,
      minHeight: context.percentHeight(0.15.h),
      maxHeight: context.percentHeight(0.9),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      // panel: SlidingOccurrencesPanel(
      //   occurrences: fakeIncidents,
      //   panelPosition: _panelPosition,
      // ),
      panel: _buildPanelWidget(context),
      onPanelSlide: _handleOccurrencesPanelSlide,
    );
  }

  Widget _buildPanelWidget(BuildContext context) {
    // return SelectableRow();
    final options = [
      "Todos",
      "Carros",
      "Caminhão",
      "Moto",
    ];
    var selectedIndex = 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Center(child: UIDivider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Osasco, São Paulo",
              // style: context.appTextStyles.sectionTitle3.copyWith(
              //   fontWeight: FontWeight.w500,
              //   fontSize: 20.sp,
              // ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 5,
            children: [
              // Expanded(
              //   child: UIElevatedButton(
              //     bgColor: AppColors.whiteColor,
              //     borderColor: AppColors.primaryColor,
              //     textColor: AppColors.primaryColor,
              //     icon: const Icon(
              //       Icons.add,
              //       color: AppColors.primaryColor,
              //     ),
              //     text: "Novo patrimônio",
              //     // radius: 8,
              //     press: () {},
              //   ),
              // ),
              // Expanded(
              //   child: UIElevatedButton(
              //     icon: Icon(Icons.campaign_outlined),
              //     text: "Emitir alerta",
              //     // radius: 8,
              //     press: () {},
              //   ),
              // ),
            ],
          )
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: List.generate(options.length, (index) {
          //     // final isSelected = selectedIndex == index;
          //     final isSelected = selectedIndex == index;

          //     return Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 6),
          //       child: ChoiceChip(
          //         showCheckmark: false,
          //         backgroundColor: AppColors.primaryColor.withValues(alpha: 0.1),
          //         selectedColor: AppColors.darkGreyColor10.withValues(alpha: 0.3),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(8),
          //           side: BorderSide(
          //             color: isSelected
          //                 ? AppColors.greyColor
          //                 : AppColors.primaryColor.withValues(alpha: 0.0),
          //             width: 1,
          //           ),
          //         ),
          //         label: Text(
          //           options[index],
          //           style: context.appTextStyles.sectionSubTitle1.copyWith(
          //             color: isSelected
          //                 ? AppColors.darkGreyColor
          //                 : AppColors.primaryColor.withValues(alpha: 0.8),
          //             fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
          //           ),
          //         ),
          //         selected: isSelected,
          //         onSelected: (selected) {
          //           setState(() {
          //             // selectedIndex = index;
          //           });
          //         },
          //       ),
          //     );
          //   }),
          // ),
        ],
      ),
    );
  }

  Widget _buildCardProduct(String url) {
    return UICustomAppCard(
      // borderColor: Colors.lightGreyColor20,
      showShadow: true,
      child: SizedBox(
        width: context.percentWidth(0.7),
        child: Column(
          children: [
            Row(
              spacing: 5,
              children: [
                CustomNetworkImage(
                  imageUrl: url,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Renault Sandero 2.0",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        // style: context.appTextStyles.sectionTitle.copyWith(
                        //   fontWeight: FontWeight.bold,
                        //   color: AppColors.darkGreyColor,
                        // ),
                      ),
                      Text(
                        "DND-0000",
                        // style: context.appTextStyles.caption2Style,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12), // Espaço antes da linha
            // const Divider(
            //   color: AppColors.lightGreyColor30,
            //   height: 1,
            //   thickness: 1,
            // ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      "lorem ipsun dads sd ahdj jsahd asdh jdhsa djsahjdh asjkdh jakdh",
                      maxLines: 2,
                      // style: context.appTextStyles.bodyTextStyle1,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_circle_right_outlined,
                  // color: AppColors.darkGreyColor10,
                ),
                // UICategoryButton(
                //   verticalPadding: 8,
                //   horizontalPadding: 8,
                //   text: "Detalhes",
                //   press: () {},
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCardListProduct(List<String> urls) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      bottom: _showOverlay ? context.percentHeight(0.15) : -200.h,
      // bottom: context.percentHeight(0.15),
      left: 12,
      right: 12,
      child: SizedBox(
        height: 200,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          separatorBuilder: (context, index) => SizedBox(width: 8.w),
          scrollDirection: Axis.horizontal,
          itemCount: urls.length,
          itemBuilder: (context, index) => _buildCardProduct(urls[index]),
        ),
      ),
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

  // Widget _buildProfilePanel() {
  //   return MapCustomSlidingUp(
  //     controller: _panelController,
  //     minHeight: 0,
  //     maxHeight: context.screenHeight,
  //     borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
  //     panel: ProfilePage(
  //       onBackButtonPress: _panelController.close,
  //     ),
  //     onPanelSlide: _handleProfilePanelSlide,
  //   );
  // }

  // void _handleProfilePanelSlide(double position) {
  //   setState(() {
  //     _panelPosition = position;
  //     if (_panelPosition >= 0.15) {
  //       _menuAnimationController.reverse();
  //     } else {
  //       _menuAnimationController.forward();
  //     }
  //   });
  // }

  // Widget _buildTopMenuButton() {
  //   return MapTopMenuButton(
  //     animationMenuController: _menuAnimationController,
  //     press: () => context.push(RouterConstant.profile),
  //   );
  // }

  Widget _buildSearch() {
    return Positioned(
      top: context.percentHeight(0.06),
      left: 15,
      right: 15,
      child: GestureDetector(
        onTap: () => {},
        child: SearchBar(
          keyboardType: TextInputType.text,
          trailing: [
            // IconButton(
            //   onPressed: () => context.push(AppRouter.profile),
            //   icon: const Icon(
            //     Icons.filter_list,
            //     color: AppColors.darkGreyColor,
            //   ),
            // ),
          ],
          controller: TextEditingController(),
          focusNode: AlwaysDisabledFocusNode(),
          hintText: "Pesquisar ...",
          // hintStyle: WidgetStateProperty.all(
          //   context.appTextStyles.buttonTextStyle1.copyWith(
          //     color: AppColors.greyColor,
          //   ),
          // ),
          leading: ProfileImageWithUploadButtonWidget(
            radius: 90,
            width: 40,
            height: 40,
            imageUrl:
                "https://www.webmotors.com.br/wp-content/uploads/2023/06/06130127/Renault-Kwid-Zen-1.0-SCe-Flex-0477-scaled-e1661954263615.webp",
            imageAlt: 'Profile',
            showUploadIcon: false,
            onTap: () {
              // debugPrint("Clicou");
              // context.push(AppRouter.profile);
            },
          ),
        ),
      ),
    );
  }

  // Widget _buildLocationButton() {
  //   return MapFloatButton(
  //     // bottom: _showOverlay
  //     //     ? context.percentHeight(0.38.h)
  //     //     : context.percentHeight(0.20.h),
  //     bottom: context.percentHeight(0.38.h),
  //     right: Dimens.size16.w,
  //     offset: _getLocationButtonOffset(),
  //     backgroundColor: AppColors.primaryColor,
  //     foregroundColor: AppColors.whiteColor,
  //     press: _moveToInitialLocation,
  //     child: Icon(Icons.explore, size: 18.w),
  //   );
  // }

  Widget _buildLocationButton() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      bottom: _showOverlay
          ? context.percentHeight(0.38.h)
          : context.percentHeight(0.16.h),
      right: 16,
      curve: Curves.easeInOut,
      child: MapFloatButton(
        bottom: _showOverlay
            ? context.percentHeight(0.38.h)
            : context.percentHeight(0.20.h),
        offset: _getLocationButtonOffset(),
        right: 16,
        // backgroundColor: AppColors.primaryColor,
        // foregroundColor: AppColors.whiteColor,
        press: _moveToInitialLocation,
        child: Icon(Icons.explore, size: 18.w),
      ),
    );
  }

  Offset _getLocationButtonOffset() {
    return _panelPosition >= 0.01 ? const Offset(2.0, 0) : Offset.zero;
  }

  void _moveToInitialLocation() {
    // _mapController.move(_initialLocation, _initialZoom);
    animatedMapController.animateTo(
      dest: _initialLocation,
      zoom: 14,
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 1),
    );
  }

  // Widget _buildBottomContent() {
  //   return MapBottomContent(
  //     onNewBemPress: _navigateToMyItems,
  //     onSinalizePress: _handleSinalizePress,
  //   );
  // }

  void _navigateToMyItems() {
    // context.push(AppRouter.myProducts);
  }

  void _handleSinalizePress() {
    // context.push(AppRouter.reportIncident);
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class SelectableRow extends StatefulWidget {
  const SelectableRow({super.key});

  @override
  State<SelectableRow> createState() => _SelectableRowState();
}

class _SelectableRowState extends State<SelectableRow> {
  int selectedIndex = 0;

  final options = ['Todos', 'Carro', 'Moto', 'Caminhão'];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(options.length, (index) {
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() => selectedIndex = index);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              options[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }),
    );
  }
}
