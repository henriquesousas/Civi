import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deehelp/features/welcome/old/state/welcome_bloc.dart';
import 'package:deehelp/features/welcome/old/welcome.dart';
import 'package:deehelp/features/welcome/old/welcome_view.dart';

class WelcomeProvider {
  WelcomeProvider._();

  static Widget get page {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WelcomeBloc>(
          create: (context) => WelcomeBloc(),
        ),
      ],
      child: WelcomeView(welcome: Welcome()),
    );
  }
}
