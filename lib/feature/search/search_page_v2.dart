import 'dart:async';
import 'dart:math';

import 'package:deehelp/core/extension/date_extension.dart';
import 'package:deehelp/core/extension/size_extension.dart';
import 'package:deehelp/core/services/permissions/location/domain/current_location.dart';
import 'package:deehelp/core/services/permissions/location/providers/location_providers.dart';
import 'package:deehelp/feature/incidents/list/widgets/fake_incident_list_model.dart';
import 'package:deehelp/feature/search/search_viewmodel_provider.dart';
import 'package:deehelp/feature/search/widgets/mode_toogle.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  bool _isLoading = false;

  // final List<CiviSearchItem> _allItems = [
  //   CiviSearchItem(
  //     title: 'Moto roubada avistada na Av. Brasil',
  //     subtitle: '1.2 km · Av. Brasil, Centro',
  //     viewedAt: 'Visto em março 14',
  //     isPremium: false,
  //     isAlert: true,
  //   ),
  //   CiviSearchItem(
  //     title: 'Celular furtado próximo à estação',
  //     subtitle: '850 m · Estação Barueri',
  //     viewedAt: 'Visto em março 14',
  //     isPremium: false,
  //   ),
  //   CiviSearchItem(
  //     title: 'Tentativa de roubo em veículo estacionado',
  //     subtitle: '2.4 km · Rua da Prata, 120',
  //     viewedAt: 'Visto em março 13',
  //     isPremium: true,
  //   ),
  //   CiviSearchItem(
  //     title: 'Carro suspeito circulando na região',
  //     subtitle: '3.1 km · Alphaville Industrial',
  //     viewedAt: 'Visto em março 13',
  //     isPremium: true,
  //   ),
  //   CiviSearchItem(
  //     title: 'Roubo de bicicleta registrado',
  //     subtitle: '620 m · Parque Municipal',
  //     viewedAt: 'Visto em março 12',
  //     isPremium: false,
  //   ),
  //   CiviSearchItem(
  //     title: 'Movimentação suspeita em condomínio',
  //     subtitle: '1.7 km · Av. Andromeda',
  //     viewedAt: 'Visto em março 12',
  //     isPremium: true,
  //   ),
  // ];

  // List<CiviSearchItem> get _filteredItems {
  //   if (_search.trim().isEmpty) return _allItems;

  //   final query = _search.toLowerCase();
  //   return _allItems.where((item) {
  //     return item.title.toLowerCase().contains(query) ||
  //         item.subtitle.toLowerCase().contains(query);
  //   }).toList();
  // }

  void _onSearchChanged() {
    final value = _searchController.text;

    /// cancela timer anterior
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    /// inicia novo timer
    _debounce = Timer(const Duration(seconds: 1), () {
      _performSearch(value);
    });
  }

  void _performSearch(String value) async {
    setState(() {
      _search = value;
      _isLoading = true;
    });

    /// Aqui você faz a consulta no backend
    debugPrint("Consultando: $value");

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
    });

    // exemplo
    // repository.searchReports(value);
    ref.watch(searchViewmodelProvider.notifier).search(
          _search,
          SearchMode.auto,
        );
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _search = '';
      _isLoading = false;
    });
  }

  void _cancelSearch() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).maybePop();
  }

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
    const background = Color(0xFF000000);
    const dividerColor = Color(0xFF161616);
    const searchBg = Color(0xFF1C1C1E);
    const hintColor = Color(0xFF8E8E93);
    const secondaryText = Color(0xFF7A7A7A);
    const premiumBorder = Color(0xFF5E5E62);
    const danger = Color(0xFFFF3B30);

    // final viewModel = ref.watch(searchViewmodelProvider.notifier);
    final state = ref.watch(searchViewmodelProvider);
    final currentLocation = ref.watch(currentLocationProvider);

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: searchBg,
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
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              cursorColor: Colors.white,
                              decoration: const InputDecoration(
                                hintText: 'Buscar incidentes, locais, regiões',
                                fillColor: searchBg,
                                hintStyle: TextStyle(
                                  color: hintColor,
                                  fontSize: 15,
                                ),
                                border: InputBorder.none,
                                isCollapsed: true,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          _isLoading
                              ? const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: SizedBox(
                                      width: 12,
                                      height: 12,
                                      child: CircularProgressIndicator()),
                                )
                              : AnimatedSwitcher(
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
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: _cancelSearch,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: dividerColor,
            ),
            Expanded(
              child: state.when(
                data: (data) {
                  return ListView(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    children: [
                      ...data.map(
                        (item) => _SearchResultTile(
                          item: item,
                          currentLocation: currentLocation,
                          danger: danger,
                          secondaryText: secondaryText,
                          premiumBorder: premiumBorder,
                        ),
                      ),
                    ],
                  );
                },
                error: (error, stackTrace) => const _EmptySearchState(),
                loading: () => const _EmptySearchState(),
              ),
              // childs: _filteredItems.isEmpty
              //     ? const _EmptySearchState()
              //     : ListView(
              //         padding: const EdgeInsets.only(top: 10, bottom: 20),
              //         children: [
              //           ..._filteredItems.map(
              //             (item) => _SearchResultTile(
              //               item: item,
              //               danger: danger,
              //               secondaryText: secondaryText,
              //               premiumBorder: premiumBorder,
              //             ),
              //           ),
              //         ],
              //       ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchResultTile extends StatelessWidget {
  // final CiviSearchItem item;
  final IncidentOutput item;
  final CurrentLocation? currentLocation;
  final Color danger;
  final Color secondaryText;
  final Color premiumBorder;

  const _SearchResultTile({
    required this.item,
    required this.danger,
    required this.secondaryText,
    required this.premiumBorder,
    required this.currentLocation,
  });

  @override
  Widget build(BuildContext context) {
    final dotColor =
        item.occurredAt.isOlderThanDays(7) ? danger : const Color(0xFF8E8E93);

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                color: Color(0xFF252527),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 10.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            _getTitle(item),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.safeSp(13),
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                        ),
                        //TODO: Premium
                        if (true) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: premiumBorder),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              'Premium',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: context.safeSp(10),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Próximo  á ${item.local?.address}",
                      style: TextStyle(
                        color: danger,
                        // color: item.isAlert ? danger : secondaryText,
                        fontSize: context.safeSp(12),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getSummary(item, currentLocation),
                      style: TextStyle(
                        color: secondaryText,
                        fontSize: 13,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTitle(IncidentOutput item) {
    if (item.product.type == ItemType.moto.name) {
      return '${item.product.name} roubada';
    }
    if (item.product.type == ItemType.car.name) {
      return '${item.product.name} roubado';
    }
    return '${item.product.name} roubado';
  }
}

String _getSummary(IncidentOutput item, CurrentLocation? currentLocation) {
  String? distance = '';

  if (currentLocation != null) {
    distance = DistanceUtils.formatDistance(
      startLatitude: currentLocation.latitude,
      startLongitude: currentLocation.longitude,
      endLatitude: item.local?.latitue ?? 0,
      endLongitude: item.local?.longitude ?? 0,
    );

    distance = "$distance de você · ";
  }

  if (item.region != null) {
    return '${item.occurredAt.timeAgo()} · $distance ${item.region!.city}· ${item.region!.state}';
  }

  return '${item.occurredAt.timeAgo()} · $distance ${item.local?.city}· ${item.local?.state}';
}

class _EmptySearchState extends StatelessWidget {
  const _EmptySearchState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.search,
              color: Color(0xFF7A7A7A),
              size: 34,
            ),
            SizedBox(height: 14),
            Text(
              'Nenhum resultado encontrado',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Tente buscar por incidente, bairro, rua ou região.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF7A7A7A),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
