import 'package:app_feature/src/location/base_location_issue_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class GpsDisabledPage extends ConsumerStatefulWidget {
  const GpsDisabledPage({super.key});

  @override
  ConsumerState<GpsDisabledPage> createState() => _GpsDisabledPageState();
}

class _GpsDisabledPageState extends ConsumerState<GpsDisabledPage>
    with WidgetsBindingObserver {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  // }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     ref.read(locationAccessNotifierProvider.notifier).check();
  //   }
  // }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          // style: appTextStyles.sectionTitle3.copyWith(
          //   color: AppColors.whiteColor,
          // ),
        ),
        // backgroundColor: ,
        backgroundColor: Colors.redAccent,
        // behavior: SnackBarBehavior.fixed,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(locationAccessNotifierProvider);

    return BaseLocationIssuePage(
      title: "Ative o GPS",
      message:
          "Para funcionar corretamente, o Kotto precisa acessar sua localização.",
      buttonName: "Ativar GPS",
      // loading: state.maybeMap(
      //   checking: (value) => true,
      //   orElse: () => false,
      // ),
      action: () async {
        await Geolocator.openLocationSettings();
      },
    );
  }
}
