import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yousafe/app/router/router_config.dart';
import 'package:yousafe/features/auth/otp/components/otp_change_number.dart';
import 'package:yousafe/features/auth/otp/components/otp_code_field.dart';
import 'package:yousafe/features/auth/otp/components/otp_header_text.dart';
import 'package:yousafe/features/auth/otp/components/otp_resend_code.dart';
import 'package:yousafe/shared/animation/transform_scale_opacity_animator.dart';
import 'package:yousafe/shared/components/buttons/primary_button.dart';
import 'package:yousafe/shared/components/icons/primary_icon.dart';
import 'package:yousafe/shared/extensions/context_extension.dart';
import 'package:yousafe/shared/extensions/screen_size_extension.dart';

import '../../../app/theme/app_colors.dart';
import '../../../shared/components/primary_app_bar.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PrimaryAppBar(title: context.strings.otpAppBar),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            width: context.screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TransformScaleOpacityAnimator(
                  child: PrimaryIcon(
                    borderRadius: 50,
                    width: 100,
                    height: 100,
                    icon: Icon(
                      Icons.sms_outlined,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const OtpHeaderText(phoneNumber: "11972732245"),
                const SizedBox(height: 30),
                const OtpCodeField(),
                const SizedBox(height: 20),
                const OtpResendCode(),
                SizedBox(height: context.percentHeight(0.15)),
                PrimaryButton(
                    text: context.strings.otpButtonResendCode,
                    onPressed: () => context.push(Routes.welcome)),
                const SizedBox(height: 20),
                const OtpChangeNumber(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
