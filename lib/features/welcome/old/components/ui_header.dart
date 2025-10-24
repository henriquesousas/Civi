import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deehelp/features/welcome/old/components/ui_yousafe_text.dart';

import '../state/welcome_bloc.dart';

class UIHeader extends StatelessWidget {
  const UIHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final int currentPage = context.watch<WelcomeBloc>().state.page;

    return Stack(
      children: [
        UIYouSafeText(),
        // UISkip(currentPage: currentPage),
      ],
    );
  }
}
