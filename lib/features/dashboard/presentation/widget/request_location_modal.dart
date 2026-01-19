import 'package:deehelp/core/providers/location_service_provider.dart';
import 'package:deehelp/core/services/location/location_service.dart';
import 'package:deehelp/core/services/location/place_model.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RequestLocationModal extends ConsumerStatefulWidget {
  const RequestLocationModal({super.key});

  @override
  ConsumerState<RequestLocationModal> createState() =>
      _RequestLocationModalState();
}

class _RequestLocationModalState extends ConsumerState<RequestLocationModal> {
  bool _isWorking = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              UIICon(
                bgColor: AppColors.primaryColor,
                icon: Icon(
                  Icons.location_on,
                  color: AppColors.primaryColor,
                  size: Dimens.size32.sp,
                ),
                isAlpha: true,
              ),
              const SizedBox(height: Dimens.size20),
              Text(
                "Localização automática",
                style: context.appTextStyles.appBarTitle.copyWith(
                  color: AppColors.textColorHeader,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                textAlign: TextAlign.center,
                "O acesso a localização do seu aparelho facilita a visualização dos incidentes na sua região.",
                style: context.appTextStyles.bodyTextStyle1.copyWith(
                  color: AppColors.textColorBody,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: UIElevatedButton(
                      text: "Permitir localização automática",
                      isLoading: _isWorking,
                      press: () async {
                        _getCurrentLocation();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _updateIsWorking(bool working) {
    setState(() {
      _isWorking = working;
    });
  }

  void _getCurrentLocation() async {
    _updateIsWorking(true);
    final currentPlace = await LocationService().getCurrentPlace();
    ref.watch(locationServicProvider.notifier).state = currentPlace;
    _getCurrentLocationFinish(currentPlace);
  }

  void _getCurrentLocationFinish(Placemodel? currentPlace) {
    _updateIsWorking(false);

    if (context.mounted) {
      ref.watch(locationServicProvider.notifier).state = currentPlace;
      context.pop();
    }
  }
}
