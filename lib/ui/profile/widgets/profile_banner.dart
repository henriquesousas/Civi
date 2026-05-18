import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//TODO: Imagem deve ser local
class ProfileBanner extends StatelessWidget {
  const ProfileBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeImage.xxl.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeRadius.m),
          bottomRight: Radius.circular(SizeRadius.m),
        ),
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1519501025264-65ba15a82390?auto=format&fit=crop&w=1400&q=80',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
