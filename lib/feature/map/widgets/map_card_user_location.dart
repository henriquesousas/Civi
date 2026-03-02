import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapCardUserLocation extends StatelessWidget {
  final Offset offset;
  final VoidCallback press;
  final String location;
  const MapCardUserLocation({
    super.key,
    required this.offset,
    required this.press,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(Dimens.size20);

    return Positioned(
      bottom: MediaQuery.of(context).padding.bottom + 150,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: AnimatedSlide(
            offset: offset,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
            child: Material(
              elevation: 6,
              color: Colors.transparent,
              borderRadius: radius,
              child: InkWell(
                borderRadius: radius,
                onTap: press,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: radius,
                    border: Border.all(color: Colors.grey.shade300),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    spacing: 2,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 26.w,
                        height: 26.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor.withValues(alpha: 0.2),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.explore,
                            color: AppColors.primaryColor,
                            size: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        child: Text(
                          location,
                          style: context.appTextStyles.caption1Style.copyWith(
                            color: AppColors.dark,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
