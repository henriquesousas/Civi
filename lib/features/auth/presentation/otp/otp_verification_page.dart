import 'package:deehelp/core/ui/extensions/context_extension.dart';
import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/features/auth/presentation/otp/components/otp_header_text.dart';
import 'package:deehelp/features/auth/presentation/otp/components/otp_resend_code.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/widgets/app_bar/ui_app_bar.dart';
import 'components/otp_change_number.dart';
import 'components/otp_code_field.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColorsV2.background,
      // appBar: UIAppBar(title: context.strings.otpAppBar),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            width: context.screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const TransformScaleOpacityAnimator(
                //   child: PrimaryIcon(
                //     borderRadius: 50,
                //     width: 100,
                //     height: 100,
                //     icon: Icon(
                //       Icons.sms_outlined,
                //       color: Colors.white,
                //       size: 48,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 10),
                const OtpHeaderText(phoneNumber: "11972732245"),
                const SizedBox(height: 30),
                const OtpCodeField(),
                const SizedBox(height: 20),
                const OtpResendCode(),
                SizedBox(height: context.percentHeight(0.15)),
                UIElevatedButton(
                    text: "Reenviar código",
                    press: () => context.push(RouterConstant.welcome)),
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
