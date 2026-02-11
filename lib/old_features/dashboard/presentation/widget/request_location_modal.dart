import 'package:deehelp/old_core/providers/location_notifier_provider.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/old_core/ui/widgets/icon/ui_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestLocationModal extends ConsumerStatefulWidget {
  final String title;
  final String message;
  final String buttonTitle;
  final VoidCallback press;
  const RequestLocationModal({
    super.key,
    required this.title,
    required this.message,
    required this.buttonTitle,
    required this.press,
  });

  @override
  ConsumerState<RequestLocationModal> createState() =>
      _RequestLocationModalState();
}

class _RequestLocationModalState extends ConsumerState<RequestLocationModal> {
  // bool _isWorking = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(locationNotifierProvider);
    // final locationNotifier = ref.watch(locationNotifierProvider.notifier);
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
                widget.title,
                style: context.appTextStyles.appBarTitle.copyWith(
                  color: AppColors.textColorHeader,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                textAlign: TextAlign.center,
                widget.message,
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
                      text: widget.buttonTitle,
                      // isLoading: state.isLoading,
                      press: widget.press,
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

  // void _updateIsWorking(bool working) {
  //   setState(() {
  //     _isWorking = working;
  //   });
  // }

  // void _getCurrentLocation() async {
  //   _updateIsWorking(true);
  //   final currentPlace = await LocationService().getCurrentPlace();
  //   if (currentPlace == null) {
  //     // await LocationService().openLocationServiceSettings();
  //   }
  //   ref.watch(locationServicProvider.notifier).state = currentPlace;
  //   _getCurrentLocationFinish(currentPlace);
  // }

  // void _getCurrentLocationFinish(Placemodel? currentPlace) {
  //   _updateIsWorking(false);

  //   if (context.mounted) {
  //     ref.watch(locationServicProvider.notifier).state = currentPlace;
  //     context.pop();
  //   }
  // }
}
