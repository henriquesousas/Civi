import 'package:deehelp/core/ui/animation/slide_fade_transition_animator.dart';
import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      bottomNavigationBar: const LoginNoHaveAccount(),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
      ),
    );
  }
}
