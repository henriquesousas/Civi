import 'package:deehelp/old_features/faq/faq_page.dart';
import 'package:deehelp/old_features/faq/state/faq_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqProvider {
  FaqProvider._();

  static Widget get page {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FaqBloc>(
          create: (context) => FaqBloc(),
        ),
      ],
      child: const FaqPage(),
    );
  }
}
