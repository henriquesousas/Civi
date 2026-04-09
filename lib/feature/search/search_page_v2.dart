import 'dart:async';
import 'dart:math';

import 'package:deehelp/core/extension/date_extension.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/services/permissions/location/domain/current_location.dart';
import 'package:deehelp/core/services/permissions/location/providers/location_providers.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/utils/enum_utils.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/search/search_viewmodel_provider.dart';
import 'package:deehelp/feature/search/widgets/mode_toogle.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearchPageV2 extends ConsumerStatefulWidget {
  const SearchPageV2({super.key});

  @override
  ConsumerState<SearchPageV2> createState() => _SearchPageV2State();
}

class _SearchPageV2State extends ConsumerState<SearchPageV2> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;
  String _search = '';

  void _onSearchChanged() {
    final value = _searchController.text;

    /// cancela timer anterior
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    /// inicia novo timer
    _debounce = Timer(const Duration(milliseconds: 700), () {
      debugPrint('Entrou no _performSearch');
      _performSearch(value);
    });
  }

  void _performSearch(String value) async {
    setState(() {
      _search = value;
      // _isLoading = true;
    });

    /// Aqui você faz a consulta no backend
    // await Future.delayed(const Duration(seconds: 1));

    // setState(() {
    //   _isLoading = false;
    // });

    // exemplo
    // repository.searchReports(value);
    ref.watch(searchViewmodelProvider.notifier).search(
          _search,
          SearchMode.auto,
        );
  }

  void _clearSearch() {
    ref.watch(searchViewmodelProvider.notifier).clear();
    _searchController.clear();
    // setState(() {
    //   _search = '';
    // });
  }

  // void _cancelSearch() async {
  //   FocusScope.of(context).unfocus();
  //   await Future.delayed(const Duration(milliseconds: 500));
  //   if (mounted) {
  //     context.pop();
  //   }
  //   // Navigator.of(context).maybePop();
  // }

  @override
  void initState() {
    super.initState();

    // _searchController.addListener(() {
    //   setState(() {
    //     _search = _searchController.text;
    //   });
    // });
    _searchController.addListener(_onSearchChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // const background = Color(0xFF000000);
    // const dividerColor = Color(0xFF161616);
    // const searchBg = Color(0xFF1C1C1E);
    const hintColor = Color(0xFF8E8E93);
    const secondaryText = Color(0xFF7A7A7A);
    const premiumBorder = Color(0xFF5E5E62);
    const danger = Color(0xFFFF3B30);

    // final viewModel = ref.watch(searchViewmodelProvider.notifier);
    final state = ref.watch(searchViewmodelProvider);
    final currentLocation = ref.watch(currentLocationProvider);

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: context.outline,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 14),
                          const Icon(
                            CupertinoIcons.search,
                            color: hintColor,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              focusNode: _focusNode,
                              style: TextStyle(
                                color: context.primaryTextColor,
                                fontSize: context.safeSp(15),
                                fontWeight: FontWeight.bold,
                              ),
                              // cursorColor: context.primaryBgCard,
                              decoration: InputDecoration(
                                hintText:
                                    'Buscar incidentes, locais, regiões...',
                                fillColor: context.outline,
                                hintStyle: TextStyle(
                                  color: hintColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: context.safeSp(14),
                                ),
                                border: InputBorder.none,
                                isCollapsed: true,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          if (state.isLoading) ...[
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                width: 12.w,
                                height: 12.h,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          ] else ...[
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 180),
                              child: _search.isNotEmpty
                                  ? IconButton(
                                      key: const ValueKey('clear'),
                                      onPressed: _clearSearch,
                                      splashRadius: 18,
                                      icon: const Icon(
                                        CupertinoIcons.xmark_circle_fill,
                                        color: Color(0xFF6E6E73),
                                        size: 18,
                                      ),
                                    )
                                  : const SizedBox(
                                      key: ValueKey('empty'),
                                      width: 8,
                                    ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                // padding: const EdgeInsets.only(bottom: 20),
                separatorBuilder: (context, index) => Container(
                  height: 0,
                  // color: context.outlineVariantColor,
                ),
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return _SearchResultTile(
                    item: state.items[index],
                    currentLocation: currentLocation,
                    danger: danger,
                    secondaryText: secondaryText,
                    premiumBorder: premiumBorder,
                    press: () => context.push(
                      IncidentRouter.detailComunity,
                      extra: state.items[index],
                    ),
                  );
                },
                // children: [
                //   ...state.items.map(
                //     (item) => _SearchResultTile(
                //       item: item,
                //       currentLocation: currentLocation,
                //       danger: danger,
                //       secondaryText: secondaryText,
                //       premiumBorder: premiumBorder,
                //       press: () => context.push(IncidentRouter.detailComunity,
                //           extra: item),
                //     ),
                //   ),
                // ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchResultTile extends StatelessWidget {
  final IncidentOutput item;
  final CurrentLocation? currentLocation;
  final Color danger;
  final Color secondaryText;
  final Color premiumBorder;
  final VoidCallback press;

  const _SearchResultTile({
    required this.item,
    required this.currentLocation,
    required this.danger,
    required this.secondaryText,
    required this.premiumBorder,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    final isOldIncident = item.occurredAt.isOlderThanDays(7);
    final highlightColor = isOldIncident ? const Color(0xFF8E8E93) : danger;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: press,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: context.primaryBgCard,
            // borderRadius: BorderRadius.circular(1),
            border: Border.all(
              color: context.outlineVariantColor,
              width: 1,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _LeadingIcon(
                iconColor: context.primaryTextColor,
                backgroundColor: context.outline,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Header(
                      title: _getTitle(item),
                      isVerified: item.visibilty,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _buildAddressLabel(item),
                      style: TextStyle(
                        color: highlightColor,
                        fontSize: context.safeSp(12),
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _getSummary(item, currentLocation),
                      style: TextStyle(
                        color: secondaryText,
                        fontSize: context.safeSp(12),
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _SourceInfo(
                      isPlatformGenerated: item.isPlatformGenerated,
                      secondaryText: secondaryText,
                      textColor: context.primaryTextColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _buildAddressLabel(IncidentOutput item) {
    final address = item.local?.address;

    if (address == null || address.trim().isEmpty) {
      return 'Próximo a você';
    }

    return 'Próximo a $address';
  }

  String _getTitle(IncidentOutput item) {
    final productName = item.product?.name;

    if (item.product?.type == ItemType.moto.name) {
      return '${productName ?? "Moto"} roubada';
    }

    if (item.product?.type == ItemType.car.name) {
      return '${productName ?? "Carro"} roubado';
    }

    if (item.product?.type == ItemType.phone.name) {
      return '${productName ?? "Celular"} roubado';
    }

    return EnumUtils.fromString(ItemType.values, item.productType)
        .labelRouberry;
  }

  String _getSummary(IncidentOutput item, CurrentLocation? currentLocation) {
    final parts = <String>[];

    parts.add(item.occurredAt.timeAgo());

    if (currentLocation != null &&
        item.local?.latitue != null &&
        item.local?.longitude != null) {
      final distance = DistanceUtils.formatDistance(
        startLatitude: currentLocation.latitude,
        startLongitude: currentLocation.longitude,
        endLatitude: item.local!.latitue!,
        endLongitude: item.local!.longitude!,
      );

      if (distance.isNotEmpty) {
        parts.add('$distance de você');
      }
    }

    final city = item.region?.city ?? item.local?.city;
    final state = item.region?.state ?? item.local?.state;

    if (city != null && city.trim().isNotEmpty) {
      parts.add(city);
    }

    if (state != null && state.trim().isNotEmpty) {
      parts.add(state);
    }

    return parts.join(' · ');
  }
}

class _LeadingIcon extends StatelessWidget {
  final Color iconColor;
  final Color backgroundColor;

  const _LeadingIcon({
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        CupertinoIcons.arrow_up_right,
        size: 18,
        color: iconColor.withValues(alpha: 0.7),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  final bool isVerified;

  const _Header({
    required this.title,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: context.primaryTextColor,
              fontSize: context.safeSp(15),
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
        ),
        if (isVerified) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: context.primaryBgCardLow,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: context.primaryBgCardHigh),
            ),
            child: Text(
              'Verificado',
              style: TextStyle(
                color: context.primaryTextColor,
                fontSize: context.safeSp(10),
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _SourceInfo extends StatelessWidget {
  final bool isPlatformGenerated;
  final Color secondaryText;
  final Color textColor;

  const _SourceInfo({
    required this.isPlatformGenerated,
    required this.secondaryText,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: IconContainerSizes.sm,
          height: IconContainerSizes.sm,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withValues(alpha: 0.10),
            shape: BoxShape.circle,
          ),
          child: isPlatformGenerated
              ? Image.asset(
                  'assets/images/spoken_logo_v2.png',
                  width: IconSizes.xs,
                )
              : Icon(
                  Icons.group,
                  size: IconSizes.xs,
                  color: textColor,
                ),
        ),
        const SizedBox(width: 6),
        Text(
          isPlatformGenerated ? 'Civi' : 'Comunidade',
          style: TextStyle(
            color: secondaryText,
            fontSize: context.safeSp(12),
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
// class _SearchResultTile extends StatelessWidget {
//   // final CiviSearchItem item;
//   final IncidentOutput item;
//   final CurrentLocation? currentLocation;
//   final Color danger;
//   final Color secondaryText;
//   final Color premiumBorder;
//   final VoidCallback press;

//   const _SearchResultTile({
//     required this.item,
//     required this.danger,
//     required this.secondaryText,
//     required this.premiumBorder,
//     required this.currentLocation,
//     required this.press,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final dotColor =
//         item.occurredAt.isOlderThanDays(7) ? const Color(0xFF8E8E93) : danger;

//     return InkWell(
//       onTap: press,
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         color: context.primaryBgCard,
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 35.w,
//                 height: 35.h,
//                 decoration: BoxDecoration(
//                   color: context.outline,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   CupertinoIcons.arrow_up_right,
//                   color: AppColors.grey,
//                   size: 16.w,
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 1),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               _getTitle(item),
//                               style: TextStyle(
//                                 color: context.primaryTextColor,
//                                 fontSize: context.safeSp(16),
//                                 fontWeight: FontWeight.bold,
//                                 height: 1.2,
//                               ),
//                             ),
//                           ),
//                           if (item.visibilty) ...[
//                             const SizedBox(width: 8),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 8,
//                                 vertical: 2,
//                               ),
//                               decoration: BoxDecoration(
//                                 color: context.primaryBgCardLow,
//                                 border: Border.all(
//                                     color: context.primaryBgCardHigh),
//                                 borderRadius: BorderRadius.circular(999),
//                               ),
//                               child: Text(
//                                 'Verificado',
//                                 style: TextStyle(
//                                   color: context.primaryTextColor,
//                                   fontSize: context.safeSp(10),
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ],
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         "Próximo  á ${item.local?.address}",
//                         style: TextStyle(
//                           color: dotColor,
//                           // color: item.isAlert ? danger : secondaryText,
//                           fontWeight: FontWeight.w500,
//                           fontSize: context.safeSp(12),
//                           height: 1.2,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         _getSummary(item, currentLocation),
//                         style: TextStyle(
//                           color: secondaryText,
//                           fontSize: context.safeSp(12),
//                           height: 1.2,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         spacing: 5,
//                         children: [
//                           if (item.isPlatformGenerated) ...[
//                             Container(
//                               width: IconContainerSizes.sm,
//                               height: IconContainerSizes.sm,
//                               decoration: BoxDecoration(
//                                 color: AppColors.primaryColor
//                                     .withValues(alpha: 0.1),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Image.asset(
//                                 "assets/images/spoken_logo_v2.png",
//                                 width: IconSizes.xs,
//                               ),
//                             )
//                           ] else ...[
//                             Container(
//                               width: IconContainerSizes.sm,
//                               height: IconContainerSizes.sm,
//                               decoration: BoxDecoration(
//                                 color: AppColors.primaryColor
//                                     .withValues(alpha: 0.1),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Icon(
//                                 Icons.group,
//                                 size: IconSizes.xs,
//                                 // color: Colors.white.withValues(alpha: 0.6),
//                                 color: context.primaryTextColor,
//                               ),
//                             )
//                           ],
//                           Text(
//                             item.isPlatformGenerated ? "Civi" : "Comunidade",
//                             style: TextStyle(
//                               color: secondaryText,
//                               fontSize: context.safeSp(12),
//                               height: 1.2,
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   String _getTitle(IncidentOutput item) {
//     if (item.product?.type == ItemType.moto.name) {
//       return '${item.product?.name} roubada';
//     }
//     if (item.product?.type == ItemType.car.name) {
//       return '${item.product?.name} roubado';
//     }
//     if (item.product?.type == ItemType.phone.name) {
//       return '${item.product?.name} roubado';
//     }

//     return EnumUtils.fromString(ItemType.values, item.productType)
//         .labelRouberry;
//   }
// }

// String _getSummary(IncidentOutput item, CurrentLocation? currentLocation) {
//   String? distance = '';

//   if (currentLocation != null) {
//     distance = DistanceUtils.formatDistance(
//       startLatitude: currentLocation.latitude,
//       startLongitude: currentLocation.longitude,
//       endLatitude: item.local?.latitue ?? 0,
//       endLongitude: item.local?.longitude ?? 0,
//     );

//     distance = "$distance de você · ";
//   }

//   if (item.region != null) {
//     return '${item.occurredAt.timeAgo()} · $distance ${item.region!.city}· ${item.region!.state}';
//   }

//   return '${item.occurredAt.timeAgo()} · $distance ${item.local?.city}· ${item.local?.state}';
// }

class CiviSearchItem {
  final String title;
  final String subtitle;
  final String viewedAt;
  final bool isPremium;
  final bool isAlert;

  CiviSearchItem({
    required this.title,
    required this.subtitle,
    required this.viewedAt,
    this.isPremium = false,
    this.isAlert = false,
  });
}

class DistanceUtils {
  static double calculateDistanceInMeters({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    const double earthRadius = 6371000; // metros

    final double dLat = _degreesToRadians(endLatitude - startLatitude);
    final double dLon = _degreesToRadians(endLongitude - startLongitude);

    final double lat1 = _degreesToRadians(startLatitude);
    final double lat2 = _degreesToRadians(endLatitude);

    final double a = sin(dLat / 2) * sin(dLat / 2) +
        sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);

    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  static double calculateDistanceInKm({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    return calculateDistanceInMeters(
          startLatitude: startLatitude,
          startLongitude: startLongitude,
          endLatitude: endLatitude,
          endLongitude: endLongitude,
        ) /
        1000;
  }

  static String formatDistance({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    final meters = calculateDistanceInMeters(
      startLatitude: startLatitude,
      startLongitude: startLongitude,
      endLatitude: endLatitude,
      endLongitude: endLongitude,
    );

    if (meters < 1000) {
      return '${meters.round()} m';
    }

    return '${(meters / 1000).toStringAsFixed(1)} km';
  }

  static double _degreesToRadians(double degree) {
    return degree * pi / 180;
  }
}
