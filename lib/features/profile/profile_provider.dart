import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yousafe/features/profile/profile_view.dart';

import '../welcome/old/state/welcome_bloc.dart';

class ProfileProvider {
  ProfileProvider._();

  static Widget get page {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WelcomeBloc>(
          create: (context) => WelcomeBloc(),
        ),
      ],
      child: ProfileView(),
    );
  }
}
