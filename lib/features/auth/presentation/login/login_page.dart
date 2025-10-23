import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yousafe/shared/animation/slide_fade_transition_animator.dart';
import 'package:yousafe/shared/extensions/screen_size_extension.dart';

import '../../../../app/theme/app_colors.dart';
import 'components/login_form.dart';
import 'components/login_no_have_account.dart';
import 'components/login_welcome_section.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(20),
        child: LoginNoHaveAccount(),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(context.responsiveText(0.06)),
            child: const SlideFadeTransitionAnimator(
              delay: Duration(milliseconds: 300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginWelcomeSection(),
                  SizedBox(height: 30),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
